# {{PROJECT_NAME}} Context

## Purpose

{{PROJECT_DESCRIPTION}}

## Identity

- Project slug: `{{PROJECT_SLUG}}`
- GitHub owner: `{{GITHUB_OWNER}}`
- Repository: {{REPOSITORY_URL}}
- Primary profile: `{{PRIMARY_PROFILE}}`
- Bootstrap version: `{{BOOTSTRAP_VERSION}}`

## Operating model

Idea → GitHub Issue → Risk Gate → plan → isolated implementation → review → `repository-validation` → protected merge → deployment when configured → operational evidence and follow-up.

The owner decides outcomes, priority, and approval of high-risk or irreversible actions. Agents execute within [AGENTS.md](AGENTS.md) and stop when a required gate is unhealthy.

## Source-of-truth precedence

1. Accepted ADRs and repository documentation govern technical decisions.
2. GitHub Issues and Projects govern work state.
3. Pull requests and Actions govern diffs, review, CI, and merge evidence.
4. The Notion Project Journal summarizes current state and evidence.
5. Agent memory is a cache only.

## Current state

- GitHub Project: {{GITHUB_PROJECT_URL}}
- Notion Project Journal: {{NOTION_JOURNAL_URL}}
- Required check: `repository-validation`
- Deployment: Not configured
- Rollback automation: Not configured
- Incident paging and observability: Not configured

## Authoritative documentation

- [Agent guidance](AGENTS.md)
- [ADR index](docs/adr/README.md)
- [Runbook index](docs/runbooks/README.md)

## Update policy

Update this file through the normal Issue, Risk Gate, PR, CI, and protected-merge path whenever the operating model or current readiness materially changes.
