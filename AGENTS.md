# AGENTS.md - Prism Mail AI Project Guide

This file provides complete project context and collaboration guidance for all agents working on this repository.

## Project Overview

**Product Name:** Prism Mail AI - Your AI Email Employee

**Tagline:** Your AI Email Employee

**Description:** Prism Mail AI is an intelligent email triage assistant for the Personal AI Employee Hackathon (Bronze Tier). It uses Claude Code to analyze and categorize emails, routing them to appropriate folders so users focus only on what matters.

**Philosophy:** This is being developed as a **product**, not just a hackathon submission. We're building a foundation for a scalable, production-ready AI employee system with intelligent triage capabilities.

**Current Tier:** Bronze Tier (Foundation)

## Development Methodology

This project follows **Spec-Driven Development (SDD)** at the **Spec-Anchored** level.

### What is SDD?

Spec-Driven Development establishes specifications as the primary artifact of software development, with code becoming a generated output derived from these specifications. SDD exists because "vibe coding" (conversational iteration) fails systematically for production systems through:

1. **Context Loss**: Each iteration loses discoveries from earlier turns
2. **Assumption Drift**: Reasonable guesses diverge from actual intent
3. **Pattern Violations**: Generated output ignores your specific standards

### SDD Methodology Documentation

Complete SDD methodology is documented in `/docs/sdd-methodology/`:

1. **`README.md`** - Overview and introduction to SDD
2. **`01_Why_Specs_Beat_Vibe_Coding.md`** - The three failure modes of vibe coding
3. **`02_The_Three_Levels_of_SDD.md`** - Spec-First, Spec-Anchored, Spec-as-Source
4. **`03_The_Project_Constitution.md`** - What belongs in CLAUDE.md
5. **`04_The_Four_Phase_Workflow.md`** - The complete SDD workflow
6. **`05_Phase_1_Parallel_Research_with_Subagents.md`** - Parallel research patterns
7. **`06_Phase_2_Writing_Effective_Specifications.md`** - Four-part spec template
8. **`07_Phase_3_Refinement_via_Interview.md`** - Interview patterns to surface ambiguities
9. **`08_Phase_4_Task_Based_Implementation.md`** - Task delegation with subagents
10. **`09_The_Decision_Framework.md`** - When to use SDD vs simpler approaches

**CRITICAL:** Read these files to understand the development approach before starting any work.

### The Four-Phase SDD Workflow

This project uses the complete four-phase workflow:

```
Phase 1: Research (Parallel Subagents)
    ↓ Multiple agents investigate different aspects
Phase 2: Specification (Written Artifact)
    ↓ Comprehensive markdown document
Phase 3: Refinement (Interview)
    ↓ AskUserQuestion surfaces ambiguities
Phase 4: Implementation (Task Delegation)
    ↓ Atomic tasks with commits
```

**Key Principle:** NO IMPLEMENTATION WITHOUT APPROVED PLANNING ARTIFACTS

Never skip phases. Never implement before specifications are approved by the user.

### Quick Reference: SDD Trigger Patterns

- **Phase 1 Research**: "Spin up multiple subagents for your research task"
- **Phase 3 Refinement**: "Use the ask_user_question tool to surface any ambiguities before we implement"
- **Phase 4 Implementation**: "Implement @spec.md. Use the task tool, each task by subagent. After each task do a commit. You are the main agent and your subagents are your devs."

## Project Structure

### Directory Layout

```
prism-mail-ai/
├── .claude/                    # Claude Code configurations and skills
├── docs/                       # All documentation
│   ├── sdd-methodology/        # SDD methodology documentation (10 files)
│   ├── sessions/               # Clarification sessions and decisions
│   ├── bronze_tier_requirements.md
│   └── Personal_AI_Employee_Hackathon_0_Building_Autonomous_FTEs_in_2026.md
├── specs/                      # Feature specifications (root level)
│   └── <feature-name>/
│       ├── spec.md             # Feature specification
│       ├── plan.md             # Plan created by Claude using plan mode
│       └── tasks.md            # Tasks created by Claude using task tools
├── src/                        # Source code (to be created)
├── AGENTS.md                   # This file - Project guide
├── CLAUDE.md                   # Project constitution (governance rules)
└── README.md                   # Project README
```

### Obsidian Vault Structure (To Be Created)

The Obsidian vault will be created via Obsidian MCP with this structure:

