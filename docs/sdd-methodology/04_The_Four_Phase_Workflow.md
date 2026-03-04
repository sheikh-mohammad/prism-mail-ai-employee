-   [](/)
-   [Part 1: General Agents: Foundations](/docs/General-Agents-Foundations)
-   [Chapter 5: Spec-Driven Development with Claude Code](/docs/General-Agents-Foundations/spec-driven-development)
-   The Four-Phase Workflow

Updated Mar 02, 2026

[Version history](https://github.com/panaversity/ai-native-software-development/commits/main/apps/learn-app/docs/01-General-Agents-Foundations/05-spec-driven-development/04-four-phase-workflow.md)

# The Four-Phase Workflow

In Lesson 1, you learned that SDD exists because vibe coding fails at scale. The question becomes: what do you do instead?

The answer is a structured workflow that treats Claude not as a solo coder who figures everything out through conversation, but as a **development team** you orchestrate. You provide direction. Multiple agents investigate. A comprehensive specification emerges. Implementation follows the spec, not the other way around.

This lesson introduces the four-phase workflow that makes SDD work. By the end, you'll understand why this sequence matters and how it prevents the mid-implementation pivots that derail vibe coding projects.

Before diving into the phases, note that Phase 1 research and all subsequent phases operate within the governance boundaries established by your project constitution (Lesson 3). The constitution defines *how* you build; the phases define *what* you do.

## The Four Phases

Here's the complete workflow at a glance:

```
Phase 1: Research (Parallel Subagents)    ↓ Multiple agents investigate different aspectsPhase 2: Specification (Written Artifact)    ↓ Comprehensive markdown documentPhase 3: Refinement (Interview)    ↓ AskUserQuestion surfaces ambiguitiesPhase 4: Implementation (Task Delegation)    ↓ Atomic tasks with commits
```

Each phase has a clear deliverable. Each transition is a checkpoint where you can review, adjust, or stop. Unlike vibe coding—where you're constantly course-correcting during implementation—SDD front-loads the thinking so implementation becomes execution of a well-understood plan.

### Phase 1: Research (Parallel Subagents)

**Deliverable**: Written summaries of findings from multiple investigation threads

**What happens**: You ask Claude to investigate your problem from multiple angles. Instead of a single conversation exploring everything sequentially, Claude spawns multiple independent subagents. Each subagent investigates a specific aspect:

-   One examines reference implementations
-   Another analyzes your existing codebase
-   A third researches best practices for your specific challenge

**Why parallel matters**: Each subagent operates with fresh context. They don't pollute each other's thinking. Research that would take hours sequentially becomes minutes in parallel. Different agents may discover conflicting approaches—that's valuable information for your specification.

### Phase 2: Specification (Written Artifact)

**Deliverable**: A comprehensive markdown document (spec.md)

**What happens**: Research findings converge into a written specification. This isn't a to-do list or rough notes. It's a complete description of:

-   What you're building and why
-   Patterns discovered in research
-   How this fits your existing architecture
-   Implementation approach with phases
-   Explicit constraints (what NOT to build)
-   Measurable success criteria

**Why written matters**: The specification becomes your **source of truth**. When Claude's session ends, the conversation disappears. When you start a new session tomorrow, your spec.md persists. Every decision captured in the spec survives session restarts.

### Phase 3: Refinement (Interview)

**Deliverable**: An updated specification with ambiguities resolved

**What happens**: Before implementation, Claude interviews you using AskUserQuestion patterns. The goal is to surface every design decision that would otherwise become a mid-implementation pivot:

-   "Should we migrate existing data or start fresh?"
-   "The research found two patterns for this. Which matches your constraints?"
-   "What's the failure recovery approach?"

**Why interview matters**: Every ambiguity found now saves correction time during implementation. The spec becomes more precise. You maintain architectural control instead of discovering surprises in generated code.

### Phase 4: Implementation (Task Delegation)

**Deliverable**: Working code committed in atomic chunks

**What happens**: With a refined specification, Claude extracts tasks and delegates each to a fresh subagent. Each subagent:

1.  Reads the spec
2.  Implements one task
3.  Commits with an atomic message
4.  Returns control

The main agent orchestrates, tracking progress and handling blockers. If a task fails, only that subagent's context is affected—the overall project state is preserved in git commits.

**Why delegation matters**: Context isolation prevents accumulated errors. Atomic commits enable rollback. The spec serves as the contract that keeps every subagent aligned.

## Why This Order Matters

The sequence isn't arbitrary. Each phase depends on what comes before:

Transition

Why It Must Happen This Way

Research → Spec

You can't write a good spec without understanding the problem space

Spec → Refinement

You can't find ambiguities until you've written something concrete

Refinement → Implementation

You can't implement confidently until ambiguities are resolved

**What happens if you skip phases:**

-   Skip Research → Your spec is based on assumptions, not evidence
-   Skip Specification → Implementation drifts because there's no reference point
-   Skip Refinement → Mid-implementation discoveries force costly pivots
-   Skip Task Delegation → Single context accumulates clutter, errors compound

## The Key Insight: Planning vs Execution

Traditional AI coding blurs planning and execution. You prompt, see code, adjust, prompt again—planning and execution interleaved in a single conversation.

SDD separates them completely:

Aspect

Vibe Coding

SDD

**When you review**

During coding (approval fatigue)

At phase gates (focused review)

**What persists**

Nothing—conversation lost on restart

Spec.md survives sessions

**How you correct**

Edit generated code

Edit spec, regenerate code

**Context management**

Single accumulating context

Fresh context per task

**Review at phase gates, not during coding.** After research, you review findings. After specification, you review the plan. After refinement, you confirm decisions. During implementation, Claude executes the agreed plan—you don't need to approve every file edit because the spec already captured your intent.

## The Spec as Source of Truth

When you start a new Claude Code session, your conversation history is gone. But your specification remains:

```
project/├── docs/│   └── my-feature-spec.md  ← Persists across sessions└── src/    └── ...
```

Tomorrow's Claude can read today's spec and understand:

-   What you decided to build
-   Why you made specific architectural choices
-   What constraints exist
-   What success looks like

The specification captures accumulated decisions. Without it, every new session starts from scratch—you're explaining the same context repeatedly instead of building on documented decisions.

## Comparison: One Hour of Vibe Coding vs One Hour of SDD

Consider what happens when you invest one hour in each approach:

**One hour of vibe coding:**

-   You prompt Claude, get code, find issues, prompt again
-   Each iteration loses context from earlier iterations
-   After an hour, you have working code that might not fit your architecture
-   Session ends—knowledge about your decisions disappears
-   Tomorrow: Start over, re-explaining context

**One hour of SDD:**

-   15 minutes: Research phase produces investigation summaries
-   25 minutes: Specification phase produces documented plan
-   15 minutes: Refinement phase resolves ambiguities
-   5 minutes: Implementation begins with clear direction
-   After an hour, you have a spec and partial implementation
-   Session ends—spec preserves all decisions
-   Tomorrow: Continue from documented state

The one-hour outcomes look different. Vibe coding produces code faster initially. SDD produces more durable artifacts. For a quick script, vibe coding wins. For a system you'll maintain for months, SDD's documentation pays dividends.

## Lab: Map Your Next Task to Four Phases

**Objective:** Practice thinking in phases before you need to execute.

### Task

Think of a real task you need to accomplish with Claude Code—something you'd normally tackle through conversation. Map it to the four phases:

**Phase 1 (Research):** What would you want subagents to investigate?

-   What reference implementations exist?
-   How does your current codebase handle similar problems?
-   What patterns apply to this domain?

**Phase 2 (Specification):** What sections would your spec need?

-   What are you building?
-   What are the constraints?
-   What does success look like?

**Phase 3 (Refinement):** What questions might surface ambiguities?

-   Are there decisions you haven't made yet?
-   Where might different approaches apply?

**Phase 4 (Implementation):** How would you break this into tasks?

-   What's the logical sequence?
-   Which tasks could run in parallel?

You don't need to execute this yet—Lessons 5-8 cover each phase in detail. The goal is to start thinking in phases rather than jumping straight to implementation.

## Try With AI

**Running Example:** Throughout this chapter, you'll write "Personal AI Employees in 2026"—a research report for CTOs. This lesson maps that task to the four phases.

**Prompt 1: Phase Mapping**

```
I want to write "Personal AI Employees in 2026"—a research reportfor CTOs evaluating AI tools like Claude Code for their teams.Map this to the four SDD phases:1. Research: What do I need to investigate?2. Specification: What sections would the report need?3. Refinement: What decisions haven't I made yet?4. Implementation: How would writing break into tasks?
```

**What you're learning:** Even a writing task benefits from SDD thinking. The research phase discovers what CTOs actually care about (not what you assume). The spec commits to structure before you write 2000 words in the wrong direction.

**Prompt 2: Skip-Phase Analysis**

```
What if I skipped research and wrote the report based on myexisting knowledge of AI tools? What would I miss?
```

**What you're learning:** Your knowledge is partial. Research might reveal: CTOs care about security compliance (you forgot), Cursor has enterprise features you didn't know, ROI calculations need specific metrics. Skipping research means writing for yourself, not your audience.

**Prompt 3: Artifact Comparison**

```
After 1 hour, what would I have with vibe coding ("write a reportabout AI employees") versus SDD (research → spec → refine → tasks)?List the actual artifacts, not just the process.
```

**What you're learning:** Vibe coding produces a draft that might not fit your audience. SDD produces: research.md (what CTOs need), report-spec.md (structure decisions), and sections written to spec. The artifacts persist; the conversation doesn't.

## Flashcards Study Aid

What are the four SDD phases in order?

Click to flip

Research, Specification, Refinement, Implementation.

1 / 12 cards

Space flip1 missed2 got it←→ navigateEsc exit

[ⓘ Guide](/guide#flashcards "How flashcards work")

### Core Concept

SDD separates planning from execution through four sequential phases—Research, Specification, Refinement, Implementation—where each phase produces a concrete deliverable and the spec becomes the source of truth that survives session restarts.

### Key Mental Models

-   **Planning vs Execution Separation**: Vibe coding interleaves planning and execution in one conversation; SDD front-loads all planning so implementation becomes execution of a well-understood plan
-   **Phase Gates Replace Approval Fatigue**: You review at transitions (after research, after spec, after refinement), not during every file edit—the spec already captures your intent
-   **Spec as External Memory**: Conversations vanish on restart; spec.md persists—it captures accumulated decisions so every new session builds on documented state

### Critical Patterns

-   Four phases in sequence: Research (parallel subagents) → Specification (written artifact) → Refinement (interview) → Implementation (task delegation with atomic commits)
-   Each phase has a clear deliverable: research summaries, spec.md, updated spec, working committed code
-   Skipping any phase produces a specific failure: no research = assumption-based spec, no spec = drifting implementation, no refinement = mid-implementation pivots

### Common Mistakes

-   Thinking SDD is slower than vibe coding—SDD produces more durable artifacts in the same timeframe
-   Confusing "specification" with "to-do list"—specs include constraints, success criteria, and architecture, not just tasks
-   Expecting to run all four phases in one session—SDD is designed so the spec persists across sessions

### Connections

-   **Builds on**: Why specs beat vibe coding (Lesson 1), constitution as governance (Lesson 3)
-   **Leads to**: Deep-dives into each phase: Research (Lesson 5), Specs (Lesson 6), Refinement (Lesson 7), Implementation (Lesson 8)

---
Source: https://agentfactory.panaversity.org/docs/General-Agents-Foundations/spec-driven-development/four-phase-workflow