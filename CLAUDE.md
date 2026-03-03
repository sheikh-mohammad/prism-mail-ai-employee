# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Project Overview

This repository implements the Bronze Tier requirements for the Personal AI Employee Hackathon. The focus is on creating an Obsidian vault structure with specific folders, implementing a watcher script, enabling Claude Code integration, and structuring AI functionality as Agent Skills.

## Key Directories and Files

- `/docs/` - Documentation files including requirements and clarification sessions
- `/docs/bronze_tier_requirements.md` - Core requirements specification
- `/docs/sessions/` - Clarification of Bronze Tier Project
- `/.specify/` - SpecKit Plus templates and scripts for specification-driven development
- `/.claude/` - Claude-specific configurations and skills

## Development Workflow

This project follows a Spec-Driven Development (SDD) approach with the following structure:
- Specifications (`specs/<feature>/spec.md`)
- Architecture plans (`specs/<feature>/plan.md`)
- Implementation tasks (`specs/<feature>/tasks.md`)
- Prompt History Records (`history/prompts/`)
- Architecture Decision Records (`history/adr/`)

## Project Structure

The project follows a structured approach for managing AI employee functionality:

1. **Vault Structure** - Implements required Obsidian vault folders:
   - `/Inbox` - for incoming items
   - `/Needs_Action` - for items requiring attention
   - `/Done` - for completed tasks

2. **Documentation Files** - Core markdown files:
   - `Dashboard.md` - Main dashboard with status information
   - `Company_Handbook.md` - Rules of engagement and guidelines

3. **Watcher Scripts** - Event monitoring functionality (either Gmail or filesystem-based)

4. **Agent Skills** - All AI functionality implemented as Claude Code Agent Skills

## Key Principles

- All AI functionality must be implemented as Agent Skills
- Follow Spec-Driven Development methodology
- Maintain clear separation between specification, planning, and implementation
- Use Prompt History Records (PHRs) for all development work
- Create Architectural Decision Records (ADRs) for significant decisions