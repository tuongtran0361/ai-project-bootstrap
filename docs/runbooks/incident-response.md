# Incident Response Runbook

- Status: Not configured
- Owner role: Incident commander
- Last reviewed: Bootstrap baseline
- Review trigger: Severity, paging, communication, ownership, or production architecture change

## Purpose and trigger

Coordinate containment, recovery, communication, and learning for material production impact.

## Prerequisites and stop conditions

- Configured severity model, paging, communication, ownership, and safe evidence access.
- Stop speculative or irreversible actions without evidence, approval, and rollback. Use break-glass only for its qualifying trigger.

## Execution

1. Assign incident commander, technical lead, communications owner, and scribe.
2. Record severity, symptoms, scope, start time, and evidence.
3. Contain immediate harm with the smallest safe action.
4. Choose rollback, forward fix, or provider recovery with recorded rationale.

## Verification, escalation, and evidence

- Verify critical journeys, data integrity, security state, background processing, and configured signals.
- Escalate severity as scope, duration, or irreversible risk increases.
- Maintain the timeline, decisions, revisions, communications, and follow-up Issues.

## Closure criteria

The service and data are stable, stakeholders receive closure, and a review decides ADR, runbook, and test changes.
