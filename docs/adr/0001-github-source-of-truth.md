# ADR 0001: GitHub and repository sources of truth

- Status: Accepted
- Date: Bootstrap baseline
- Deciders: Project owner
- Issue: Not configured
- Supersedes: None
- Superseded by: None

## Context

Agents, GitHub, Notion, repository documents, and memory services can hold overlapping information. Without typed authority, stale summaries can override reviewed decisions or task state.

## Decision

Accepted ADRs and repository docs govern technical decisions. GitHub Issues and Projects govern work state. Pull requests and Actions govern diff, review, CI, and merge evidence. Notion holds the Project Journal. Agent memory is context only.

## Consequences

- Reviewed technical truth remains versioned with the code.
- Important events may need updates in both GitHub and Notion.
- Conflicting sources are corrected explicitly through the normal review path.

## Reversal or supersession

Replace this ADR only when a future system provides equivalent versioning, access control, review, evidence links, and machine-queryable state.

## Evidence

- [Agent guidance](../../AGENTS.md)
- [Project context](../../CONTEXT.md)
