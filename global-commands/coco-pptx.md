---
name: coco-pptx
description: Build or edit Deloitte Cloud Practice / CoCo Programme PowerPoint decks using python-pptx. Enforces the verified type scale from CoCo_Leaders_Hot_Topic_v2.pptx — Open Sans Bold, cover 28pt, content 22pt, body 12-14pt. No footers, no shadows, no teal top bars on cards.
---

# CoCo / Cloud Practice PPTX Skill

Use this skill for any Deloitte **Cloud Practice** or **CoCo Programme** PowerPoint deck.

> **Not for:** Formal client-facing Deloitte decks built from the official Aptos template — use `deloitte-pptx` for those.

---

## Style Rules (Source of Truth)

All rules come from:
`C:\Users\prateesingh\Desktop\AC\style-guides\Styling Guide\Deloitte_Brand_Style_Guide___PPT___Document_Reference.md`
Sections 3.1, 16.1, 16.2, 16.3 are the binding overrides for this skill.

### Type Scale — Open Sans Bold throughout

| Element | Size | Weight |
|---|---|---|
| Cover slide title | 28pt | Bold |
| Content slide title | 22pt | Bold |
| Sub-header (descriptor line below title) | 11pt | Bold |
| Stat callouts / big numbers | 20pt | Bold |
| Body / card text — sparse slides | 14pt | Regular |
| Body / card text — dense slides | 12pt | Regular |
| Labels, annotations, small captions | 10pt | Regular |

### Colors

| Token | Hex | Use |
|---|---|---|
| Navy / Blue 6 | `#012169` | Slide header band, card titles |
| Teal 5 | `#0097A9` | Sub-header text only |
| White | `#FFFFFF` | Header text on navy band, card fill |
| Cool Gray 2 | `#D0D0CE` | Card borders (0.75pt) |
| Near-black | `#1A1A1A` | Body text |
| Cool Gray 9 | `#75787B` | Labels, captions |
| Amber BG | `#FFF8E8` | Callout / caveat boxes only |
| Amber border | `#ED8B00` | Callout box border |
| Amber text | `#7A4000` | Callout box text |

### Hard Rules — Never Break These

1. **No footers** on any slide — not copyright, not slide numbers, nothing.
2. **No shadows** on any shape — set `shadow: none` or omit shadow objects entirely.
3. **No teal top bars** on cards — cards are white fill + gray border only.
4. **No coloured decorative lines** at the top or bottom of content slides.
5. **Font is Open Sans** — not Calibri, not Aptos. Open Sans Bold for all headings.
6. **Two-level header rule** — every content slide needs a title (22pt) AND a sub-header (11pt, teal) that says what the slide is comparing/showing.
7. **No org attribution on content slides** — no team names, programme names, or dates on slide bodies. Cover and close slides only.
8. **Neutral competitor claims** — never name a competitor weakness. Use "general-purpose AI" framing.

### Card Pattern

```
┌─────────────────────────────────┐
│                                 │
│  Card Title  (Open Sans Bold    │
│  12pt, navy #012169)            │
│                                 │
│  Body text — Open Sans 12-14pt  │
│  White fill. Gray border.       │
│  No top bar. No shadow.         │
│                                 │
└─────────────────────────────────┘
  Fill:   #FFFFFF
  Border: #D0D0CE, 0.75pt
```

### Takeaway Bar (closing line on slides)

Every slide with a closing key-message line uses a solid teal bar, full width, white bold text centred inside. Never a thin line + plain text.

```python
# Takeaway bar — python-pptx
slide.addShape(RECTANGLE, x=M_L, y=y, w=CW, h=0.45,
    fill='#0097A9', line='#0097A9')
slide.addText(text, x=M_L+0.15, y=y, w=CW-0.3, h=0.45,
    fontSize=13, bold=True, font='Open Sans',
    color='#FFFFFF', align='center', valign='middle')
```

---

## Workflow

1. **Read** the brief or existing deck structure
2. **Plan** slides — confirm title + sub-header for each before writing code
3. **Build** using python-pptx (preferred for programmatic builds)
4. **QA** — convert to PDF → images, visually inspect every slide for:
   - Font sizes correct (not inheriting wrong defaults)
   - No shadows on shapes
   - No footers
   - Header band + title + sub-header present on every content slide
   - Body text not overflowing card boundaries
5. **Fix and re-verify** — do not declare done until a full QA pass is clean

## Converting to Images for QA

```bash
python scripts/office/soffice.py --headless --convert-to pdf output.pptx
rm -f slide-*.jpg
pdftoppm -jpeg -r 150 output.pdf slide
ls -1 "$PWD"/slide-*.jpg
```

---

## Reference

Full style guide:
`C:\Users\prateesingh\Desktop\AC\style-guides\Styling Guide\Deloitte_Brand_Style_Guide___PPT___Document_Reference.md`

Source deck verified against:
`C:\Users\prateesingh\Desktop\AC\SF Coco\Main Folder - Start Here -\Phase_6_Delivery_Tracks\CoCo_Leaders_Hot_Topic_v2.pptx`
