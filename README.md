# 🔍 Deepak's SEO / AEO / GEO Audit Skill for Claude

> A comprehensive, AI-powered SEO audit skill for Claude Code — covering Technical SEO, On-Page, Speed, E-E-A-T Content, Backlinks, Competitor Analysis, Local SEO, AEO (Answer Engine Optimization), GEO (Generative Engine Optimization), and Mobile UX.

![Claude Code Skill](https://img.shields.io/badge/Claude%20Code-Skill-blue)
![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)
![By Deepak](https://img.shields.io/badge/Built%20by-Deepak-green)

---

## ✨ What This Skill Does

Just give Claude your website URL and it will generate a **full professional PDF audit report** with:

- ✅ **10 audit sections**, each scored out of 100 with a letter grade (A+ to F)
- ✅ **Top 10 competitor analysis** (auto-discovered, or you can name them)
- ✅ **Prioritised recommendations** (🔴 High / 🟡 Medium / 🟢 Low)
- ✅ **Local SEO** support — just tell Claude your city
- ✅ **AEO** — optimised for Google AI Overviews, Perplexity, voice search
- ✅ **GEO** — optimised for ChatGPT, Gemini, and generative AI search
- ✅ **E-E-A-T** content quality analysis (Experience, Expertise, Authoritativeness, Trust)
- ✅ **30/60/90-day action roadmap**
- ✅ Delivered as a **beautifully designed PDF report**

---

## 📋 Audit Sections

| # | Section | What It Checks |
|---|---------|----------------|
| 1 | 🔧 Technical SEO | HTTPS, sitemap, robots.txt, crawl errors, schema |
| 2 | 📄 On-Page SEO | Title tags, meta, H1, headers, alt text, internal links |
| 3 | ⚡ Website Speed | Core Web Vitals (LCP, INP, CLS), CDN, image formats |
| 4 | ✍️ Content & E-E-A-T | Experience, expertise, authority, trust signals |
| 5 | 🔗 Backlink Profile | Domain authority, referring domains, link quality |
| 6 | 🏆 Competitor Analysis | Top 10 competitors with traffic tier and strengths |
| 7 | 📍 Local SEO | Google Business Profile, NAP consistency, citations |
| 8 | 🤖 AEO | FAQ schema, featured snippets, voice search readiness |
| 9 | 🧠 GEO | AI citation readiness, brand entity, topical authority |
| 10 | 📱 Mobile & UX | Responsive design, tap targets, mobile speed |

---

## 🚀 Installation

### One-Command Install (Mac / Linux)

```bash
curl -fsSL https://raw.githubusercontent.com/deepaksamele/deepak-seo-audit/main/install.sh | bash
```

### Windows

```powershell
irm https://raw.githubusercontent.com/deepaksamele/deepak-seo-audit/main/install.ps1 | iex
```

### Manual Install

```bash
git clone https://github.com/deepaksamele/deepak-seo-audit.git
cd deepak-seo-audit
./install.sh
```

> ⚠️ Replace `deepaksamele` with your actual GitHub deepaksamele after you create the repo.

---

## 🧑‍💻 How to Use

Once installed, open Claude Code and simply say:

```
Audit my website: https://yourwebsite.com
```

Or for a local business:

```
Do a full SEO audit for https://myrestaurant.com — I'm based in Mumbai
```

Claude will ask you a few quick questions (business type, competitors if known), then run the full audit and deliver a PDF report.

---

## 📦 Requirements

- Python 3.8+
- Claude Code CLI
- `reportlab` Python library (auto-installed)

---

## 🗂️ Repo Structure

```
deepak-seo-audit/
├── seo/
│   └── SKILL.md              # Main skill instructions for Claude
├── references/
│   ├── scoring-rubric.md     # Scoring criteria for all 10 sections
│   └── pdf-style-guide.md    # PDF design specs (colours, fonts, layout)
├── docs/
│   └── INSTALLATION.md       # Detailed install guide
├── install.sh                # One-command installer (Mac/Linux)
├── install.ps1               # One-command installer (Windows)
├── uninstall.sh              # Uninstaller
├── requirements.txt          # Python dependencies
├── README.md                 # This file
└── LICENSE                   # MIT License
```

---

## 🔧 Uninstall

```bash
curl -fsSL https://raw.githubusercontent.com/deepaksamele/deepak-seo-audit/main/uninstall.sh | bash
```

---

## 📄 License

MIT License — free to use, modify, and share. See [LICENSE](LICENSE) for details.

---

## 👤 Author

Built by **Deepak** — SEO audit skill for Claude Code.

If this helped you, give it a ⭐ star on GitHub!

---

## 🤝 Contributing

Found a bug or want to add a new audit section? Pull requests are welcome!
Please open an issue first to discuss what you'd like to change.
