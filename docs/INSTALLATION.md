# 📦 Installation Guide — Deepak's SEO Audit Skill

This guide walks you through installing the skill **step by step**, even if you have never used GitHub or the terminal before.

---

## Before You Start — What You Need

You need two free tools installed on your computer:

1. **Python** — the programming language the skill uses
   - Download from: https://www.python.org/downloads/
   - During install on Windows, tick ✅ "Add Python to PATH"

2. **Git** — the tool that downloads files from GitHub
   - Download from: https://git-scm.com/downloads
   - Just click Next through the installer, defaults are fine

3. **Claude Code** — Anthropic's Claude coding tool (the app this skill runs inside)
   - Install guide: https://docs.anthropic.com/claude-code

---

## Installation — Mac or Linux

### Step 1: Open your Terminal
- **Mac**: Press `Cmd + Space`, type "Terminal", press Enter
- **Linux**: Press `Ctrl + Alt + T`

### Step 2: Paste this command and press Enter

```bash
curl -fsSL https://raw.githubusercontent.com/YOUR_USERNAME/deepak-seo-audit/main/install.sh | bash
```

That's it! The script will download and install everything automatically.

---

## Installation — Windows

### Step 1: Open PowerShell
- Press the Windows key, type "PowerShell", right-click it, and select **"Run as Administrator"**

### Step 2: Paste this command and press Enter

```powershell
irm https://raw.githubusercontent.com/YOUR_USERNAME/deepak-seo-audit/main/install.ps1 | iex
```

---

## Manual Installation (any system)

If the one-command install doesn't work, do it manually:

```bash
# Step 1: Download the skill
git clone https://github.com/YOUR_USERNAME/deepak-seo-audit.git

# Step 2: Go into the folder
cd deepak-seo-audit

# Step 3: Run the installer
./install.sh
```

On Windows, in PowerShell:
```powershell
git clone https://github.com/YOUR_USERNAME/deepak-seo-audit.git
cd deepak-seo-audit
.\install.ps1
```

---

## After Installation — How to Use

1. Open your terminal and type `claude` to start Claude Code
2. Say: **"Audit my website: https://yourwebsite.com"**
3. If you're a local business, say: **"Audit https://myshop.com — I'm based in Delhi"**
4. Claude will ask a couple of quick questions, then run the full audit
5. You'll receive a professional **PDF report** you can download!

---

## Troubleshooting

**"command not found: git"**
→ Git is not installed. Download from https://git-scm.com

**"command not found: python3"**
→ Python is not installed. Download from https://python.org

**"Permission denied"**
→ On Mac/Linux, run: `chmod +x install.sh` then `./install.sh`

**pip install failed**
→ Run manually: `pip install reportlab`

---

## Uninstall

```bash
curl -fsSL https://raw.githubusercontent.com/YOUR_USERNAME/deepak-seo-audit/main/uninstall.sh | bash
```

---

*Replace `YOUR_USERNAME` with your actual GitHub username throughout this guide.*
