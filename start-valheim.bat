@echo off
chcp 65001 >nul  :: Enable UTF-8 encoding for emojis
setlocal enabledelayedexpansion

:: Set world name (CHANGE THIS)
set WORLD_NAME=YourWorldName

:: Set paths (CHANGE Username in SAVE_PATH and set BACKUP_PATH)
set SAVE_PATH=C:\Users\Username\AppData\LocalLow\IronGate\Valheim\worlds_local
set BACKUP_PATH=D:\Valheim\backups

:: Step 1️⃣: Pull the latest backup from GitHub
echo 🔄 Pulling latest backup from GitHub...
cd /d "%BACKUP_PATH%"
git pull origin main

:: Step 2️⃣: Restore the world files to Valheim save folder
echo 🔄 Restoring world files...
xcopy "%BACKUP_PATH%\%WORLD_NAME%.*" "%SAVE_PATH%" /Y

:: Step 3️⃣: Start Valheim
echo 🚀 Launching Valheim...
:: Set paths to valheim.exe in your Steam folder
start "" /d "C:\Program Files (x86)\Steam\steamapps\common\Valheim" valheim.exe

:: Step 4️⃣: Wait for Valheim to close
:WAIT
tasklist | find /i "valheim.exe" >nul
if %errorlevel% == 0 (
    timeout /t 10 >nul
    goto WAIT
)

:: Step 5️⃣: Backup the latest world after exiting Valheim
echo 🔄 Backing up world files...
xcopy "%SAVE_PATH%\%WORLD_NAME%.*" "%BACKUP_PATH%" /Y

:: Push changes to GitHub
cd /d "%BACKUP_PATH%"
git add .
git commit -m "Auto backup %WORLD_NAME% - %date% %time%"
git push origin main

echo ✅ Backup completed for world: %WORLD_NAME% 🔥 
pause
exit