```
AI_Employee_Vault/
├── Inbox/              # Untriaged emails from watcher (staging area)
├── Needs_Action/       # Items requiring human attention (after triage)
├── Summaries/          # FYI summaries (markdown files)
├── Replies/            # Draft responses (markdown files, not sent in Bronze)
├── Done/               # Completed/archived items
├── Dashboard.md        # Triage statistics and recent activity
└── Company_Handbook.md # Rules of engagement and triage criteria
```

## Technology Stack

### Language & Environment
- **Python 3.13+** - Primary language
- **UV** - Package management and virtual environment creation
- **Gmail API** - Email detection (credentials provided by user)

### AI & Knowledge Base
- **Claude Code (Claude Sonnet 4.6)** - AI reasoning engine
- **Obsidian** - Local markdown vault (created via Obsidian MCP)
- **Claude Code Agent Skills** - All email-related AI functionality

### APIs & Integration
- **Gmail API (read-only)** - Email detection
- **Obsidian MCP** - Vault creation and management

**Important Notes:**
- User will provide Gmail API credentials
- Vault will be created using Obsidian MCP
- All AI functionality MUST be implemented as Agent Skills (not inline code)

## Architecture Overview

### Three-Phase Triage Architecture

Prism Mail AI implements an intelligent triage layer where Claude acts as an executive assistant:

1. **Detection Phase**
   - Gmail watcher script monitors for unread emails
   - Creates markdown files in `/Inbox` folder
   - No AI logic in watcher (pure detection)

2. **Triage Phase**
   - Prism Mail AI (Claude) reads emails from `/Inbox`
   - Analyzes content, sender, urgency, and context
   - Routes to appropriate folders:
     - `/Needs_Action` - Requires human attention
     - `/Summaries` - FYI items (summarized)
     - `/Replies` - Draft responses prepared
     - `/Done` - Completed/archived
   - Updates `Dashboard.md` with triage summary

3. **Action Phase**
   - User reviews `/Needs_Action` for items requiring attention
   - User can review summaries and draft replies
   - Focus only on what matters

### Agent Skills Architecture

**CRITICAL PRINCIPLE:** All AI functionality MUST be implemented as Claude Code Agent Skills.

**Required Agent Skills:**
1. **Email Triage Skill** - Analyzes emails and determines routing
2. **Summary Generation Skill** - Creates concise summaries for FYI items
3. **Draft Reply Skill** - Generates draft responses
4. **Dashboard Update Skill** - Updates Dashboard.md with statistics

**Why Agent Skills?**
- Reusable across features
- Testable in isolation
- Clear separation of concerns
- Scalable for Silver/Gold tiers

### Separation of Concerns

- **Watcher**: Detection only (no AI logic)
- **Agent Skills**: Intelligence layer (triage, summarization, drafting)
- **Obsidian Vault**: Knowledge base and state management
- **User**: Final decision-making and action

## Bronze Tier Requirements

The Bronze Tier represents the minimum viable deliverable for the hackathon.

### Required Deliverables

1. **Obsidian Vault with Required Structure**
   - All folders created: Inbox, Needs_Action, Summaries, Replies, Done
   - Dashboard.md exists and is functional
   - Company_Handbook.md exists with triage criteria

2. **Gmail Watcher Script**
   - Monitors Gmail for unread emails
   - Creates markdown files in /Inbox
   - Includes email metadata (sender, subject, timestamp, body)
   - Marks emails as processed to avoid duplicates

3. **Prism Mail AI (Claude Code) Integration**
   - Successfully reads from vault
   - Successfully writes to vault
   - Can access all folders

4. **Agent Skills Implementation**
   - All AI functionality implemented as Agent Skills
   - Skills are invocable and testable
   - Skills follow SDD methodology

5. **Intelligent Triage Workflow**
   - Emails are analyzed and routed correctly
   - Summaries are generated for FYI items
   - Draft replies are created when appropriate
   - Dashboard is updated with statistics

### Success Criteria

The Bronze Tier is complete when:
- ✓ Obsidian vault structure created with all required folders
- ✓ Dashboard.md and Company_Handbook.md exist in vault
- ✓ Gmail watcher script detects emails and creates files in /Inbox
- ✓ Prism Mail AI (Claude Code) successfully reads from and writes to vault
- ✓ All AI functionality implemented as Agent Skills
- ✓ Intelligent triage routes emails to appropriate folders
- ✓ User can focus on /Needs_Action for items requiring attention
- ✓ All components work together in end-to-end workflow

### Bronze Tier Workflow (Manual Trigger)

```
1. Run: python gmail_watcher.py (manually or in background)
2. Watcher detects email → Creates markdown file in /Inbox
3. You manually run: claude (in the vault directory)
4. Prism Mail AI (Claude) triages emails from /Inbox → Routes to appropriate folders
5. Prism Mail AI updates Dashboard.md with triage summary
6. You review /Needs_Action for items requiring attention
7. Done - demonstrate Prism Mail AI's intelligent triage working
```

