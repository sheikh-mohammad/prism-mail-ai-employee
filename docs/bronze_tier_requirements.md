# Bronze Tier Requirements Documentation

## Overview
This document outlines the minimum viable deliverables for the Bronze Tier of the Personal AI Employee Hackathon. The Bronze Tier represents the foundational level of implementation that establishes the core functionality of a Personal AI Employee.

## Project Decisions & Clarifications

### Watcher Script Choice: Gmail
For the Bronze Tier requirement of "one working Watcher script (Gmail OR file system monitoring)", this project will implement the **Gmail watcher** approach.

### PM2 Process Manager: NOT Required for Bronze Tier
**Important:** PM2 (or other process managers like supervisord) is **NOT required** for Bronze Tier completion.

**What IS Required:**
- A working Python watcher script that can be manually executed
- Script successfully monitors Gmail for new messages
- Script creates actionable files in the /Needs_Action folder
- Demonstration that the watcher works when run

**When PM2 Would Be Needed:**
- Silver/Gold tiers where 24/7 autonomous operation is required
- Production deployment requiring auto-restart on crashes
- Continuous monitoring without manual intervention
- Advanced logging and process management features

**For Bronze Tier:** Simply running `python gmail_watcher.py` manually to demonstrate functionality is sufficient. The focus is on proving the watcher logic works, not on production-grade daemon management.

## Bronze Tier Deliverables (Minimum Viable Product)

Based on the hackathon guidelines, the following items constitute the Bronze Tier requirements:

1. **Obsidian Vault with Dashboard.md and Company_Handbook.md**
   - Create an Obsidian vault structure
   - Implement a Dashboard.md file with basic structure
   - Create a Company_Handbook.md file with rules of engagement

2. **One working Watcher script (Gmail OR file system monitoring)**
   - Implement a Python watcher script
   - Monitor either Gmail or file system for changes
   - Create actionable files in the Needs_Action folder when events occur

3. **Claude Code successfully reading from and writing to the vault**
   - Configure Claude Code to work with the Obsidian vault
   - Verify reading capability from vault files
   - Verify writing capability to vault files

4. **Basic folder structure: /Inbox, /Needs_Action, /Done**
   - Create the required folder structure in the Obsidian vault
   - Ensure proper organization for the AI workflow

5. **All AI functionality should be implemented as Agent Skills**
   - Implement any AI functionality as Claude Code Agent Skills
   - Follow the Agent Skills framework as specified in the guidelines

## Implementation Approach

### Phase 1: Vault Setup
- Create Obsidian vault structure
- Implement core documentation files
- Set up folder hierarchy

### Phase 2: Watcher Implementation
- Develop a working watcher script
- Implement event detection and file creation
- Test integration with Claude Code

### Phase 3: Claude Integration
- Configure Claude Code for vault access
- Test reading and writing capabilities
- Validate the workflow

### Phase 4: Agent Skills Implementation
- Identify AI functionalities that can be converted to skills
- Implement agent skills for core functions

## Technical Requirements

### Vault Structure
- /Inbox - for incoming items
- /Needs_Action - for items requiring attention
- /Done - for completed tasks
- (Optional folders for higher tiers only): /Plans, /Logs, /Pending_Approval, /Approved, /Rejected

### Files to Create
- Dashboard.md - main dashboard with status information
- Company_Handbook.md - rules of engagement and guidelines
- Watcher script (Gmail or filesystem-based)

## Success Criteria
- All Bronze Tier deliverables are implemented
- Working demonstration of the core workflow
- Proper documentation of implementation
- Compliance with the specified requirements