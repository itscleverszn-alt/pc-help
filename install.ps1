# PC Help installer: downloads this repo to Documents\PC-Help and installs Claude Code if missing.
# Run: irm https://raw.githubusercontent.com/itscleverszn-alt/pc-help/main/install.ps1 | iex
$ErrorActionPreference = 'Stop'
$dest = Join-Path ([Environment]::GetFolderPath('MyDocuments')) 'PC-Help'
$zip = Join-Path $env:TEMP 'pc-help.zip'
$tmp = Join-Path $env:TEMP 'pc-help-extract'

Invoke-WebRequest 'https://github.com/itscleverszn-alt/pc-help/archive/refs/heads/main.zip' -OutFile $zip -UseBasicParsing
if (Test-Path $tmp) { Remove-Item $tmp -Recurse -Force }
Expand-Archive $zip $tmp
$src = Join-Path $tmp 'pc-help-main'
New-Item -ItemType Directory -Force $dest | Out-Null

# Rules always update; his SYSTEM.md / FIX-LOG.md are never overwritten once they exist.
Copy-Item (Join-Path $src 'CLAUDE.md') $dest -Force
foreach ($f in 'SYSTEM.md', 'FIX-LOG.md') {
    if (-not (Test-Path (Join-Path $dest $f))) { Copy-Item (Join-Path $src $f) $dest }
}
Remove-Item $zip, $tmp -Recurse -Force

if (-not (Get-Command claude -ErrorAction SilentlyContinue)) {
    Write-Host 'Installing Claude Code...'
    Invoke-RestMethod https://claude.ai/install.ps1 | Invoke-Expression
}

Write-Host "`nDone. Files are in $dest"
Write-Host "Next: close this window, open a NEW PowerShell, then run:"
Write-Host "  cd `"$dest`"; claude"
