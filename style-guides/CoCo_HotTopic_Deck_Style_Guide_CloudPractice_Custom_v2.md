# CoCo Hot Topic Deck Style Guide — Cloud Practice Custom Build
## Use this when: building any deck that matches the CoCo Hot Topic visual style
## Do NOT use for: standard Deloitte template builds (use Deloitte_Brand_Style_Guide instead)
## Source: CoCo_Developers_Hot_Topic_Deck.pptx — reverse-engineered April 2026
**Deloitte USI Snowflake CoE | April 2026**

> **When to use this guide:**
> You are building a deck in python-pptx that should look like the CoCo Hot Topic series.
> White backgrounds only. Open Sans headings. Calibri body. Teal `#0097A9` as the primary accent.
> Slide size: 10.00" × 5.625" — NOT the standard Deloitte 13.33" × 7.50" template.
> Build from a blank Presentation() — do NOT use template.pptx.

---

## 1. Canvas

```python
from pptx import Presentation
from pptx.util import Inches, Pt, Emu
from pptx.dml.color import RGBColor
from pptx.enum.text import PP_ALIGN
from pptx.enum.shapes import MSO_SHAPE

prs = Presentation()
prs.slide_width  = Emu(9144000)   # 10.00 inches
prs.slide_height = Emu(5143500)   # 5.625 inches
```

All slides use a **solid white background**. No dark slides, no black themes.

```python
def set_white_bg(slide):
    fill = slide.background.fill
    fill.solid()
    fill.fore_color.rgb = RGBColor(0xFF, 0xFF, 0xFF)
```

---

## 2. Color Palette

```python
TEAL         = RGBColor(0x00, 0x97, 0xA9)  # #0097A9  primary accent
NAVY         = RGBColor(0x01, 0x21, 0x69)  # #012169  secondary header / title slide title
GREEN        = RGBColor(0x00, 0x9A, 0x44)  # #009A44  positive / success
RED          = RGBColor(0xC0, 0x50, 0x4D)  # #C0504D  negative / error / blocking hook
BLACK        = RGBColor(0x00, 0x00, 0x00)  # #000000  slide titles (content slides)
DARK_NAVY    = RGBColor(0x1A, 0x1A, 0x2E)  # #1A1A2E  code block background
GRAY_BODY    = RGBColor(0x53, 0x56, 0x5A)  # #53565A  body text
GRAY_LIGHT   = RGBColor(0x97, 0x99, 0x9B)  # #97999B  labels, footnotes, date
CARD_BG      = RGBColor(0xF2, 0xF2, 0xF2)  # #F2F2F2  card / row background
CARD_BORDER  = RGBColor(0xD0, 0xD0, 0xCE)  # #D0D0CE  card borders, dividers
WHITE        = RGBColor(0xFF, 0xFF, 0xFF)  # #FFFFFF  reversed text, backgrounds
POS_BG       = RGBColor(0xF0, 0xFA, 0xF4)  # #F0FAF4  positive row tint (green)
NEG_BG       = RGBColor(0xFF, 0xF5, 0xF5)  # #FFF5F5  negative row tint (red)
```

---

## 3. Typography

```python
FONT_HEADING = 'Open Sans'   # ALL headings, card titles, numbered badges, labels
FONT_BODY    = 'Calibri'     # ALL body text, descriptions, prose
FONT_CODE    = 'Consolas'    # Code blocks only
```

### Type Scale

