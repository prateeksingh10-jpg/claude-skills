---
name: deloitte-slides
description: "Build Deloitte-branded slides and presentations following the user's official merged Deloitte brand style guide (Standard Deloitte and Cloud Practice). ALWAYS use this skill whenever creating, building, editing, or generating any Deloitte presentation, slide deck, PowerPoint file, or client-facing deck -- even if the user does not say Deloitte explicitly but the context is a Deloitte consulting engagement. Also triggers for: make me a deck, build slides, create a PPT, Cloud Practice presentation, client deck, build a pitch, generate slides for the client. This skill enforces the specific style guide the user has curated and works in combination with the deloitte-pptx skill to produce the actual .pptx file."
---

# Deloitte Slides Skill

Enforces the user's curated Deloitte brand style guide when building any presentation or slide deck. Works alongside the deloitte-pptx skill for .pptx generation.

## Step 1: Determine Material Type

| Variant | Signals |
|---------|---------|
| Standard Deloitte | Internal decks, strategy, client presentations not under Cloud |
| Cloud Practice | Cloud migration, cloud sales, Deloitte Cloud offerings, cloud collateral |

If unclear, ask: Is this a Standard Deloitte deck or a Cloud Practice deck?

## Step 2: Load the Style Guide

Read references/deloitte_brand_style_guide.md -- the authoritative source for all styling decisions.

Key differences by variant:

| Rule | Standard Deloitte | Cloud Practice |
|------|------------------|----------------|
| Font | Calibri / Calibri Light | Open Sans / Open Sans Light |
| Primary accent | Deloitte Green #86BC25 | Teal 5 #0097A9 + Blue 3 #00A3E0 |
| Dark accent | n/a | Blue 6 #012169 |
| Footer | Deloitte Development LLC | Deloitte Cloud |
| Icons | Standard Deloitte library | Cloud Practice icon set (section 14.2) |
| Image style | Standard guidelines (section 6.3) | Abstract/data-inspired, no literal clouds (sections 6.1-6.2) |

## Step 3: Plan the Slide Structure

Before building, outline the deck -- what slides, which layouts (section 4), what content. Confirm with user before proceeding.

## Step 4: Build with deloitte-pptx

Invoke the deloitte-pptx skill to generate the .pptx, applying these style guide requirements:

### Typography (non-negotiable)
- Standard: Calibri Light for titles, Calibri for body. No Aptos, no other fonts.
- Cloud: Open Sans Light for headings (min 24pt), Open Sans Regular/Bold for body (max 28pt).

### Colors
- Primary accent: Deloitte Green #86BC25 (both variants)
- Accessible body text: #26890D (green), #007CB0 (blue), #0D8390 (teal)
- Cloud accents: Teal 5 #0097A9, Blue 3 #00A3E0, Blue 6 #012169
- Never use bright accents (#0DF200, #3EFAC5, #33F0FF) as fills or text
- Red/Orange/Yellow only for functional indicators

### Slide Layouts (section 4)
- Cover: logo top-left, headline bottom-left (Light font, Green, max 3 lines), Making an Impact badge bottom-right, White or Black background
- Content: page title top-left (Light font, black), subtitle below (Cool Gray 9 #75787B), copyright footer left, title+page# right
- Section dividers: bold black title + Deloitte Green subtitle, NO footer

### Mandatory Footer (content slides only)
Left: Copyright (c) [YEAR] Deloitte Development LLC. All rights reserved.
      [Cloud Practice: Deloitte Cloud instead]
Right: [Presentation Title] [Page #]

### Charts (section 9)
- Font: Calibri or Open Sans (Cloud), Cool Gray 9 for labels
- No 3D effects -- ever
- Highlight series in Deloitte Green or Accessible Blue; rest in Cool Grays

### Tables (section 10)
- Column headers: white text on Deloitte Green background, bold
- Alternating rows: White + Cool Gray 2 #D0D0CE

### Bullets (section 8)
Level 1: body text, no bullet
Level 2 (filled circle): 6pt space before
Level 3 (en dash), Level 4 (open circle), Level 5 (en dash): no extra space
Max 5 levels.

### Icons (section 14)
- Line/outline only, consistent stroke weight 1.5-2pt
- Default color: Black or Cool Gray 9
- Cloud: use Cloud Practice icon set (section 14.2)

## Step 5: Pre-Delivery Checklist
- Correct font: Calibri (Standard) or Open Sans (Cloud)
- Deloitte Green #86BC25 as primary accent
- No bright accents as fills or text
- No 3D chart effects
- Cover: logo top-left, Making an Impact badge bottom-right
- Copyright footer on every content slide (correct variant)
- Section dividers: no footer
- Cover headline: max 3 lines; bullets: max 5 levels
- Images not stretched; cover images sent to back
- Cloud: no literal cloud photography in primary image slots

---

## Reference: references/deloitte_brand_style_guide.md
- Section 2  -- Complete color palette
- Section 3  -- Full type scale
- Section 4  -- All 14 slide layout templates
- Section 5  -- Cloud Practice sales templates
- Section 6  -- Image guidelines
- Section 9  -- Chart standards
- Section 10 -- Table standards
- Section 14 -- Icon guidelines + Cloud Practice icon set
