# Rollback Runbook

- Status: Not configured
- Owner role: Release owner
- Last reviewed: Bootstrap baseline
- Review trigger: Deployment strategy, data model, artifact retention, or recovery change

## Purpose and trigger

Restore the last verified application state after harmful deployment evidence.

## Prerequisites and stop conditions

- Last-known-good artifact, proven rollback mechanism, compatibility assessment, backup evidence, and named owner.
- Stop when rollback would create greater irreversible loss or the target is unverified.

## Execution

1. Record trigger, current and target revisions, impact, and decision owner.
2. Control traffic and background work through the configured platform.
3. Restore the approved artifact and compatible configuration/data state.

## Verification, escalation, and evidence

- Verify the original failing journey, service health, data integrity, jobs, queues, and contracts.
- Escalate to incident response when rollback fails or risk increases.
- Record decisions, revisions, backups, provider events, and observation results.

## Closure criteria

The system is stable on a verified revision and corrective work is tracked.
