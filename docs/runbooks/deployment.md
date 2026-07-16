# Deployment Runbook

- Status: Not configured
- Owner role: Release owner
- Last reviewed: Bootstrap baseline
- Review trigger: Deployment platform, environment, artifact, migration, or approval change

## Purpose and trigger

Deploy a verified revision to a configured environment. No platform or production endpoint is configured by the bootstrap.

## Prerequisites and stop conditions

- Named environment, immutable artifact, access controls, rollback route, observability, and approved change.
- Stop when CI fails, the revision is ambiguous, required backups are absent, or rollback/observation is unproven.

## Execution

1. Record revision, artifact, environment, owner, risk, and migration plan.
2. Deploy through the approved provider workflow.
3. Run health and critical-journey checks.
4. Observe the configured release window.

## Verification, rollback, and evidence

- Verify release identity, service health, data integrity, jobs, and external contracts.
- Invoke the [rollback runbook](rollback.md) on failed verification.
- Record provider events, CI, artifact digest, observations, and decision owner.

## Closure criteria

The verified revision is stable and evidence is linked from the release Issue and Project Journal.
