# Creates a "TaskNest" shortcut on your Desktop that launches the app.
$ErrorActionPreference = 'Stop'
$root = Split-Path -Parent $MyInvocation.MyCommand.Path
$target = Join-Path $root 'Start TaskNest.bat'
if (-not (Test-Path $target)) {
  Write-Host "Could not find 'Start TaskNest.bat' next to this script." -ForegroundColor Red
  Read-Host "Press Enter to exit"; exit 1
}
$desktop = [Environment]::GetFolderPath('Desktop')
$lnkPath = Join-Path $desktop 'TaskNest.lnk'

$ws = New-Object -ComObject WScript.Shell
$lnk = $ws.CreateShortcut($lnkPath)
$lnk.TargetPath = $target
$lnk.WorkingDirectory = $root
$lnk.WindowStyle = 1
$lnk.Description = 'Launch TaskNest'
$ico = Join-Path $root 'tasknest.ico'
if (Test-Path $ico) { $lnk.IconLocation = "$ico,0" }
$lnk.Save()

Write-Host ""
Write-Host "  Done! A 'TaskNest' icon is now on your Desktop." -ForegroundColor Green
Write-Host "  Double-click it any time to start TaskNest."
Write-Host ""
