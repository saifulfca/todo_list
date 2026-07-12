@echo off
title TaskNest
cd /d "%~dp0"
powershell -NoProfile -ExecutionPolicy Bypass -File "%~dp0server.ps1"
echo.
echo TaskNest stopped. You can close this window.
pause >nul
