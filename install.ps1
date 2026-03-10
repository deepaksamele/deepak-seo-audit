# Deepak's SEO / AEO / GEO Audit Skill - Windows Installer
# Run with: irm https://raw.githubusercontent.com/YOUR_USERNAME/deepak-seo-audit/main/install.ps1 | iex

$RepoUrl = "https://github.com/YOUR_USERNAME/deepak-seo-audit"
$SkillDir = "$env:USERPROFILE\.claude\skills\seo-audit"

Write-Host "================================================" -ForegroundColor Cyan
Write-Host "   Deepak's SEO / AEO / GEO Audit Skill" -ForegroundColor Cyan
Write-Host "   Claude Code Installer (Windows)" -ForegroundColor Cyan
Write-Host "================================================" -ForegroundColor Cyan
Write-Host ""

# Check Python
try {
    $pythonVersion = python --version 2>&1
    Write-Host "✓ $pythonVersion detected" -ForegroundColor Green
} catch {
    Write-Host "✗ Python is required. Download from https://python.org" -ForegroundColor Red
    exit 1
}

# Check Git
try {
    git --version | Out-Null
    Write-Host "✓ Git detected" -ForegroundColor Green
} catch {
    Write-Host "✗ Git is required. Download from https://git-scm.com" -ForegroundColor Red
    exit 1
}

# Create directories
New-Item -ItemType Directory -Force -Path $SkillDir | Out-Null
New-Item -ItemType Directory -Force -Path "$SkillDir\references" | Out-Null
Write-Host "✓ Created skill directory" -ForegroundColor Green

# Clone repo
$TempDir = [System.IO.Path]::GetTempPath() + [System.Guid]::NewGuid().ToString()
Write-Host "↓ Downloading Deepak's SEO Audit Skill..." -ForegroundColor Yellow
git clone --depth 1 $RepoUrl $TempDir 2>&1 | Out-Null
Write-Host "✓ Downloaded successfully" -ForegroundColor Green

# Copy files
Write-Host "→ Installing skill files..." -ForegroundColor Yellow
Copy-Item -Path "$TempDir\seo\*" -Destination $SkillDir -Recurse -Force
Copy-Item -Path "$TempDir\references\*" -Destination "$SkillDir\references" -Recurse -Force
Write-Host "✓ Skill files installed" -ForegroundColor Green

# Install Python packages
Write-Host "→ Installing Python dependencies..." -ForegroundColor Yellow
pip install --quiet reportlab 2>&1 | Out-Null
Write-Host "✓ Python packages installed" -ForegroundColor Green

# Cleanup
Remove-Item -Recurse -Force $TempDir

Write-Host ""
Write-Host "================================================" -ForegroundColor Cyan
Write-Host "✓ Installation complete!" -ForegroundColor Green
Write-Host ""
Write-Host "How to use:"
Write-Host "  1. Open Claude Code: claude"
Write-Host "  2. Say: 'Audit my website: https://yoursite.com'"
Write-Host "  3. Get a full PDF SEO audit report!"
Write-Host "================================================" -ForegroundColor Cyan
