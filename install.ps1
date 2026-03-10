# Deepak's SEO / AEO / GEO Audit Skill - Windows Installer
# Run: irm https://raw.githubusercontent.com/deepaksamele/deepak-seo-audit/main/install.ps1 | iex

$RepoUrl = "https://github.com/deepaksamele/deepak-seo-audit"
$SkillDir = "$env:USERPROFILE\.claude\skills\seo-audit"

Write-Host "================================================" -ForegroundColor Cyan
Write-Host "   Deepak's SEO / AEO / GEO Audit Skill" -ForegroundColor Cyan
Write-Host "   Claude Code Installer (Windows)" -ForegroundColor Cyan
Write-Host "================================================" -ForegroundColor Cyan
Write-Host ""

try { python --version | Out-Null; Write-Host "✓ Python detected" -ForegroundColor Green }
catch { Write-Host "✗ Python required. https://python.org" -ForegroundColor Red; exit 1 }

try { git --version | Out-Null; Write-Host "✓ Git detected" -ForegroundColor Green }
catch { Write-Host "✗ Git required. https://git-scm.com" -ForegroundColor Red; exit 1 }

New-Item -ItemType Directory -Force -Path $SkillDir | Out-Null
New-Item -ItemType Directory -Force -Path "$SkillDir\references" | Out-Null
Write-Host "✓ Created skill directory" -ForegroundColor Green

$TempDir = [System.IO.Path]::GetTempPath() + [System.Guid]::NewGuid().ToString()
Write-Host "↓ Downloading..." -ForegroundColor Yellow
git clone --depth 1 $RepoUrl $TempDir 2>&1 | Out-Null
Write-Host "✓ Downloaded" -ForegroundColor Green

Copy-Item -Path "$TempDir\seo\*" -Destination $SkillDir -Recurse -Force
Copy-Item -Path "$TempDir\references\*" -Destination "$SkillDir\references" -Recurse -Force
Write-Host "✓ Skill files installed" -ForegroundColor Green

pip install --quiet reportlab 2>&1 | Out-Null
Write-Host "✓ Python packages installed" -ForegroundColor Green

Remove-Item -Recurse -Force $TempDir

Write-Host ""
Write-Host "✓ Done! Open Claude Code and say: 'Audit my website: https://yoursite.com'" -ForegroundColor Green
