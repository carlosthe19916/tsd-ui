# TSD UI Reuse Initiative PRD

## Summary

This initiative standardizes reusable UI patterns, practices, hooks, and dependencies across TSD UI projects (TAS Console, TPA, and future apps). Rather than aiming for broad extraction up front, the strategy is to **validate reuse with small, high-confidence wins first** — starting with theme / dark-mode adoption — and expand scope only after real-world adoption proves the approach works.

## Why this changed

The original plan prioritized extracting forms (`HookFormPF`) and table controls as the first phase after foundational setup. That ordering has been revised:

- **Starting with forms and tables was too ambitious.** Those extractions involve complex state management, many components, and tightly coupled patterns. Attempting them first risks stalling adoption behind a long extraction cycle.
- **Theme / dark mode is a smaller and more realistic first proof point.** The theme infrastructure already exists in `@tsd-ui/core` (`ThemeProvider`, `ThemeSelector`, `ThemeContext`). Consuming it in TAS Console is a bounded, low-risk validation.
- **Architecture is being simplified and flattened.** The three-layer architecture (core → wrappers → app adapters) remains a useful mental model, but we are not forcing premature decomposition. Pragmatic grouping wins over theoretical purity at this stage.
- **Internal adoption evidence should come before upstream packaging decisions.** Proving reuse in our own apps is prerequisite to investing in PatternFly-compatible packaging.

## Goals

- Prove reuse in a real consuming application (TAS Console) with the theme system
- Reduce duplication across TAS, TPA, and other org projects over time
- Keep reusable pieces practical, documented, and adoptable
- Build confidence through small validated integrations before tackling larger extractions
- Maintain a credible path toward PatternFly upstream contribution — but do not optimize for it yet

## Non-goals

- **PatternFly upstreaming is not the immediate goal.** That remains a later validation track (F050).
- **AI skills, plugins, and productivity tooling are out of scope** for this PRD. Those efforts are valuable but belong in a separate initiative.
- **Do not over-abstract before reuse is proven.** Premature interfaces and adapter layers add friction without evidence they are needed.
- **Do not optimize for packaging before adoption.** npm publishing, semver strategy, and changelog automation can wait until at least one app is consuming the library.

## Current status

Foundation and guardrails are in place. All Phase 0 and Phase 1 work is complete:

| ID   | Name                              | Status   |
| ---- | --------------------------------- | -------- |
| F000 | Monorepo Initialization           | Complete |
| F005 | Pre-commit Hooks                  | Complete |
| F006 | Pre-push Hooks                    | Complete |
| F007 | GitHub Actions CI Pipeline        | Complete |
| F008 | Dependabot Configuration          | Complete |
| F009 | CodeQL Security Scanning          | Complete |
| F001 | Architectural Boundary Definition | Complete |

The repo has npm workspaces, Turborepo, tsup builds, strict TypeScript, CI with Node 18/20/22 matrix, Dependabot, CodeQL, and boundary enforcement tests across all packages.

Theme components (`ThemeProvider`, `ThemeSelector`, `ThemeContext`) already exist in `packages/core/src/components/Theme/` and are exported from `@tsd-ui/core`.

## Architecture direction

The documented three-layer architecture (ADR-001 in `docs/architecture.md`) remains the guiding model, but the practical approach is flatter and more pragmatic:

- **Keep `packages/core` as the primary reusable package.** Theme, hooks, types, and utilities live here.
- **Allow pragmatic grouping of reusable functionality** within `packages/core` rather than splitting into many small packages prematurely.
- **Preserve clean boundaries where useful** — the boundary enforcement tests remain valuable — but do not force abstraction layers that have no consumer yet.
- **Avoid unnecessary decomposition.** New packages (`@tsd-ui/forms`, `@tsd-ui/table-controls`) should only be populated when there is a concrete extraction underway with a consuming app ready to adopt.
- **Emphasize internal usability over theoretical upstream purity.** The API surface should be comfortable for our apps first. Upstream alignment is a refinement step, not a design constraint.

> **Note:** The `ThemeSelector` component currently lives in `@tsd-ui/core` despite importing from `@patternfly/react-core`. This is an intentional pragmatic choice for now — it keeps the theme system self-contained and easy to consume. If boundary enforcement becomes a problem, it can be moved to a wrapper package later.

## Roadmap

### Completed — Foundation (Phase 0–1)

- [x] **F000** — Monorepo Initialization
- [x] **F005** — Pre-commit Hooks (Lint + Format + Typecheck)
- [x] **F006** — Pre-push Hooks (Build + Unit Tests)
- [x] **F007** — GitHub Actions CI Pipeline
- [x] **F008** — Dependabot Configuration
- [x] **F009** — CodeQL Security Scanning
- [x] **F001** — Architectural Boundary Definition

### Next — Theme Validation (Phase 2)

#### F015 — Theme Adoption Validation in TAS Console

**Description:**
Consume the existing `@tsd-ui/core` theme system (`ThemeProvider`, `ThemeSelector`, `ThemeContext`) in TAS Console. The goal is to validate that the shared theme infrastructure works cleanly in a real consuming application without requiring project-specific hacks or workarounds. This is not about package publishing — it is about proving the reuse model works.

**Dependencies:**

- F001 (architectural boundaries defined)
- Existing theme code in `packages/core/src/components/Theme/`
- Access to TAS Console codebase

**Verification steps:**

