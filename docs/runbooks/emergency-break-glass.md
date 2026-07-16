# Emergency Break-glass Runbook

- Status: Active
- Owner role: Repository owner
- Last reviewed: Bootstrap baseline
- Review trigger: Emergency policy, GitNexus gate, branch protection, or incident procedure change

## Purpose and trigger

Permit the smallest temporary bypass only when waiting for normal gates creates greater immediate production harm.

## Prerequisites and stop conditions

- A production incident Issue, named owner approver, evidence, rollback owner, and compensating-analysis commitment.
- Stop if the event is not production-critical, approval is missing, or the proposed action exceeds containment needs.

## Execution

1. Record trigger, scope, approver, timestamp, expected duration, and rollback.
2. Apply the narrowest reversible bypass.
3. Execute and verify the emergency change.
4. Restore normal controls immediately after containment.

## Verification, rollback, and evidence

- Confirm service recovery, control restoration, audit history, and no untracked bypass remains.
- Roll back the emergency change if verification fails.
- Complete GitNexus analysis, regression tests, root-cause follow-up, and Project Journal update.

## Closure criteria

Production is stable, normal controls are restored, and all compensating work is tracked.