| Style | Font | Size | Color | Bold | Used for |
|---|---|---|---|---|---|
| Slide title | Open Sans | 38pt | `#000000` | Yes | Main heading on every content slide |
| Title slide main title | Open Sans | 38pt | `#012169` | Yes | Title slide only — navy not black |
| Subtitle tag | Open Sans | 13pt | `#0097A9` | Yes | Teal line immediately below slide title |
| Intro sentence | Calibri | 13pt | `#97999B` | No | Gray supporting sentence below subtitle |
| Card heading | Open Sans | 14pt | `#000000` | Yes | Heading inside a card |
| Card subheading | Open Sans | 13pt | `#012169` | Yes | Secondary heading inside card |
| Card label | Open Sans | 12pt | `#97999B` | Yes | Small labels (e.g. "Setup", "Cost", "Best for") |
| Body text | Calibri | 13pt | `#53565A` | No | Standard descriptions and prose |
| Small body | Calibri | 12pt | `#53565A` | No | Compact descriptions inside small cards |
| Code | Consolas | 11pt | `#FFFFFF` | No | On dark `#1A1A2E` background |
| Takeaway text | Calibri | 13pt | `#FFFFFF` | Yes | Inside teal takeaway bar |
| Number badge | Open Sans | 13pt | `#FFFFFF` | Yes | Inside teal circles |
| Date / footnote | Calibri | 11pt | `#97999B` | No | Slide footer, date line |

---

## 4. Safe Zone

```
Slide:              10.00" × 5.625"
Left margin:        x = 0.50"
Content right edge: x = 9.50" (w = 9.00" from left margin)
Slide title top:    y = 0.28"
Content start:      y = 1.05" (after title only)
                    y = 1.28–1.43" (after title + subtitle tag + intro)
Content safe bottom:y = 4.50"
Takeaway bar zone:  y = 4.55" – 5.12" (varies per slide)
```

---

## 5. Core Helper Functions

```python
def tb(slide, x, y, w, h, text,
       font=FONT_BODY, size=13, bold=False, color=GRAY_BODY,
       align=PP_ALIGN.LEFT, wrap=True, italic=False):
    shp = slide.shapes.add_textbox(
        Inches(x), Inches(y), Inches(w), Inches(h))
    tf = shp.text_frame
    tf.word_wrap = wrap
    p = tf.paragraphs[0]
    p.alignment = align
    run = p.add_run()
    run.text = text
    run.font.name = font
    run.font.size = Pt(size)
    run.font.bold = bold
    run.font.italic = italic
    run.font.color.rgb = color
    return shp

def rect(slide, x, y, w, h, fill, line=None, lw=0.75):
    shp = slide.shapes.add_shape(
        MSO_SHAPE.RECTANGLE,
        Inches(x), Inches(y), Inches(w), Inches(h))
    shp.fill.solid()
    shp.fill.fore_color.rgb = fill
    if line:
        shp.line.color.rgb = line
        shp.line.width = Pt(lw)
    else:
        shp.line.fill.background()
    return shp

def oval(slide, x, y, d, fill):
    shp = slide.shapes.add_shape(
        MSO_SHAPE.OVAL,
        Inches(x), Inches(y), Inches(d), Inches(d))
    shp.fill.solid()
    shp.fill.fore_color.rgb = fill
    shp.line.fill.background()
    return shp
```

---

## 6. Repeating Elements

### 6.1 Slide Title

```python
def add_slide_title(slide, text):
    tb(slide, 0.5, 0.28, 9.0, 0.6, text,
       font=FONT_HEADING, size=38, bold=True, color=BLACK)
```

### 6.2 Subtitle Tag (teal line below title)

```python
def add_subtitle_tag(slide, text, y=0.90):
    tb(slide, 0.5, y, 9.0, 0.35, text,
       font=FONT_HEADING, size=13, bold=True, color=TEAL)
```

### 6.3 Intro Sentence (gray, below subtitle tag)

```python
def add_intro(slide, text, y=1.28):
    tb(slide, 0.5, y, 9.0, 0.35, text,
       font=FONT_BODY, size=13, bold=False, color=GRAY_LIGHT)
```

### 6.4 Takeaway Bar

```python
def add_takeaway(slide, text, y=4.88):
    rect(slide, 0.5, y, 9.0, 0.45, TEAL)
    tb(slide, 0.65, y, 8.7, 0.45, text,
       font=FONT_BODY, size=13, bold=True, color=WHITE)
```

Common y values: `4.55 / 4.60 / 4.65 / 4.88 / 4.90 / 4.93 / 5.08 / 5.12`