1. Wire `ThemeProvider` into TAS Console's app shell (root layout)
2. Integrate `ThemeSelector` into the app header or settings area
3. Validate dark mode toggle works and selection persists across page navigations
4. Apply theme across the shell/layout and at least 1–2 representative routes
5. Document any compatibility issues, integration friction, or required workarounds
6. Capture follow-up tasks (bugs, missing tokens, PF version mismatches, etc.)

**Acceptance criteria:**

- [ ] `ThemeProvider` integrates cleanly into TAS Console's root layout
- [ ] Dark mode works across the core shell/layout and at least 1–2 representative routes
- [ ] `ThemeSelector` provides a working UI for switching between light, dark, and system modes
- [ ] Theme preference persists (across navigations; storage mechanism documented)
- [ ] No project-specific hacks are required in the shared theme code in `@tsd-ui/core`
- [ ] Friction points and compatibility issues are documented
- [ ] Result is demoable to stakeholders

**Testing requirements:**

- Unit: Existing `ThemeProvider` tests pass; add tests if gaps found during integration
- Integration: Theme toggle works end-to-end in TAS Console dev environment
- Visual: Dark mode renders correctly on representative pages (manual verification or screenshots)

**Files affected:**

- `packages/core/src/components/Theme/*` (may need minor adjustments)
- TAS Console: app shell, root layout, header component (external repo)

**Notes:**

- If TAS Console uses a different PatternFly version than `@tsd-ui/core` expects, document the version gap and any required compatibility shims.
- Theme persistence strategy (localStorage key, cookie, etc.) should be evaluated during integration.
- This milestone is deliberately small. Success means "it works in a real app" — not "it's perfectly polished."

---

### Planned — Hardening & Expansion (Phase 3+)

#### F016 — Theme Hardening and Documentation

Polish the theme system based on friction discovered during F015. Write integration documentation, add any missing dark-mode CSS custom properties, and address follow-up items. Produce a short internal guide for adopting the theme in other apps.

#### F020 — Extract Core Utility Hooks

Extract shared hooks (`usePersistentState`, `useStorage`, `useUrlParams`, `useDebounce`) into `@tsd-ui/core` with proper tests and documentation. Deferred until after theme validation proves the consumption model.

#### F010 — Extract HookFormPF Core Components

Extract `HookFormPF` form components from TPA into `@tsd-ui/forms`. Deferred — originally the planned next step, now sequenced after theme validation and hook extraction. ID preserved for continuity.

#### F030 — Extract Table Control System

Extract the TPA table-controls system (filtering, sorting, pagination) into `@tsd-ui/table-controls`. The most complex extraction. Deferred until hooks and forms are validated.

#### F040 — Internal Adoption Validation Across Two Apps

Validate that extracted components are adopted in at least two consuming apps (TAS Console, TPA). This is the gate for proving internal reuse at scale.

#### F050 — PatternFly Upstream Readiness Assessment

Evaluate extracted components against PatternFly `react-component-groups` contribution standards. Open a draft PR for maintainer feedback. This is Gate 2: upstream fit validated.

#### F060 — Upstream Packaging Refactor (Conditional)

If F050 passes, refactor packaging to meet PatternFly repository requirements. If upstream contribution is not accepted, the internal package remains the primary distribution mechanism.

## Decision log

| Date       | Decision                                                     | Rationale                                                            |
| ---------- | ------------------------------------------------------------ | -------------------------------------------------------------------- |
| 2026-04-01 | Start with theme validation before forms/tables              | Smaller scope, existing code, lower risk first proof point           |
| 2026-04-01 | Flatten architecture — pragmatic grouping over strict layers | Avoid premature abstraction; prove reuse before optimizing structure |
| 2026-04-01 | Prove internal adoption before upstreaming                   | No point packaging for PF if our own apps cannot consume cleanly     |
| 2026-04-01 | Keep AI productivity work separate from this PRD             | Different initiative with different stakeholders and cadence         |
| 2026-04-01 | Migrate planning from JSON/TXT to Markdown                   | Easier for humans and agents to read and maintain                    |
| 2026-03-04 | Three-layer architecture adopted (ADR-001)                   | Clean separation enables future upstream contribution                |

## Risks / open questions

- **Unknown friction when consuming theme in TAS Console.** PF version mismatches, CSS custom property conflicts, or layout assumptions may surface during F015.
- **Whether broader extraction work is justified after theme validation.** If theme adoption is painful, it may signal that the extraction model needs rethinking before tackling forms/tables.
- **Whether PatternFly would eventually want any of this upstream.** The answer affects packaging and API design decisions in F050+.
- **Version compatibility and DX concerns across projects.** Different apps may pin different PF versions, React versions, or build tool versions. Peer dependency management will need attention.
- **Team capacity for parallel integration work.** F015 requires coordination with the TAS Console team.

## Delegation guidance

### Can be handed to a junior engineer now

- **Theme integration in TAS Console (F015):** Wire `ThemeProvider` and `ThemeSelector` into TAS Console. Follow the verification steps above. Document friction points.
- **Documentation of friction points:** Capture integration issues, version mismatches, and workarounds in a structured format.
- **Demo preparation:** Prepare a short demo showing dark mode working in TAS Console for stakeholder review.

### Keep with the lead

- Roadmap sequencing and scope decisions (which extractions to pursue next)
- Stakeholder alignment on the reuse strategy
- Architecture decisions if boundary violations or layering issues surface
- PatternFly upstream relationship management (F050+)
