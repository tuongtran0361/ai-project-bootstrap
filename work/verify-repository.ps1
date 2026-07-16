$ErrorActionPreference = 'Stop'
Set-StrictMode -Version Latest

$repoRoot = Split-Path -Parent $PSScriptRoot
Push-Location $repoRoot
try {
  & "$PSScriptRoot\verify-bootstrap-metadata.ps1"
  if (-not $?) { exit 1 }

  $conflicts = & git grep -n -I -E '^(<<<<<<<|=======|>>>>>>>)' -- . 2>$null
  if ($LASTEXITCODE -eq 0) {
    $conflicts | ForEach-Object { Write-Output "Unresolved conflict marker: $_" }
    exit 1
  }
  if ($LASTEXITCODE -gt 1) { throw 'git grep failed while checking conflict markers.' }

  $badArtifacts = @(& git ls-files -- '*.exe' '*.zip' '.env' '.env.*' 'work/installers/**' 'work/downloads/**')
  if ($LASTEXITCODE -ne 0) { throw 'git ls-files failed while checking repository hygiene.' }
  if ($badArtifacts.Count -gt 0) {
    $badArtifacts | ForEach-Object { Write-Output "Local or sensitive artifact must not be tracked: $_" }
    exit 1
  }

  $missingLinks = [System.Collections.Generic.List[string]]::new()
  $linkPattern = '!?\[[^\]]*\]\((?<target>[^)]+)\)'
  foreach ($relativeFile in @(& git ls-files '*.md')) {
    if ($LASTEXITCODE -ne 0) { throw 'git ls-files failed while finding Markdown files.' }
    $absoluteFile = Join-Path $repoRoot $relativeFile
    $content = Get-Content -Raw -Encoding UTF8 -LiteralPath $absoluteFile
    $prose = [regex]::Replace($content, '(?ms)^```.*?^```\s*$', '')
    foreach ($match in [regex]::Matches($prose, $linkPattern)) {
      $target = ($match.Groups['target'].Value.Trim() -split '#', 2)[0]
      if ([string]::IsNullOrWhiteSpace($target) -or $target -match '^(https?://|mailto:|tel:|data:)') { continue }
      if ($target.StartsWith('<') -and $target.EndsWith('>')) { $target = $target.Substring(1, $target.Length - 2) }
      $candidate = Join-Path (Split-Path -Parent $absoluteFile) ([System.Uri]::UnescapeDataString($target))
      if (-not (Test-Path -LiteralPath $candidate)) { $missingLinks.Add("$relativeFile -> $target") }
    }
  }
  if ($missingLinks.Count -gt 0) {
    $missingLinks | ForEach-Object { Write-Output "Missing Markdown target: $_" }
    exit 1
  }

  Write-Output 'REPOSITORY_VALIDATION_OK'
}
finally {
  Pop-Location
}
