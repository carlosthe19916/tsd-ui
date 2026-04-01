# Agent Progress

## Current focus

**F015 — Theme Adoption Validation in TAS Console**
Wire the existing `@tsd-ui/core` theme system into TAS Console and validate that dark mode works cleanly across representative screens. See `PRD.json` (feature F015) for full acceptance criteria.

## Completed

### F000 — Monorepo Initialization

_Completed 2026-03-04_

Initialized npm workspaces monorepo with three packages (`@tsd-ui/core`, `@tsd-ui/forms`, `@tsd-ui/table-controls`). Configured Turborepo, tsup (ESM + CJS + DTS), strict TypeScript, ESLint (flat config), Prettier, and Vitest. All packages build, typecheck, lint, and test successfully.

### F005 — Pre-commit Hooks (Lint + Format + Typecheck)

_Completed 2026-03-04_

Installed husky v9 with lint-staged. Pre-commit runs ESLint --fix + Prettier on TS/TSX files, then `npm run typecheck`. Verified that lint errors and type errors block commits.

### F006 — Pre-push Hooks (Build + Unit Tests)

_Completed 2026-03-04_

Created `.husky/pre-push` hook running `npm run build` then `npm test`. Verified that build failures and test failures block push.

### F007 — GitHub Actions CI Pipeline

_Completed 2026-03-04_

Created `.github/workflows/ci.yml` triggered on push to main and PRs. Node matrix: 18, 20, 22. Steps: install, lint, typecheck, build, test. Concurrency group cancels in-progress runs.

### F008 — Dependabot Configuration

_Completed 2026-03-04_

Created `.github/dependabot.yml` with weekly npm updates (dev-dependency grouping) and weekly GitHub Actions updates. Security updates enabled by default.

### F009 — CodeQL Security Scanning

_Completed 2026-03-04_

Created `.github/workflows/codeql.yml` for JavaScript/TypeScript analysis. Runs on push, PRs, and weekly schedule. SARIF results upload to Security tab.

### F001 — Architectural Boundary Definition

_Completed 2026-03-04_

Defined three-layer architecture (Core → Wrappers → App Adapters). Created types for all layers. Added boundary enforcement tests (29 tests across 3 packages) that scan source files for forbidden imports. Documented in ADR (`docs/architecture.md`).

## In progress

### F015 — Theme Adoption Validation in TAS Console

_Status: Planned / ready to start_

The theme infrastructure exists in `packages/core/src/components/Theme/` and is exported from `@tsd-ui/core`. Next step is wiring it into TAS Console and validating the integration. See `PRD.json` (feature F015) for detailed verification steps and acceptance criteria.

## Next up

1. **F016** — Theme Hardening and Documentation
2. **F020** — Extract Core Utility Hooks
3. **F010** — Extract HookFormPF Core Components (deferred from original plan)
4. **F030** — Extract Table Control System
5. **F040** — Internal Adoption Validation Across Two Apps
6. **F050** — PatternFly Upstream Readiness Assessment
7. **F060** — Upstream Packaging Refactor (conditional on F050)

## Decisions made

- **Theme before forms/tables:** Starting with theme / dark-mode validation is a smaller, lower-risk first proof point than extracting form components or table controls.
- **Flatter architecture:** The three-layer model remains a guiding principle, but pragmatic grouping within `packages/core` is preferred over premature package splitting.
- **Internal adoption first:** Prove reuse in our own apps before investing in PatternFly-compatible packaging or upstream contribution.
- **AI skills/plugins separate:** Productivity tooling and AI agent configuration are a separate initiative and are out of scope for this PRD.
- **Progress in Markdown:** `progress.txt` was replaced by `agent-progress.md` for easier scanning; the PRD stays machine-readable JSON in `PRD.json`.

## Blockers / risks

- **TAS Console access:** F015 requires integration work in TAS Console (external repo). Coordination with that team is needed.
- **PatternFly version compatibility:** `ThemeSelector` uses PF v6 components. If TAS Console pins a different PF version, compatibility shims or version alignment may be needed.
- **Theme persistence strategy:** The current `ThemeProvider` expects `mode` and `setMode` props but does not own persistence. The consuming app must decide how to persist the preference (localStorage, cookie, URL param). This needs documentation.

## Change log

