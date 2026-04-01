# Prism Digital Mail FTE - Company Handbook

## Introduction

This handbook defines the rules of engagement and triage criteria for the Prism Digital Mail FTE. It establishes the operational guidelines for how emails are categorized and processed.

## Core Principles

1. **Focus on Value**: Only process emails that add genuine value to the user's workflow
2. **Minimal Intervention**: Automate routine tasks while preserving human oversight for important decisions
3. **Transparency**: All triage decisions should be traceable and understandable
4. **Privacy First**: No external sharing of email content or metadata

## Triage Categories

### Needs Action
- **Definition**: Emails requiring human attention, response, or decision
- **Examples**:
  - Client inquiries or requests
  - Financial documents requiring action
  - Urgent notifications needing immediate attention
  - Meetings or scheduling requests

### Summaries
- **Definition**: Informational emails that don't require action but should be acknowledged
- **Examples**:
  - Newsletter subscriptions
  - System notifications
  - Status updates
  - General company communications

### Replies
- **Definition**: Draft responses prepared by the AI for review
- **Examples**:
  - Standard acknowledgments
  - Response templates for common inquiries
  - Follow-up messages

### Done
- **Definition**: Emails that have been processed and archived
- **Examples**:
  - Spam or promotional content
  - Duplicate notifications
  - Already handled requests

## Priority Levels

### High Priority
- Emails containing urgent deadlines or time-sensitive requests
- Financial documents requiring immediate attention
- Critical system alerts or errors
- Client communications marked as urgent

### Normal Priority
- Regular business communications
- Scheduled notifications
- Routine updates and summaries
- General correspondence

## Triage Process

1. **Detection**: Gmail watcher detects unread emails and creates markdown files in `/Inbox`
2. **Analysis**: AI analyzes email content, sender, urgency, and context
3. **Routing**: Email is moved to appropriate folder based on analysis:
   - `/Needs_Action` - Requires human attention
   - `/Summaries` - FYI items (summarized)
   - `/Replies` - Draft responses prepared
   - `/Done` - Completed/archived
4. **Dashboard Update**: Statistics are recorded in `/Dashboard.md`

## Handling Edge Cases

### Unknown Senders
- Treat with caution and route to `/Needs_Action` for verification
- Flag as potential spam or phishing for human review

### Bulk Communications
- Route to `/Summaries` with consolidated view
- Include key information and actionable items

### Internal Communications
- Process normally based on content and urgency
- Consider departmental routing if applicable

## User Responsibilities

- Regularly review `/Needs_Action` folder for items requiring attention
- Review draft replies in `/Replies` before sending
- Maintain `/Done` folder for audit trail
- Update handbook with new rules as needed

## Maintenance Schedule

- Weekly review of triage effectiveness
- Monthly update of priority rules based on usage patterns
- Quarterly evaluation of system performance

---
*Last Updated: 2026-04-01*