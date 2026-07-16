# CI and Branch Protection Runbook

- Status: Active
- Owner role: Repository owner
- Last reviewed: Bootstrap baseline
- Review trigger: CI workflow, default branch, merge policy, or ruleset change

## Purpose and trigger

Maintain the stable `repository-validation` check and verify effective protection whenever CI or branch governance changes.

## Prerequisites and stop conditions

- Administrative read access and a pull request with a recent check run.
- Stop if the check has never registered, its context differs, or the effective rules cannot be read back.
- Ruleset changes are `risk:3` and require GitNexus gates plus explicit owner approval.

## Execution

1. Run local repository and profile validation.
2. Open a pull request and wait for `repository-validation` to pass.
3. Configure the ruleset to require that exact check, resolved conversations, linear history, and approved merge methods.
4. Read back effective rules and compare every field.

## Verification, rollback, and evidence

- Verify direct pushes are blocked and an allowed PR merge succeeds.
- Restore the previously recorded ruleset if read-back differs; do not claim protection until corrected.
- Record Issue, PR, check-run URL, ruleset identifier, before/after state, and Notion journal link.

## Closure criteria

Local validation, the exact required check, and effective branch rules all match the accepted policy.
