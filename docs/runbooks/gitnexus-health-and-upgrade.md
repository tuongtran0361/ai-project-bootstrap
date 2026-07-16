# GitNexus Health and Upgrade Runbook

- Status: Active
- Owner role: Repository owner
- Last reviewed: Bootstrap baseline
- Review trigger: GitNexus version, index format, repository path, FTS, embedding, or MCP change

## Purpose and trigger

Prove that the code-intelligence gate is fresh and queryable before risk 2–3 work or after an upgrade.

## Prerequisites and stop conditions

- Access to the authoritative repository index and GitNexus tools.
- Stop risk 2–3 work when registry entries are duplicate/stale, keyword query is degraded, embeddings are missing, or MCP discovery fails.

## Execution

1. Record repository revision, index path, version, node/edge counts, and embedding count.
2. Rebuild or repair only the authoritative index when required.
3. Restart the agent session when refreshed resources are not discoverable.
4. Run keyword and semantic queries, exact context, impact, and change detection.

## Verification, rollback, and evidence

- Require one authoritative registry entry, matching revision, healthy keyword search, persisted embeddings, and relevant semantic results.
- Pin the last healthy version or restore backed-up configuration on upgrade failure.
- Record all health evidence and the blocker transition.

## Closure criteria

Every mandatory signal is healthy; a recent timestamp alone is insufficient.