### 6.5 Left Sidebar (title slide and close slide only)

```python
def add_left_sidebar(slide):
    rect(slide, 0, 0, 0.18, 5.625, TEAL)
```

---

## 7. Card Patterns

### 7.1 Standard Card — gray background, subtle border

```python
def standard_card(slide, x, y, w, h):
    return rect(slide, x, y, w, h, CARD_BG, line=CARD_BORDER)
```

### 7.2 Left-Accent Card — gray card + thin colored left bar

Most common pattern. Used for: skills, resources, reference items.

```python
def left_accent_card(slide, x, y, w, h, color=TEAL):
    rect(slide, x, y, w, h, CARD_BG, line=CARD_BORDER)   # card body
    rect(slide, x, y, 0.06, h, color)                      # left accent bar
    # Content starts at x+0.18 to clear the bar
```

Accent color options:
- `TEAL` `#0097A9` — standard (most items)
- `RED` `#C0504D` — blockers, PreToolUse hooks
- `GREEN` `#009A44` — positive examples

### 7.3 Top-Accent Card — colored header band + gray body

Used for: two-column comparisons (Snowsight vs CLI), tool categories.

```python
def top_accent_card(slide, x, y, w, total_h,
                    header_text, header_color=TEAL, header_h=0.50):
    rect(slide, x, y, w, header_h, header_color)            # header band
    tb(slide, x+0.15, y+0.05, w-0.15, header_h-0.05,
       header_text, font=FONT_HEADING, size=16, bold=True, color=WHITE)
    rect(slide, x, y+header_h, w, total_h-header_h,         # card body
         CARD_BG, line=CARD_BORDER)
```

Header color options:
- `TEAL` `#0097A9` — primary card (e.g. Snowsight, Skills)
- `NAVY` `#012169` — secondary card (e.g. CLI, GitHub, Jira)

### 7.4 Top-Strip Card — thin top accent (0.06") + gray body

Used for: compact multi-card rows (subagent types, hook events).

```python
def top_strip_card(slide, x, y, w, h, color=TEAL):
    rect(slide, x, y, w, h, CARD_BG, line=CARD_BORDER)     # full card
    rect(slide, x, y, w, 0.06, color)                       # top strip only
    # Content starts at y+0.10 to clear the strip
```

### 7.5 Positive / Negative Contrast Row

Used for "what it is / what it isn't" comparisons.

```python
def contrast_row(slide, x, y, w, h, positive=True):
    bg    = POS_BG if positive else NEG_BG
    color = GREEN  if positive else RED
    icon  = '✅'   if positive else '❌'
    rect(slide, x, y, w, h, bg, line=CARD_BORDER)          # row background
    rect(slide, x, y, 0.07, h, color)                       # left accent bar
    # Icon: x+0.15, Calibri 20pt
    # Label: x+0.72, Open Sans 14pt bold BLACK
    # Description: x+3.3, Calibri 13pt GRAY_BODY
```

### 7.6 Teal-Border Row (if/then — close slide)

```python
def teal_border_row(slide, x, y, w, h):
    rect(slide, x, y, w, h, CARD_BG, line=TEAL, lw=1.0)
    # Condition: x+0.25, Open Sans bold NAVY
    # Arrow →:   x+2.85, w=0.3"
    # Action:    x+3.25, Calibri GRAY_BODY
```

### 7.7 Code Block

```python
def code_block(slide, x, y, w, h, code_text):
    rect(slide, x, y, w, h, DARK_NAVY, line=CARD_BORDER)
    tb(slide, x+0.1, y+0.05, w-0.2, h-0.1, code_text,
       font=FONT_CODE, size=11, color=WHITE)
```

---

## 8. Numbered Items

### 8.1 Numbered List Row (vertical — e.g. "5 things CoCo knows")

