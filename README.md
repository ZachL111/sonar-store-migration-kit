# sonar-store-migration-kit

`sonar-store-migration-kit` packages a practical databases exercise in Swift. The emphasis is on deterministic behavior, a small public API, and examples that explain the tradeoffs.

## How I Read Sonar Store Migration Kit

The useful thing to inspect here is how the same score rule is represented in code, metadata, and examples. If those three pieces disagree, the audit script should make the drift visible.

## Problem Shape

This is not a wrapper around a service. It is a self-contained project that shows how the model behaves when demand, capacity, latency, risk, and weight move in different directions.

## Scenario Walkthrough

`degraded` is the first example I would inspect because it lands on the `review` path with a score of 7. The broader file also keeps `degraded` at 7 and `surge` at 212, which gives the model a useful low-to-high spread.

## Internal Model

The interesting part is the boundary between accepted and reviewed scenarios. Extended examples sit near that boundary so future edits can show whether the model became more permissive or more cautious. The Swift project compiles a minimal command-line test harness against the local Windows SDK.

## Main Behaviors

- Models schema shape with deterministic scoring and explicit review decisions.
- Uses fixture data to keep query checks changes visible in code review.
- Includes extended examples for fixture rows, including `surge` and `degraded`.
- Documents constraint behavior tradeoffs in `docs/operations.md`.
- Runs locally with a single verification command and no external credentials.

## How To Run It

```powershell
powershell -NoProfile -ExecutionPolicy Bypass -File scripts/verify.ps1
```

This runs the language-level build or test path against the compact fixture set.

## Validation

```powershell
powershell -NoProfile -ExecutionPolicy Bypass -File scripts/audit.ps1
```

The audit command checks repository structure and README constraints before it delegates to the verifier.

## Repository Map

- `src`: primary implementation
- `tests`: verification harness
- `fixtures`: compact golden scenarios
- `examples`: expanded scenario set
- `metadata`: project constants and verification metadata
- `docs`: operations and extension notes
- `scripts`: local verification and audit commands

## Follow-Up Work

- Add a loader for `examples/extended_cases.csv` and promote selected cases into the language test suite.
- Add a short report command that prints the score breakdown for a single scenario.
- Add malformed input fixtures so the failure path is as visible as the happy path.
- Add one more databases fixture that focuses on a malformed or borderline input.

## Known Edges

The scoring model is simple by design. More domain-specific behavior should be added through explicit adapters or extra fixture classes rather than hidden constants.

## Run It Locally

Use a normal shell with Swift available on `PATH`. The verifier is written as a PowerShell script because the portfolio was assembled on Windows.
