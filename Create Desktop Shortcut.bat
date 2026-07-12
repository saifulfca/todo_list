@echo off
title Create TaskNest Shortcut
cd /d "%~dp0"
powershell -NoProfile -ExecutionPolicy Bypass -File "%~dp0create-shortcut.ps1"
pause
