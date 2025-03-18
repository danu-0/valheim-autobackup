@echo off
setlocal enabledelayedexpansion

:: Set your world name here (change "YourWorldName" to match your world)
set WORLD_NAME=testingworld

:: Set paths
set SAVE_PATH=C:\Users\Veloxium\AppData\LocalLow\IronGate\Valheim\worlds_local
set BACKUP_PATH=D:\Valheim

:: Wait for Valheim to close
:WAIT
tasklist | find /i "valheim.exe" >nul
if %errorlevel% == 0 (
    timeout /t 10 >nul
    goto WAIT
)

:: Valheim is closed, now backup only the selected world
xcopy "%SAVE_PATH%\%WORLD_NAME%.*" "%BACKUP_PATH%" /Y

:: Push changes to GitHub
cd /d "%BACKUP_PATH%"
git add .
git commit -m "Auto backup %WORLD_NAME% after Valheim closed - %date% %time%"
git push origin main

echo Backup completed for world: %WORLD_NAME%
pause
