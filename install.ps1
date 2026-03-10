# Deepak's SEO / AEO / GEO Audit Skill - Windows Installer
# Run: irm https://raw.githubusercontent.com/deepaksamele/deepak-seo-audit/main/install.ps1 | iex

$RepoUrl = "https://github.com/deepaksamele/deepak-seo-audit"
$SkillDir = "$env:USERPROFILE\.claude\skills\seo-audit"

Write-Host ""
Write-Host "================================================" -ForegroundColor Cyan
Write-Host "   Deepak's SEO / AEO / GEO Audit Skill" -ForegroundColor Cyan
Write-Host "   Claude Code Installer (Windows)" -ForegroundColor Cyan
Write-Host "================================================" -ForegroundColor Cyan
Write-Host ""

# Step 1: Check Git
Write-Host "Checking requirements..." -ForegroundColor Yellow
$gitOk = $false
try { git --version | Out-Null; $gitOk = $true } catch {}
if (-not $gitOk) {
    Write-Host "  X  Git is not installed." -ForegroundColor Red
    Write-Host "     Download from: https://git-scm.com/download/win" -ForegroundColor White
    Write-Host "     Then re-run this installer." -ForegroundColor White
    Read-Host "Press Enter to exit"; exit 1
}
Write-Host "  OK  Git detected" -ForegroundColor Green

# Step 2: Find Python (checks PATH and common install locations)
$pythonCmd = $null
foreach ($cmd in @("python", "python3", "py")) {
    try {
        $ver = & $cmd --version 2>&1
        if ($ver -match "Python 3") { $pythonCmd = $cmd; Write-Host "  OK  $ver detected" -ForegroundColor Green; break }
    } catch {}
}
if (-not $pythonCmd) {
    $patterns = @("$env:LOCALAPPDATA\Programs\Python\Python3*\python.exe","$env:LOCALAPPDATA\Python\pythoncore-*\python.exe","C:\Python3*\python.exe")
    foreach ($p in $patterns) {
        $found = Get-Item $p -ErrorAction SilentlyContinue | Select-Object -First 1
        if ($found) { $pythonCmd = $found.FullName; Write-Host "  OK  Python found at $pythonCmd" -ForegroundColor Green; break }
    }
}
if (-not $pythonCmd) {
    Write-Host "  X  Python 3 is not installed." -ForegroundColor Red
    Write-Host "     Download from: https://www.python.org/downloads/" -ForegroundColor White
    Write-Host "     IMPORTANT: Tick 'Add Python to PATH' during install!" -ForegroundColor Yellow
    Read-Host "Press Enter to exit"; exit 1
}

# Step 3: Download repo
Write-Host ""
Write-Host "Downloading skill from GitHub..." -ForegroundColor Yellow
$TempDir = "$env:TEMP\deepak-seo-$(Get-Random)"
try {
    git clone --depth 1 $RepoUrl $TempDir 2>&1 | Out-Null
    Write-Host "  OK  Downloaded successfully" -ForegroundColor Green
} catch {
    Write-Host "  X  Download failed. Check your internet and try again." -ForegroundColor Red
    Read-Host "Press Enter to exit"; exit 1
}

# Step 4: Copy skill files
Write-Host ""
Write-Host "Installing skill files..." -ForegroundColor Yellow
try {
    New-Item -ItemType Directory -Force -Path "$SkillDir\references" | Out-Null
    Copy-Item -Path "$TempDir\seo\*"        -Destination "$SkillDir\"            -Recurse -Force
    Copy-Item -Path "$TempDir\references\*" -Destination "$SkillDir\references\" -Recurse -Force
    Write-Host "  OK  Files installed to: $SkillDir" -ForegroundColor Green
} catch {
    Write-Host "  X  Failed to copy files: $_" -ForegroundColor Red
    Read-Host "Press Enter to exit"; exit 1
}

# Step 5: Install reportlab (tries multiple methods)
Write-Host ""
Write-Host "Installing Python dependencies..." -ForegroundColor Yellow
$installed = $false
foreach ($cmd in @("& `"$pythonCmd`" -m pip install reportlab", "py -m pip install reportlab", "pip install reportlab")) {
    try {
        $out = Invoke-Expression $cmd 2>&1
        if ($out -match "Successfully installed|already satisfied") { $installed = $true; break }
    } catch {}
}
if ($installed) { Write-Host "  OK  reportlab installed" -ForegroundColor Green }
else { Write-Host "  !  Run manually: py -m pip install reportlab" -ForegroundColor Yellow }

# Cleanup
Remove-Item -Recurse -Force $TempDir -ErrorAction SilentlyContinue

# Done
Write-Host ""
Write-Host "================================================" -ForegroundColor Cyan
Write-Host "  Installation complete!" -ForegroundColor Green
Write-Host ""
Write-Host "  How to use:" -ForegroundColor White
Write-Host "  1. Open Claude Code: claude" -ForegroundColor White
Write-Host "  2. Say: Audit my website: https://yoursite.com" -ForegroundColor White
Write-Host "  3. Get a full PDF SEO audit report!" -ForegroundColor White
Write-Host "================================================" -ForegroundColor Cyan
Write-Host ""
Read-Host "Press Enter to close"
