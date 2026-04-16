# Claude Skills

Custom Claude Code skills for Deloitte consulting work.

## Skills

### `coco-pptx` — `global-commands/coco-pptx.md`
Build or edit **CoCo / Cloud Practice** PowerPoint decks. Enforces the verified type scale from `CoCo_Leaders_Hot_Topic_v2.pptx` (April 2026).
- Open Sans Bold throughout — cover 28pt, content titles 22pt, body 12–14pt
- No footers, no shadows, no teal top bars on cards
- Two-level header rule (title + sub-header on every content slide)
- Invoke with `/coco-pptx` in Claude Code

**Use for:** CoCo programme decks, Cloud Practice internal/practitioner decks.
**Not for:** Formal client-facing Deloitte decks — use `deloitte-pptx` (Anthropic marketplace) for those.

---

### `deloitte-slides` — `deloitte-slides/SKILL.md`
Build Deloitte-branded presentations following the official merged Deloitte brand style guide.
- Covers both **Standard Deloitte** and **Cloud Practice** brand variants
- Enforces typography, color palette, slide layouts, footers, and icon rules
- Works in combination with the `deloitte-pptx` skill to generate `.pptx` files

**Triggers on:** "create a Deloitte deck", "build slides", "make a PPT", "Cloud Practice presentation", "client deck", etc.

## How to Install a Skill

Copy the skill folder into your Claude Code skills directory:
```
%APPDATA%\Claude\local-agent-mode-sessions\skills-plugin\<session-id>\<session-id>\skills\
```

## Style Guide Source

The merged Deloitte brand style guide (Standard + Cloud Practice) is at:
`deloitte-slides/references/deloitte_brand_style_guide.md`

Source files are maintained at:
`C:\Users\prateesingh\Desktop\AC\style-guides\Styling Guide\`

Last updated: April 2026 — type scale verified against `CoCo_Leaders_Hot_Topic_v2.pptx`.
