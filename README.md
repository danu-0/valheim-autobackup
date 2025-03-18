# Valheim Auto Backup & Restore Script

This script automates **Valheim world backups** using GitHub and restores the latest world save before launching the game.

## 📌 Features
- **No need to host your world manually** – just run the script and play!
- **Automatically pulls the latest world save** from GitHub before launching Valheim.
- **Restores world files** from backup to ensure the latest progress is loaded.
- **Automatically starts Valheim**.
- **Waits for Valheim to close**, then backs up the world save.
- **Pushes the latest world save** to GitHub after closing the game.
- **Sync progress with friends** by using a shared GitHub repository.

---

## 🏔️ "An adventure is only as great as the stories you bring back." 🌍🔥

## 🚀 How to Use

### 1️⃣ **Move Your World Save to Local Storage**
Before using the script, make sure your world is stored **locally, not in the cloud**:

1. Open **Valheim**.
2. When select your world from **The List**.
3. Click on **Manage Saves**.
4. Select your world and **click "Move to local"**.
5. Make sure your world is now stored in:
   ```
   C:\Users\Username\AppData\LocalLow\IronGate\Valheim\worlds_local
   ```

---

### 2️⃣ **Fork & Clone This Repository**
If you want to store your backups in **your own GitHub repository**, follow these steps:

1. **Fork this repository** to your GitHub account.
2. **Clone your forked repository** to your local machine:
   ```sh
   git clone https://github.com/yourusername/valheim-autobackup.git
   ```
3. Open `start-valheim.bat` in a text editor and **change these variables**:
   ```batch
   set WORLD_NAME=YourWorldName
   set SAVE_PATH=C:\Users\YourUsername\AppData\LocalLow\IronGate\Valheim\worlds_local
   set BACKUP_PATH=D:\Valheim\backups
   ```
   - Replace `YourWorldName` with your world name.
   - Replace `YourUsername` with your Windows username.
   - Set `BACKUP_PATH` to where you want to store backups.

4. **Ensure Git is set up**, and link it to your forked repository:
   ```sh
   git init
   git remote add origin https://github.com/yourusername/valheim-autobackup.git
   ```

---

### 3️⃣ **Sync Progress with Friends**
If you want to **play with friends and share progress**, follow these steps:

1. **Choose one shared GitHub repository** for backups.
2. **Each player must clone the same repository**:
   ```sh
   git clone https://github.com/shared-repo/valheim-autobackup.git
   ```
3. **Before playing**, each player should **run the script to automatically pull the latest save**.
4. **After playing**, exit Valheim, and the script will automatically backup and push the latest progress to GitHub.
5. The next time your friends play, they just need to **run the script to pull the latest world save** before launching Valheim!

> ✅ **No need to manually pull, commit, or push!** The script handles everything automatically.
> ✅ **No need to host your world manually** – every player gets the latest save instantly!

---

### 4️⃣ **Run the Script**

1. **Always start Valheim using the script!**
   - Double-click `start-valheim.bat`.
   - It will **pull the latest backup**, **restore your world**, and **start Valheim**.

2. **After playing, simply exit Valheim**.
   - The script will **automatically back up your world** and push it to GitHub.

---

## 📂 Backup Folder Structure
Your backup folder will contain:
```
.git
backups/
│-- world_name.db
│-- world_name.fwl
│-- world_name.db.old
│-- world_name.fwl.old
│-- (Git version control)
README.md
start-valheim.bat
```

These files ensure your world is **always backed up safely**.

---

## 🔥 Enjoy Your Valheim Adventure!
This script ensures your world progress is always **safe and easily restorable**. 🚀⚔️

If you have any issues, feel free to open an issue in the repository! 😊

