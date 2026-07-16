# ADR 0002: Risk Gate and mandatory GitNexus analysis

- Status: Accepted
- Date: Bootstrap baseline
- Deciders: Project owner
- Issue: Not configured
- Supersedes: None
- Superseded by: None

## Context

The required analysis and oversight must scale with blast radius and reversibility. A fresh index timestamp alone is not proof that code intelligence is usable.

## Decision

Classify implementation work as `risk:1`, `risk:2`, or `risk:3`. GitNexus is optional for risk 1 and mandatory before design, before PR, and before merge for risks 2 and 3. A stale or duplicate registry, missing keyword index, missing embeddings, or degraded query blocks risk 2–3 work with `blocked:gitnexus`.

## Consequences

- Governance effort scales with risk.
- Medium- and high-risk work has explicit blast-radius evidence.
- GitNexus health is an operational dependency.

## Reversal or supersession

A replacement analysis system must preserve or strengthen freshness, relationship, search, persistence, and blocking semantics.

## Evidence

- [GitNexus health runbook](../runbooks/gitnexus-health-and-upgrade.md)
- [Break-glass runbook](../runbooks/emergency-break-glass.md)
