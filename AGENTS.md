# Agent guidance for {{PROJECT_NAME}}

{{PROJECT_DESCRIPTION}}

## Work tracking

- Repository: {{REPOSITORY_URL}}
- GitHub Project: {{GITHUB_PROJECT_URL}}
- Notion Project Journal: {{NOTION_JOURNAL_URL}}
- GitHub Issues and Projects govern scope, priority, dependencies, and status.
- Pull requests and Actions govern code, review, verification, and merge evidence.

## Risk Gate

- `risk:1`: local, easy to reverse, and no data or public-contract change.
- `risk:2`: cross-module, integration, business-flow, or small migration work.
- `risk:3`: architecture, security, production data, public API, or hard-to-reverse work.
- GitNexus is optional for `risk:1` and mandatory at Gates 1–3 for `risk:2` and `risk:3`.
- Apply `blocked:gitnexus` and stop level 2–3 design, implementation, and merge when GitNexus is stale, duplicate, incomplete, or unable to provide both keyword and semantic query evidence.
- Production break-glass requires explicit owner approval, evidence, rollback ownership, and compensating analysis.

## Source of truth

1. Accepted ADRs and repository documentation.
2. GitHub Issues and the configured Project.
3. Pull requests and Actions evidence.
4. The Notion Project Journal.
5. Agent memory, which is context only and never overrides reviewed sources.

## Change policy

- Run impact analysis before editing an existing function, class, or method.
- Warn before any HIGH or CRITICAL blast radius.
- Run change detection before commit and record the affected scope.
- Preserve core governance, Risk Gate labels, source-of-truth precedence, PR evidence, and the `repository-validation` check identity.
- Never serialize credentials or perform destructive cleanup without a separate explicit approval.

See [project context](CONTEXT.md), [ADRs](docs/adr/README.md), and [runbooks](docs/runbooks/README.md).