**Note:** External actions (sending emails, marking as read in Gmail) are NOT required for Bronze Tier.

## How to Work on This Project

### Before Starting Any Task

1. **Read `CLAUDE.md`** - Understand the constitution and governance rules
2. **Read this file (`AGENTS.md`)** - Understand the project context
3. **Read `/docs/sdd-methodology/`** - Understand the development methodology
4. **Check `/docs/bronze_tier_requirements.md`** - Understand current requirements

### Development Workflow

**CRITICAL:** This project uses Spec-Anchored SDD. You MUST follow the four-phase workflow:

1. **Phase 1: Research**
   - Use parallel subagents to investigate
   - Document findings in research notes
   - Identify patterns, constraints, and approaches

2. **Phase 2: Specification**
   - Write comprehensive spec.md using four-part template
   - Include constraints and success criteria
   - Store in `/specs/<feature-name>/spec.md`
   - Get user approval before proceeding

3. **Phase 3: Refinement**
   - Use ask_user_question to surface ambiguities
   - Update spec with decisions
   - Ensure spec is unambiguous

4. **Phase 4: Implementation**
   - Extract tasks from spec checklist
   - Use task tool with subagent delegation
   - Commit atomically after each task
   - Update spec if implementation reveals new insights

### Git Workflow

**Atomic Commits Required:**
- Commit immediately after completing each task
- Push to remote after each commit
- Use descriptive commit messages

**Commit Message Format:**
```
<type>(<scope>): <description>

<optional body>

Co-Authored-By: Claude Sonnet 4.6 <noreply@anthropic.com>
```

**When to Commit:**
- After implementing a feature or task
- After fixing a bug
- After updating documentation
- After refactoring code

Do NOT ask for permission to commit and push - do it automatically.

### Decision Framework

Use this logic to determine when to use full SDD:

```
IF files_affected > 5 OR requirements_unclear OR learning_new_tech:
    Use full SDD (all four phases)
ELSE IF single_file AND bug_fix:
    Skip SDD (direct implementation)
ELSE:
    Use lightweight spec (constraints + success criteria only)
```

**For Prism Mail AI, use full SDD when:**
- Implementing new Agent Skills (unclear requirements, learning patterns)
- Gmail watcher implementation (multiple files, integration complexity)
- Obsidian vault structure (architectural decisions)
- Triage logic design (multiple approaches possible)

**Skip SDD for:**
- Single-file bug fixes
- Documentation updates
- Configuration changes

## Human as Tool Strategy

You are not expected to solve every problem autonomously. Invoke the user for input when you encounter:

1. **Ambiguous Requirements**: Ask 2-3 targeted clarifying questions
2. **Unforeseen Dependencies**: Surface them and ask for prioritization
3. **Architectural Uncertainty**: Present options with tradeoffs
4. **Completion Checkpoint**: Summarize what was done, confirm next steps

## Key Mental Models

Understanding these mental models will help you work effectively on this project:

1. **Specs vs Constitution**
   - Specs describe features (blueprints for one building)
   - Constitution defines structural codes (rules every building must meet)

2. **Planning vs Execution Separation**
   - SDD front-loads all planning
   - Implementation becomes execution of a well-understood plan

3. **Context Isolation > Speed**
   - Parallel research provides genuinely independent perspectives
   - Task delegation prevents context pollution

4. **10x Cost Multiplier**
   - Ambiguities cost 5 min during spec
   - 10 min during interview
   - 30 min during coding
   - 2-4 hours after commit
   - 8-16 hours in production

## References

### Internal Documentation
- `/docs/sdd-methodology/` - Complete SDD methodology (10 files)
- `/docs/bronze_tier_requirements.md` - Bronze Tier requirements
- `/docs/sessions/` - Clarification sessions and decisions
- `CLAUDE.md` - Project constitution (governance rules)

### External References
- Osmani, A. (2025). "How to write a good spec for AI agents"
- Böckeler, B. (2025). "Understanding Spec-Driven-Development: Kiro, spec-kit, and Tessl"
- GitHub. (2025). "Spec-driven development with AI"
- Anthropic. (2025). "Claude Code: Best practices for agentic coding"
- Panaversity Research Paper: "Spec-Driven Development with Claude Code" (February 2026)

---

**Welcome to Prism Mail AI!** This is a product, not just a hackathon submission. Build with production quality, maintainability, and scalability in mind.
