---
name: seo-aeo-geo-audit
description: >
  Perform a comprehensive SEO, AEO (Answer Engine Optimization), and GEO (Generative Engine Optimization) audit for any website.
  Trigger this skill whenever a user shares a website URL and asks for an SEO audit, site analysis, content audit, competitor analysis,
  speed report, technical SEO check, local SEO review, backlink analysis, or any combination of these. Also trigger when users say things like
  "audit my site", "check my website SEO", "how is my site performing", "analyse my competitors", "is my site AEO-ready", or "how do I rank better".
  This skill produces a fully scored, graded, and actionable PDF audit report covering all major modern SEO pillars.
---

# SEO / AEO / GEO Audit Skill

## Overview

This skill produces a **professional PDF audit report** for any website. It covers 10 audit dimensions, each scored and graded, with prioritised recommendations. The report uses web search to gather real, current data about the site and its competitors.

---

## Step 1: Gather User Inputs

Before starting the audit, collect:

1. **Website URL** — the site to audit (required)
2. **Business type** — local business or broader/national/global?
   - If **local**: ask for their city/region (used for local competitor research)
   - If **broader**: ask for their primary target country/market
3. **Primary keyword or niche** — what does this business do? (e.g. "plumber", "SaaS HR software", "fashion brand")
4. **Known competitors** (optional) — if they know any, include these. Otherwise the skill finds them.

If any of these are missing, ask before proceeding.

---

## Step 2: Research Phase (Web Search)

Use web search to gather data across these dimensions. Run searches in this order:

### 2a. Competitor Discovery
Search: `"{keyword}" "{city or market}" top competitors site:` alternatives
- Find the **top 10 competitors** ranking for the user's primary keyword
- If local: focus on local/map pack competitors in their city
- Record: competitor name, URL, estimated traffic tier (high/medium/low based on search presence)

### 2b. Site Crawl Signals
Search the target URL directly and look for:
- Is the site indexable? (search `site:{url}` to check indexed pages)
- Any obvious technical errors surfaced in search results
- Date of last content update (recency signals)

### 2c. Speed & Core Web Vitals
Search: `PageSpeed Insights {url}` or `GTmetrix {url}` for any published scores
- Also check if site uses a CDN, lazy loading, modern image formats (WebP)
- Note: actual CWV scores require PageSpeed API; flag this in report if unavailable

### 2d. Backlink Profile
Search: `backlinks {url}` or `{url} referring domains`
- Use Ahrefs/Moz/SEMrush public data surfaced in search results
- Note domain authority signals, number of referring domains if available

### 2e. On-Page & Schema
Fetch the homepage HTML (via web_fetch) and check:
- Title tag (present, keyword-rich, under 60 chars?)
- Meta description (present, compelling, under 160 chars?)
- H1 tag (present, unique, keyword-relevant?)
- Schema markup (JSON-LD present? What types — LocalBusiness, Organization, FAQ, etc.?)
- Open Graph / Twitter Card tags

### 2f. Local SEO (if applicable)
Search: `"{business name}" Google Business Profile` or `"{url}" GMB`
- Is Google Business Profile claimed and verified?
- NAP (Name, Address, Phone) consistency across the web
- Local citations present?

### 2g. Content & E-E-A-T
Fetch 1–2 key pages (homepage + blog or about page) and evaluate:
- Experience: First-hand experience signals (case studies, testimonials, reviews)
- Expertise: Author bios, credentials, qualifications shown?
- Authoritativeness: Brand mentions, press, awards?
- Trustworthiness: HTTPS, privacy policy, contact page, About page, trust signals?

### 2h. AEO (Answer Engine Optimization)
Check for:
- FAQ sections on key pages
- Featured snippet-optimised content (question/answer format)
- Structured data for FAQ, HowTo, Speakable
- Conversational content targeting "who/what/when/where/why/how" queries

### 2i. GEO (Generative Engine Optimization)
Check for:
- Clear, factual, citable content that AI tools (ChatGPT, Gemini, Perplexity) can use
- Brand entity clarity (is the brand/business clearly defined on the page?)
- Wikipedia or knowledge panel presence
- Content depth and topical authority on core subjects