### 2026-04-01 — PRD stays JSON

- Restored `PRD.json` as the canonical PRD; removed `PRD.md` (only progress was meant to move to Markdown).
- Updated `ralph-once.sh` and this file to reference `PRD.json` again.

### 2026-04-01 — Planning migration and roadmap re-baseline

- Migrated progress tracking from `progress.txt` to `agent-progress.md`
- Re-baselined roadmap: theme adoption validation (F015) is now the next milestone, replacing the previously planned HookFormPF extraction (F010)
- Added F015 (Theme Adoption Validation) and F016 (Theme Hardening) to the roadmap
- Deferred F010 (HookFormPF extraction) to after theme and hooks validation
- Documented strategic decisions: start small, flatten architecture, prove adoption before upstreaming
- Marked AI skills/plugins as explicitly out of scope

### 2026-03-04 — Foundation complete

- Completed F000, F005, F006, F007, F008, F009, F001
- Monorepo fully operational with CI, hooks, boundary tests, and architecture documentation
- Original plan pointed to F010 (HookFormPF extraction) as next step

---

## Historical record

<details>
<summary>Original progress entries (from progress.txt)</summary>

#### F000 — Monorepo Initialization [PASSES]

Date: 2026-03-04

- Initialized npm workspaces monorepo with 3 packages: @tsd-ui/core, @tsd-ui/forms, @tsd-ui/table-controls
- Configured turbo.json with build/test/lint/typecheck tasks
- Configured tsup build pipeline (ESM + CJS + DTS) for all packages
- Enabled TypeScript strict mode via tsconfig.base.json
- Configured ESLint (flat config with typescript-eslint) + Prettier
- Configured Vitest with workspace-aware test runner
- All 3 packages build, typecheck, lint, and test successfully

#### F005 — Pre-commit Hooks [PASSES]

Date: 2026-03-04

- Installed and initialized husky (v9) with `prepare` script
- Configured lint-staged (.lintstagedrc) for ESLint --fix + Prettier on TS/TSX, Prettier on other files
- Pre-commit hook runs lint-staged then npm run typecheck
- Verified: lint errors block commit (tested with unused variable)
- Verified: Prettier auto-formats staged files
- Verified: typecheck runs and blocks on type errors

#### F006 — Pre-push Hooks [PASSES]

Date: 2026-03-04

- Created .husky/pre-push hook running `npm run build` then `npm test`
- Verified: build failure would block push (exit code 1)
- Verified: failing test blocks push (simulated with expect(true).toBe(false))
- Fixed invalid JSON comments in PRD.json

#### F007 — GitHub Actions CI Pipeline [PASSES]

Date: 2026-03-04

- Created .github/workflows/ci.yml
- Triggers on push to main and PRs targeting main
- Node matrix: 18, 20, 22
- Steps: npm ci, lint, typecheck, build, test
- Concurrency group cancels in-progress runs on same ref
- Branch protection enforcement is a repo settings step (not automatable via workflow file)

#### F008 — Dependabot Configuration [PASSES]

Date: 2026-03-04

- Created .github/dependabot.yml
- Configured weekly npm dependency updates with dev-dependency grouping (minor+patch)
- Configured weekly GitHub Actions updates
- Security updates enabled by default (Dependabot alerts)
- CI will run on Dependabot PRs via the existing ci.yml workflow

#### F009 — CodeQL Security Scanning [PASSES]

Date: 2026-03-04

- Created .github/workflows/codeql.yml
- Runs on push to main, PRs targeting main, and weekly schedule (Monday 6am UTC)
- Analyzes javascript-typescript via CodeQL autobuild
- Uploads SARIF results to Security tab (requires security-events: write permission)
- High severity alert blocking is configured via GitHub repo settings

#### F001 — Architectural Boundary Definition [PASSES]

Date: 2026-03-04

- Defined three-layer architecture: Core (headless) → Wrappers (PF-aware) → App Adapters
- Created core layer types in @tsd-ui/core: utility types, persistence types, table feature state types, and ITableControlsAdapter interface
- Created wrapper layer types in @tsd-ui/forms and @tsd-ui/table-controls
- Added boundary enforcement tests for all 3 packages (29 tests total)
- Documented architecture in ADR (docs/architecture.md) with layer diagram, import rules, and dependency graph

</details>
