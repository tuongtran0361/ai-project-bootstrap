# Observability Readiness Runbook

- Status: Not configured
- Owner role: Service owner
- Last reviewed: Bootstrap baseline
- Review trigger: Service, provider, SLO, telemetry schema, retention, or alert-routing change

## Purpose and trigger

Define evidence required before telemetry can support deployment and incident decisions.

## Prerequisites and stop conditions

- Named critical journeys, providers, owners, data classification, retention, and release identity.
- Stop activation when sensitive values may be emitted, critical journeys lack signals, or alerts lack ownership.

## Execution

1. Define structured logs, metrics, traces, error monitoring, and redaction.
2. Create dashboards for health, traffic, errors, latency, saturation, and critical journeys.
3. Configure actionable alerts with owner, severity, threshold, and runbook.
4. Add synthetic checks where appropriate.

## Verification, rollback, and evidence

- Generate a controlled event and trace it across configured signals.
- Disable or restrict a source that leaks sensitive data or causes unsafe load/cost.
- Record schemas, dashboards, alert tests, redaction tests, retention, and ownership.

## Closure criteria

Signals correlate to releases, alerts are actionable and owned, and privacy controls pass.