### 2j. Social Media Presence
Search: `"{business name}" site:linkedin.com OR site:instagram.com OR site:facebook.com OR site:twitter.com`
- Which platforms are active?
- Social profiles linked from the website?

### 2k. Mobile-Friendliness
- Check via web_fetch if the site has a responsive viewport meta tag
- Search: `"{url}" mobile friendly test` for any public reports

---

## Step 3: Score Each Section

Score each of the 10 audit sections on a **0–100 scale**, then assign a letter grade:

| Score | Grade |
|-------|-------|
| 90–100 | A+ |
| 80–89 | A |
| 70–79 | B |
| 60–69 | C |
| 50–59 | D |
| Below 50 | F |

**Scoring rubric per section** — see `references/scoring-rubric.md` for detailed criteria.

Calculate an **Overall SEO Health Score** = weighted average of all 10 sections (weights in rubric file).

---

## Step 4: Generate the PDF Report

Use **ReportLab** (Python) to create a professional PDF. Follow the structure below exactly.

Read `references/pdf-style-guide.md` for colours, fonts, and layout specs before writing any code.

### Report Structure

1. **Cover Page**
   - Report title: "SEO / AEO / GEO Audit Report"
   - Website audited
   - Date generated
   - Overall Health Score (large, colour-coded circle/badge)

2. **Executive Summary** (1 page)
   - 3–5 sentence overview of site's current SEO health
   - Top 3 strengths
   - Top 3 critical issues
   - Overall score badge

3. **Competitor Landscape** (1–2 pages)
   - Table of top 10 competitors with: Name, URL, Traffic Tier, Key Strengths
   - Brief narrative on competitive gaps

4. **Audit Sections** (one page per section, 10 sections total):
   For each section include:
   - Section title + icon emoji
   - Score bar (visual progress bar) + letter grade
   - Findings (bullet points, concise)
   - Recommendations table: Priority (🔴 High / 🟡 Medium / 🟢 Low) | Action | Expected Impact

   Sections in order:
   1. Technical SEO (robots.txt, sitemap, crawl errors, HTTPS)
   2. On-Page SEO (title tags, meta, H1, headers, schema)
   3. Website Speed & Core Web Vitals
   4. Content Quality & E-E-A-T
   5. Backlink Profile
   6. Competitor Analysis
   7. Local SEO (if applicable; skip or mark N/A for non-local)
   8. AEO — Answer Engine Optimization
   9. GEO — Generative Engine Optimization
   10. Mobile-Friendliness & UX

5. **Social Media Presence** (half page)
   - Table of platforms: present/absent, linked from site, activity level

6. **Priority Action Plan** (1 page)
   - Consolidated table of ALL high-priority recommendations across sections
   - Sorted by impact
   - 30-day, 60-day, 90-day quick win roadmap

7. **Appendix**
   - Raw data notes, search queries used, data sources

---

## Step 5: Save and Return the PDF

```python
# Save to outputs
output_path = "/mnt/user-data/outputs/seo_audit_{domain}_{date}.pdf"
```

Present the file to the user using the `present_files` tool.

Also provide a short **3–5 sentence chat summary** highlighting:
- Overall score
- The single most urgent fix
- The biggest competitive opportunity spotted

---

## Important Notes

- **Always use web search** to get real, current data. Do not make up scores or competitor names.
- If a data point is genuinely unavailable (e.g. CWV scores not publicly indexed), clearly note "Data unavailable — manual check recommended" in that section rather than guessing.
- For local businesses, the Local SEO section should be treated as **high priority** and weighted accordingly.
- Tone should be **professional, clear, and encouraging** — this report may be shared with clients.
- All recommendations must be **specific and actionable**, not generic (e.g. "Add FAQ schema to your /services page" not just "Add schema markup").

---

## Reference Files

- `references/scoring-rubric.md` — Detailed scoring criteria and section weights
- `references/pdf-style-guide.md` — Colours, fonts, layout specs for the PDF
