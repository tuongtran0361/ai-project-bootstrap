# ADR 0003: Solo-owner pull request and merge policy

- Status: Accepted
- Date: Bootstrap baseline
- Deciders: Project owner
- Issue: Not configured
- Supersedes: None
- Superseded by: None

## Context

The repository may be maintained by one owner working with authorized agents. Mandatory self-approval is not meaningful, but direct unverified changes to `main` remove essential evidence.

## Decision

Require pull requests, the stable `repository-validation` check, resolved conversations, linear history, and squash merges. Zero approving reviews may be configured for a solo owner, but the standards and specification review evidence remains required in the PR.

## Consequences

- Every merge has a reviewable diff and CI evidence.
- The owner remains responsible for high-risk approvals.
- Branch settings must preserve the exact required-check identity.

## Reversal or supersession

Revisit required approvals when the contributor or compliance model changes.

## Evidence

- [CI and branch-protection runbook](../runbooks/ci-and-branch-protection.md)
