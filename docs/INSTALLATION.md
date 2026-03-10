# 📦 Installation Guide — Deepak's SEO Audit Skill

## Before You Start — What You Need

1. **Python** → https://www.python.org/downloads/ (tick "Add Python to PATH" on Windows)
2. **Git** → https://git-scm.com/downloads (click Next through installer)
3. **Claude Code** → https://docs.anthropic.com/claude-code

---

## Mac / Linux — One Command

Open Terminal and paste:

```bash
curl -fsSL https://raw.githubusercontent.com/deepaksamele/deepak-seo-audit/main/install.sh | bash
```

---

## Windows — One Command

Open PowerShell as Administrator and paste:

```powershell
irm https://raw.githubusercontent.com/deepaksamele/deepak-seo-audit/main/install.ps1 | iex
```

---

## Manual Install (any system)

```bash
git clone https://github.com/deepaksamele/deepak-seo-audit.git
cd deepak-seo-audit
./install.sh
```

---

## How to Use After Installing

1. Open terminal, type `claude` to start Claude Code
2. Say: **"Audit my website: https://yourwebsite.com"**
3. For local business: **"Audit https://myshop.com — I'm based in Delhi"**
4. Claude runs the full audit and delivers a **PDF report**!

---

## Troubleshooting

| Error | Fix |
|-------|-----|
| `command not found: git` | Install Git from https://git-scm.com |
| `command not found: python3` | Install Python from https://python.org |
| `Permission denied` | Run: `chmod +x install.sh` then `./install.sh` |
| pip failed | Run: `pip install reportlab` |

---

## Uninstall

```bash
curl -fsSL https://raw.githubusercontent.com/deepaksamele/deepak-seo-audit/main/uninstall.sh | bash
```
