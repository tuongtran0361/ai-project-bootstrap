# Operational Runbooks

Runbooks explain repeatable operational actions. They complement [project context](../../CONTEXT.md) and [ADRs](../adr/README.md).

## Status values

- `Active`: prerequisites exist and verification evidence has been recorded.
- `Not configured`: a template whose infrastructure or ownership is not ready.
- `Deprecated`: retained for history but no longer used.

## Index

| Runbook | Status | Owner role |
| --- | --- | --- |
| [CI and branch protection](ci-and-branch-protection.md) | Active | Repository owner |
| [GitNexus health and upgrade](gitnexus-health-and-upgrade.md) | Active | Repository owner |
| [Emergency break-glass](emergency-break-glass.md) | Active | Repository owner |
| [Deployment](deployment.md) | Not configured | Release owner |
| [Rollback](rollback.md) | Not configured | Release owner |
| [Incident response](incident-response.md) | Not configured | Incident commander |
| [Observability](observability.md) | Not configured | Service owner |

Every runbook must define status, trigger, prerequisites, stop conditions, execution, verification, rollback or escalation, evidence, closure criteria, owner, and review trigger.
