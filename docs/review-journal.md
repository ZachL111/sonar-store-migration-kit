# Review Journal

The cases below are the review handles I would use before changing the implementation.

The local checks classify each case as `ship`, `watch`, or `hold`. That gives the project a small review vocabulary that matches its databases focus without claiming live deployment or external usage.

## Cases

- `baseline`: `index fit`, score 192, lane `ship`
- `stress`: `join width`, score 106, lane `watch`
- `edge`: `constraint risk`, score 148, lane `ship`
- `recovery`: `plan drift`, score 158, lane `ship`
- `stale`: `index fit`, score 187, lane `ship`

## Note

A future change should add new cases before it changes the scoring rule.
