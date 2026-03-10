# PDF Style Guide — SEO / AEO / GEO Audit Report

## Colours

| Role | Hex | Usage |
|------|-----|-------|
| Primary Dark | #0F172A | Headings, cover background |
| Accent Blue | #3B82F6 | Section headers, progress bars, links |
| Accent Teal | #0EA5E9 | Subheadings, icons |
| Success Green | #22C55E | Grade A/A+, High score indicators |
| Warning Amber | #F59E0B | Grade B/C, Medium priority |
| Danger Red | #EF4444 | Grade D/F, High priority flags |
| Light Grey BG | #F8FAFC | Alternating table rows, page background tint |
| White | #FFFFFF | Card backgrounds, body text on dark |
| Body Text | #1E293B | All regular body text |
| Muted Text | #64748B | Captions, footnotes |

---

## Fonts

Use ReportLab built-in fonts only (no external font dependencies):

| Role | Font | Size |
|------|------|------|
| Cover Title | Helvetica-Bold | 28pt |
| Cover Subtitle | Helvetica | 14pt |
| Section Header | Helvetica-Bold | 16pt |
| Subsection Header | Helvetica-Bold | 12pt |
| Body Text | Helvetica | 10pt |
| Table Header | Helvetica-Bold | 9pt |
| Table Body | Helvetica | 9pt |
| Caption/Footer | Helvetica | 8pt |
| Score Badge | Helvetica-Bold | 32pt |

---

## Page Layout

- **Page size**: A4 (595 x 842 points)
- **Margins**: 50pt all sides
- **Usable width**: 495pt
- **Usable height**: 742pt

---

## Cover Page Layout

```
[Full dark background #0F172A]

[Top: Website favicon/globe icon placeholder — simple circle]

[Large centered title]
"SEO / AEO / GEO Audit Report"  — White, 28pt Bold

[Subtitle]
"Prepared for: {domain}"  — Teal #0EA5E9, 14pt

[Date]
"Generated: {date}"  — Muted grey, 10pt

[Large Score Badge — centre page]
Circle, 120pt diameter
Background colour = grade colour (green/amber/red)
Score number inside: White, 40pt Bold
"Overall Score" label below: White, 10pt

[Footer bar]
Thin accent line + "Confidential Audit Report | {url}"
```

---

## Section Page Layout

Each of the 10 audit section pages follows this template:

```
[Section Header Bar]
Full-width rectangle, Accent Blue #3B82F6, 30pt tall
White text: "{emoji} {Section Name}"  16pt Bold
Right-aligned: Grade badge (letter + score)

[Score Progress Bar]
Label: "Score: {n}/100"
Bar: full width, grey background, filled portion = grade colour
Height: 14pt, rounded corners

[Findings Block]
Heading: "What We Found"  12pt Bold
Bullet points, 10pt, 1.2x line spacing

[Recommendations Table]
Columns: Priority | Recommendation | Expected Impact
Header row: Dark background #0F172A, white text, 9pt Bold
Body rows: alternating white / #F8FAFC, 9pt
Priority icons:
  🔴 High  — Red text
  🟡 Medium — Amber text
  🟢 Low   — Green text
```

---

## Score Badge (inline, per section)

Small coloured pill/rectangle beside each section name in the TOC and summary:
- Width: 45pt, Height: 18pt, rounded corners
- Background = grade colour
- Text: Grade letter + score (e.g. "B  74") — White, 8pt Bold

---

## Table Styles

```python
from reportlab.platypus import TableStyle
from reportlab.lib import colors

AUDIT_TABLE_STYLE = TableStyle([
    ('BACKGROUND', (0,0), (-1,0), colors.HexColor('#0F172A')),
    ('TEXTCOLOR', (0,0), (-1,0), colors.white),
    ('FONTNAME', (0,0), (-1,0), 'Helvetica-Bold'),
    ('FONTSIZE', (0,0), (-1,0), 9),
    ('ROWBACKGROUNDS', (0,1), (-1,-1), [colors.white, colors.HexColor('#F8FAFC')]),
    ('FONTNAME', (0,1), (-1,-1), 'Helvetica'),
    ('FONTSIZE', (0,1), (-1,-1), 9),
    ('GRID', (0,0), (-1,-1), 0.5, colors.HexColor('#E2E8F0')),
    ('TOPPADDING', (0,0), (-1,-1), 6),
    ('BOTTOMPADDING', (0,0), (-1,-1), 6),
    ('LEFTPADDING', (0,0), (-1,-1), 8),
    ('RIGHTPADDING', (0,0), (-1,-1), 8),
    ('VALIGN', (0,0), (-1,-1), 'MIDDLE'),
])
```

---

## Grade Colour Mapping (Python)

```python
def grade_colour(score):
    if score >= 90: return '#22C55E'   # Green  A+
    if score >= 80: return '#22C55E'   # Green  A
    if score >= 70: return '#3B82F6'   # Blue   B
    if score >= 60: return '#F59E0B'   # Amber  C
    if score >= 50: return '#F97316'   # Orange D
    return '#EF4444'                    # Red    F

def letter_grade(score):
    if score >= 90: return 'A+'
    if score >= 80: return 'A'
    if score >= 70: return 'B'
    if score >= 60: return 'C'
    if score >= 50: return 'D'
    return 'F'
```

---

## Progress Bar (Python / ReportLab)

```python
from reportlab.platypus import Flowable
from reportlab.lib import colors

class ScoreBar(Flowable):
    def __init__(self, score, width=495, height=14):
        self.score = score
        self.bar_width = width
        self.bar_height = height
        self.width = width
        self.height = height + 20

    def draw(self):
        # Background
        self.canv.setFillColor(colors.HexColor('#E2E8F0'))
        self.canv.roundRect(0, 0, self.bar_width, self.bar_height, 6, fill=1, stroke=0)
        # Fill
        fill_w = (self.score / 100) * self.bar_width
        colour = grade_colour(self.score)
        self.canv.setFillColor(colors.HexColor(colour))
        self.canv.roundRect(0, 0, fill_w, self.bar_height, 6, fill=1, stroke=0)
        # Label
        self.canv.setFillColor(colors.HexColor('#1E293B'))
        self.canv.setFont('Helvetica-Bold', 9)
        self.canv.drawString(0, self.bar_height + 4, f"Score: {self.score}/100  |  Grade: {letter_grade(self.score)}")
```

---

## Footer (every page)

```python
def add_footer(canvas, doc):
    canvas.saveState()
    canvas.setFont('Helvetica', 8)
    canvas.setFillColor(colors.HexColor('#64748B'))
    canvas.drawString(50, 30, f"SEO / AEO / GEO Audit Report")
    canvas.drawRightString(545, 30, f"Page {doc.page}")
    canvas.setStrokeColor(colors.HexColor('#E2E8F0'))
    canvas.line(50, 40, 545, 40)
    canvas.restoreState()
```