```
Teal circle:    0.42×0.42", at (x, y)
Number text:    Open Sans 13pt bold white, centered in circle
Label:          x+0.55, y-0.02, w=2.4, Open Sans 14pt bold BLACK
Divider line:   x+3.05, y+0.05, w=0, h=0.31, line=CARD_BORDER
Description:    x+3.20, y-0.02, w=5.9, Calibri 13pt GRAY_BODY
Row spacing:    0.68" between item tops
```

### 8.2 Numbered Card in Grid (2×2 — e.g. "4 extension mechanisms")

```
Card:           4.3×1.7", CARD_BG + CARD_BORDER
Left bar:       0.07×1.7", TEAL
Circle:         0.36×0.36", TEAL — at (x+0.15, y+0.15)
Number:         Open Sans 13pt bold white, centered
Title:          x+0.60, y+0.15, Open Sans 15pt bold BLACK
Body:           x+0.20, y+0.65, Calibri 13pt GRAY_BODY

Column 1 x:  0.5     Column 2 x:  5.0
Row 1 y:     1.45    Row 2 y:     3.35
```

---

## 9. Teal Bullet Point

```python
def teal_bullet(slide, x, y, text):
    rect(slide, x, y+0.14, 0.1, 0.1, TEAL)                # dot
    tb(slide, x+0.22, y, 8.78, 0.38, text,
       font=FONT_HEADING, size=13, color=GRAY_BODY)
# Row spacing: 0.42" between bullets
```

---

## 10. Title Slide

```
Background:      White
Left sidebar:    TEAL 0.18" bar, full height — add_left_sidebar()
Main title:      x=0.60, y=1.00, w=4.4, h=1.9
                 Open Sans 38pt bold NAVY (#012169) — navy on title, not black
Subtitle:        x=0.503, y=3.778, w=5.221
                 Calibri 16pt GRAY_BODY
Date line:       x=0.60, y=5.10, w=8.8
                 Calibri 11pt GRAY_LIGHT
```

---

## 11. Close Slide

```
Background:      White
Left sidebar:    TEAL 0.18" bar — same as title slide
Slide title:     Standard (section 6.1)
If/then rows:    teal_border_row() — section 7.6
                 3 rows, y=1.10 / 2.06 / 3.02, h=0.82 each, x=0.60, w=8.9
Takeaway bar:    Standard, y=4.55
```

---

## 12. Spacing Quick Reference

| Element | Gap |
|---|---|
| Between two-column cards | 0.20" |
| Between two-row cards | 0.20" |
| Text padding inside card (left) | 0.15" |
| Text padding inside card (top) | 0.10" |
| Between numbered list rows | 0.68" |
| Between teal bullet rows | 0.42" |
| Key-value row height | 0.44" |

---

## 13. Full Color Quick Reference

| Variable | Hex | Use |
|---|---|---|
| TEAL | `#0097A9` | Primary accent — circles, header bands, takeaway bars, bullets |
| NAVY | `#012169` | Secondary headers — CLI, GitHub, dark card headers; title slide main text |
| GREEN | `#009A44` | Positive rows and accents |
| RED | `#C0504D` | Negative rows, PreToolUse blocking hooks |
| BLACK | `#000000` | Slide titles (content slides) |
| DARK_NAVY | `#1A1A2E` | Code block background |
| GRAY_BODY | `#53565A` | All body text |
| GRAY_LIGHT | `#97999B` | Labels, intro sentences, dates, footnotes |
| CARD_BG | `#F2F2F2` | All card and row backgrounds |
| CARD_BORDER | `#D0D0CE` | Card borders, dividers |
| WHITE | `#FFFFFF` | Reversed text, slide background |
| POS_BG | `#F0FAF4` | Positive/success row background |
| NEG_BG | `#FFF5F5` | Negative/error row background |


## 14. Architecture & Diagram Slides

### Design Pattern: Split Layout (Numbered Walkthrough + Diagram)

Use when: explaining how a system works, where a tool sits in a stack, or how data flows through layers.

**Layout: Left 30% / Right 70%**

