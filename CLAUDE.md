# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Project Overview

**Product Name:** Prism Mail AI - Your AI Email Employee

This repository implements Prism Mail AI, an intelligent email triage assistant for the Personal AI Employee Hackathon (Bronze Tier). Prism Mail AI uses Claude Code to analyze and categorize emails, routing them to appropriate folders so users focus only on what matters.

## CRITICAL: Read AGENTS.md First

**IMPORTANT:** At the start of every session, you MUST read and follow the guidelines in `AGENTS.md`. This file contains the Spec-Driven Development (SDD) methodology, PHR requirements, and core development principles that govern this project.

## Development Workflow - Spec-Driven Development (SDD)

**CRITICAL: NO IMPLEMENTATION WITHOUT PLANNING ARTIFACTS**

This project strictly follows Spec-Driven Development. You MUST NOT write any implementation code until the user has approved the planning artifacts.

### Required Workflow:

1. **Discovery & Specification** (`/sp.specify`)
   - Understand requirements
   - Create feature specification
   - Get user approval

2. **Architecture Planning** (`/sp.plan`)
   - Design technical approach
   - Make architectural decisions
   - Document in plan.md
   - Get user approval

3. **Task Breakdown** (`/sp.tasks`)
   - Break down into implementable tasks
   - Define acceptance criteria
   - Get user approval

4. **Implementation** (`/sp.implement`) - **ONLY AFTER USER PERMISSION**
   - Execute tasks from tasks.md
   - Write code
   - Test functionality

**Never skip steps. Never implement before planning is approved.**

## Key Directories and Files

- `/docs/` - Documentation files including requirements and clarification sessions
- `/docs/bronze_tier_requirements.md` - Prism Mail AI Bronze Tier requirements specification
- `/docs/sessions/` - Clarification sessions and project decisions
- `/.specify/` - SpecKit Plus templates and scripts for specification-driven development
- `/.claude/` - Claude-specific configurations and skills
- `/docs/Personal_AI_Employee_Hackathon_0_Building_Autonomous_FTEs_in_2026.md` - Main Hackathon Requirements Document
- `/AGENTS.md` - **READ THIS FIRST** - SDD methodology and core development principles
- `/CLAUDE.md` - This file - Project-specific guidance

## Development Workflow - Spec-Driven Development (SDD)

**CRITICAL: NO IMPLEMENTATION WITHOUT PLANNING ARTIFACTS**

This project strictly follows Spec-Driven Development. You MUST NOT write any implementation code until the user has approved the planning artifacts.

### Required Workflow:

1. **Discovery & Specification** (`/sp.specify`)
   - Understand requirements
   - Create feature specification
   - Get user approval

2. **Architecture Planning** (`/sp.plan`)
   - Design technical approach
   - Make architectural decisions
   - Document in plan.md
   - Get user approval

3. **Task Breakdown** (`/sp.tasks`)
   - Break down into implementable tasks
   - Define acceptance criteria
   - Get user approval

4. **Implementation** (`/sp.implement`) - **ONLY AFTER USER PERMISSION**
   - Execute tasks from tasks.md
   - Write code
   - Test functionality

**Never skip steps. Never implement before planning is approved.**

### SDD Artifacts Structure:
- Specifications: `specs/<feature>/spec.md`
- Architecture plans: `specs/<feature>/plan.md`
- Implementation tasks: `specs/<feature>/tasks.md`
- Prompt History Records: `history/prompts/`
- Architecture Decision Records: `history/adr/`

## Project Structure - Prism Mail AI

Prism Mail AI follows a structured approach for intelligent email triage:

1. **Obsidian Vault Structure** - Will be created via Obsidian MCP:
   - `/Inbox` - Untriaged emails from watcher (staging area)
   - `/Needs_Action` - Items requiring human attention (after triage)
   - `/Summaries` - FYI summaries (markdown files)
   - `/Replies` - Draft responses (markdown files, not sent in Bronze)
   - `/Done` - Completed/archived items

2. **Documentation Files** - Core markdown files in vault:
   - `Dashboard.md` - Triage statistics and recent activity
   - `Company_Handbook.md` - Rules of engagement and triage criteria

3. **Gmail Watcher Script** - Python script with UV:
   - Monitors Gmail for unread emails
   - Creates markdown files in /Inbox
   - Gmail API credentials already configured by user

4. **Agent Skills** - All AI functionality implemented as Claude Code Agent Skills:
   - Email triage skill
   - Summary generation skill
   - Draft reply skill
   - Dashboard update skill

## Technology Stack

**Language & Environment:**
- Python 3.13+
- UV - Package management and virtual environment creation
- Gmail API (credentials provided by user)

**AI & Knowledge Base:**
- Claude Code (Claude Sonnet 4.6) - AI reasoning engine
- Obsidian - Local markdown vault (created via Obsidian MCP)
- Claude Code Agent Skills - All email-related AI functionality

**APIs & Integration:**
- Gmail API (read-only) - Email detection
- Obsidian MCP - Vault creation and management

**Note:** User will provide Gmail API credentials. Vault will be created using Obsidian MCP.

## Git Workflow - Atomic Commits

**IMPORTANT: Automatic Commit and Push After Each Iteration**

When you complete any discrete unit of work (task, feature, bug fix, documentation update), you MUST immediately:

1. Stage the relevant files with `git add`
2. Create a commit with a descriptive message
3. Push to the remote repository with `git push origin main`

**Atomic Commit Principles:**
- Each commit should represent one logical change
- Commit immediately after completing an iteration, don't wait for multiple changes
- Keep commits focused and self-contained
- Write clear, descriptive commit messages that explain the "why"

**Required Commit Message Format:**
Every commit message MUST end with the co-author line:
```
Co-Authored-By: Claude Sonnet 4.6 <noreply@anthropic.com>
```

**When to Commit:**
- After implementing a feature or task
- After fixing a bug
- After updating documentation
- After refactoring code
- After adding tests
- Essentially: after ANY completed work iteration

Do NOT ask for permission to commit and push - do it automatically as part of completing the work.

## Key Principles

- **Agent Skills:** All AI functionality must be implemented as Agent Skills
- **SDD Methodology:** Follow Spec-Driven Development methodology
  - Maintain clear separation between specification, planning, and implementation
  - Use Prompt History Records (PHRs) for all development work
  - Create Architectural Decision Records (ADRs) for significant decisions
- **Agent Skills:** Follow atomic commit workflow: commit and push immediately after each iteration
- **Spec-Driven Development:** NEVER implement without approved planning artifacts
- **AGENTS.md First:** Read AGENTS.md at the start of every session
- **Agent Skills:** All AI functionality must be implemented as Agent Skills
- **User Permission:** Get explicit permission before implementation phase
- **Atomic Commits:** Commit and push immediately after each iteration
- **PHR Records:** Create Prompt History Records for all development work
- **ADR Documentation:** Create Architectural Decision Records for significant decisions
