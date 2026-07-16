$ErrorActionPreference = 'Stop'
Set-StrictMode -Version Latest

$repoRoot = Split-Path -Parent $PSScriptRoot
$metadataPath = Join-Path $repoRoot '.bootstrap\metadata.json'
if (-not (Test-Path -LiteralPath $metadataPath -PathType Leaf)) {
  throw 'Bootstrap metadata is missing.'
}

$metadata = Get-Content -Raw -Encoding UTF8 -LiteralPath $metadataPath | ConvertFrom-Json
$required = @('schemaVersion', 'projectName', 'projectSlug', 'primaryProfile', 'bootstrapVersion', 'generatedAt', 'manifestDigest', 'appliedPlanHash')
foreach ($name in $required) {
  if ($metadata.PSObject.Properties.Name -notcontains $name) { throw "Bootstrap metadata is missing $name." }
  if ([string]::IsNullOrWhiteSpace([string]$metadata.$name)) { throw "Bootstrap metadata $name is empty." }
}

foreach ($name in $metadata.PSObject.Properties.Name) {
  if ($name -match '(?i)token|password|secret|api[_-]?key|private[_-]?key') {
    throw "Bootstrap metadata contains forbidden key $name."
  }
}

$templateValues = [ordered]@{
  projectName = ('{{' + 'PROJECT_NAME' + '}}')
  projectSlug = ('{{' + 'PROJECT_SLUG' + '}}')
  primaryProfile = ('{{' + 'PRIMARY_PROFILE' + '}}')
  bootstrapVersion = ('{{' + 'BOOTSTRAP_VERSION' + '}}')
}
$isTemplateMetadata = $true
foreach ($name in $templateValues.Keys) {
  if ([string]$metadata.$name -ne $templateValues[$name]) { $isTemplateMetadata = $false }
}
if ($isTemplateMetadata) {
  if ($metadata.generatedAt -ne 'Not generated' -or $metadata.manifestDigest -ne 'Not generated' -or $metadata.appliedPlanHash -ne 'Not applied') {
    throw 'Template metadata sentinels are inconsistent.'
  }
  Write-Output 'BOOTSTRAP_METADATA_TEMPLATE_OK'
  return
}
foreach ($name in $templateValues.Keys) {
  if ([string]$metadata.$name -match '\{\{[A-Z0-9_]+\}\}') { throw 'Bootstrap metadata is partially rendered.' }
}

$parsedGeneratedAt = [DateTimeOffset]::MinValue
if (-not [DateTimeOffset]::TryParse([string]$metadata.generatedAt, [ref]$parsedGeneratedAt)) {
  throw 'Bootstrap metadata generatedAt must be an ISO-8601 timestamp.'
}
if ([string]$metadata.manifestDigest -notmatch '^[a-f0-9]{64}$') {
  throw 'Bootstrap metadata manifestDigest must be a SHA-256 digest.'
}
if ([string]$metadata.appliedPlanHash -notmatch '^[a-f0-9]{64}$') {
  throw 'Bootstrap metadata appliedPlanHash must be a SHA-256 digest.'
}

Write-Output 'BOOTSTRAP_METADATA_OK'
