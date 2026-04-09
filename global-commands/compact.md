---
description: Summarize entire conversation into 5-7 key bullet points for copy-paste into a new chat
---

## Task

Summarize our entire conversation so far into **5-7 bullet points** optimized for pasting into a new chat as context.

### Rules

- Each bullet must be self-contained and actionable
- Include: decisions made, code written/changed, tools installed, errors resolved, current state
- Include exact file paths, command names, config values, or code snippets where critical
- Omit pleasantries, failed attempts, and back-and-forth — final outcomes only
- End with a "Current state:" line describing exactly where we left off

### Output format

```
**Conversation Summary — [topic in 4 words]**

- [bullet 1]
- [bullet 2]
- [bullet 3]
- [bullet 4]
- [bullet 5]
- [bullet 6 if needed]
- [bullet 7 if needed]

**Current state:** [one sentence — what was just completed and what comes next]
```

Produce only this block. No preamble, no trailing commentary.