| Zone | Content | Purpose |
|---|---|---|
| Left panel | Numbered steps (1–N) with title + short description | Tells the narrative — someone can read top-to-bottom and understand the flow |
| Right panel | Clean layered diagram with numbered circles matching left | Shows the structure — visual anchor, not the primary information carrier |
| Divider | Dashed vertical line at ~x=3.15 | Separates panels |

### Left Panel: Numbered Steps

```python
# Number circle
oval(slide, SX, y + 0.05, 0.26, step_color)
tb(slide, SX, y + 0.05, 0.26, 0.26, num,
   font=FONT_HEADING, size=11, bold=True, color=WHITE, align=PP_ALIGN.CENTER)

# Step title
tb(slide, SX + 0.34, y + 0.01, 2.26, 0.18, title,
   font=FONT_HEADING, size=9, bold=True, color=BLACK)

# Step description
tb(slide, SX + 0.34, y + 0.19, 2.26, 0.28, desc,
   font=FONT_BODY, size=7.5, color=GRAY_LIGHT)
```

- Row height: 0.50" per step
- Colour-code circles by zone (gray = infrastructure, teal = tool operations, red = gates, green = governance)
- No connecting lines between steps — clean numbered list
- No product features or pricing in descriptions — pure architecture flow

### Right Panel: Layer Boxes

Each layer = header strip (0.22" tall, coloured) + body (0.28–0.30" tall, light fill).

```python
# Header strip
rect(slide, RX, y, RW, 0.22, header_color)
tb(slide, RX + 0.1, y, 3, 0.22, layer_name,
   font=FONT_HEADING, size=9, bold=True, color=WHITE)

# Body
rect(slide, RX, y + 0.22, RW, 0.30, body_fill, line=border_color)
tb(slide, RX + 0.15, y + 0.22, RW - 0.3, 0.30, components,
   font=FONT_BODY, size=9, color=DARK_TEXT)
```

- Keep boxes clean — header + component list only, no detail text
- Down arrows between layers: 0.18" gap, MID_TEXT color, triangle end
- Bidirectional arrows: TEAL, 1.5pt, label with step number + "Reads"/"Writes"

### Numbered Circles on Diagram

```python
def add_num_circle(slide, x, y, num, color):
    oval(slide, x, y, 0.24, color)
    # White border for visibility
    shp = slide.shapes[-1]
    shp.line.color.rgb = WHITE
    shp.line.width = Pt(1.0)
    tb(slide, x, y, 0.24, 0.24, str(num),
       font=FONT_HEADING, size=10, bold=True, color=WHITE, align=PP_ALIGN.CENTER)
```

- Place on header strip of each layer, top-right corner
- Match left panel circle colours
- Cross-reference creates visual linkage between narrative and diagram

### Boundary Indicators

- **Red edge bar** (0.05" wide, transparency 50%) on right edge of layers CoCo cannot access
- **Green dashed wrapper** (1.5pt, dashType) around governed layers — governance wraps, not sits below
- **Lateral MCP arrow** to CI/CD panel — purple, 1.2pt, positioned beside main stack not below it

### Governance Wrapper

```python
rect(slide, RX - 0.05, GY, RW + 0.1, wrapper_h, GREEN_TRANSPARENT)
# line=GREEN, width=1.5pt, dashType="dash"
# Label inside at bottom: governance components, 7pt, GREEN, centre-aligned
```

### Review Gate Bar (inside governance wrapper)

```python
rect(slide, RX + 0.08, rev_y, RW - 0.16, 0.22, WHITE, line=RED)
# Numbered circle (RED) at left edge
# "All output requires human review before production" — 8pt RED bold, centre-aligned
```

### Key Principles

1. **Left side tells the story, right side shows the structure** — redundancy is the point
2. **No product features on the diagram** — no "$20/mo", no "Snowsight free", no "CoE Skills Library"
3. **Colour-code by zone** — consistent across both panels
4. **Clean boxes** — header + components only, no detail paragraphs inside boxes
5. **Numbered circles create the cross-reference** — the same numbers on both sides
6. **Takeaway bar** — centre-aligned, same as all content slides

---
