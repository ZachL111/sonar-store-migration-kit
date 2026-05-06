# sonar-store-migration-kit

`sonar-store-migration-kit` explores databases with a small Swift codebase and local fixtures. The technical goal is to develop a Swift command-oriented project for migration scenarios with framed sample traffic, bounds and ordering tests, and synthetic fixtures only.

## Project Rationale

The project exists to keep a narrow engineering decision visible and testable. For this repo, that decision is how index fit and constraint risk should influence a review result.

## Sonar Store Migration Kit Review Notes

Start with `index fit` and `join width`. Those cases create the widest score spread in this repo, so they are the best quick check when the model changes.

## Feature Set

- `fixtures/domain_review.csv` adds cases for index fit and join width.
- `metadata/domain-review.json` records the same cases in structured form.
- `config/review-profile.json` captures the read order and the two review questions.
- `examples/sonar-store-migration-walkthrough.md` walks through the case spread.
- The Swift code includes a review path for `index fit` and `join width`.
- `docs/field-notes.md` explains the strongest and weakest cases.

## Architecture

The core code exposes a scoring path and the added review layer uses `signal`, `slack`, `drag`, and `confidence`. The domain terms are `index fit`, `join width`, `constraint risk`, and `plan drift`.

The Swift implementation avoids hidden state so fixture changes are easy to reason about.

## Usage

```powershell
powershell -NoProfile -ExecutionPolicy Bypass -File scripts/verify.ps1
```

## Test Command

The same command runs the local verification path. The highest-scoring domain case is `baseline` at 192, which lands in `ship`. The most cautious case is `stress` at 106, which lands in `watch`.

## Next Improvements

No external service is required. A deeper version would add more negative cases and a clearer boundary around invalid input.
