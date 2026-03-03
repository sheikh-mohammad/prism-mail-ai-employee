# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Project Overview

This repository implements the "Personal AI Employee" concept for the Bronze Tier Hackathon. The goal is to build a system where an AI agent (powered by Claude Code) proactively manages personal and business affairs using Obsidian as a local dashboard and Python scripts as watchers.

## Key Components

### Core Architecture
- **The Brain**: Claude Code as the reasoning engine with Ralph Wiggum Stop hook for iterative completion
- **The Memory/GUI**: Obsidian vault with local Markdown files
- **The Senses**: Python watcher scripts that monitor Gmail, WhatsApp, or filesystem changes
- **The Executor**: Claude Code interacting with the Obsidian vault

### Folder Structure
- `/Inbox` - for incoming items
- `/Needs_Action` - for items requiring attention
- `/Done` - for completed tasks
- `/docs` - documentation including SDD methodology
- `/sessions` - session clarifications and notes

### Documentation Files
- `Dashboard.md` - main dashboard with status information
- `Company_Handbook.md` - rules of engagement and guidelines
- `bronze_tier_requirements.md` - specific Bronze Tier deliverables
- `Personal_AI_Employee_Hackathon_0_Building_Autonomous_FTEs_in_2026.md` - main architectural blueprint

## Development Guidelines

### Spec-Driven Development (SDD)
This project follows the Spec-Driven Development methodology as documented in `docs/sdd-methodology/`. The project constitution defines:
- Architecture principles for consistent code structure
- Technology constraints (Python, Claude Code, Obsidian)
- Code quality standards (function length limits, type safety, documentation)
- Security requirements (no secrets in code, environment variables only)
- Workflow rules (commit message format, clarification questions)

### Implementation Approach
1. Start with the Bronze Tier requirements as specified in `bronze_tier_requirements.md`
2. Implement the Obsidian vault structure with required folders
3. Create basic documentation templates
4. Develop a working watcher script (either Gmail or filesystem monitoring)
5. Configure Claude Code integration for reading/writing to vault
6. Implement AI functionality as Agent Skills

### Agent Skills Framework
All AI functionality should be implemented as Claude Code Agent Skills. Refer to the skill definitions in `.claude/skills/` for examples and patterns.

## Commands for Development

### Running Tests
- `python -m pytest` - Run all tests (if test suite exists)
- `python -m unittest` - Run unit tests (if applicable)

### Development Workflow
- `python -m black .` - Format code with Black
- `python -m flake8 .` - Lint code with Flake8
- `python -m mypy .` - Type check with MyPy (if applicable)

### Running Watcher Scripts
- `python watcher_script.py` - Run the watcher script for monitoring
- `python gmail_watcher.py` - Run Gmail watcher specifically
- `python fs_watcher.py` - Run filesystem watcher specifically

### Documentation
- `make docs` - Generate documentation (if applicable)
- Review SDD methodology in `docs/sdd-methodology/` for specification practices

## Project-Specific Conventions

### File Naming
- Use snake_case for Python files
- Use kebab-case for markdown files
- All documentation files follow the SDD methodology

### Commit Messages
Follow conventional commit format:
- `feat: add new watcher script`
- `fix: correct vault folder structure`
- `docs: update requirements documentation`
- `style: format code according to Black`

### Code Quality
- Functions should be under 40 lines
- All public functions have docstrings
- Type hints on every parameter and return value
- No `any` types in Python code
- Tests written before implementation (TDD)

### Security
- No secrets, tokens, or credentials in committed files
- Environment variables only for sensitive data
- Input validation at every external boundary
- Audit logging for state changes