## Minecraft Server Backup Scripts

This is probably the most simple solution one can have for automatically backing up your Minecraft server if you run yours locally on a Linux machine in the most barebones way (literally just executing the JAR file). 

### The Repo privdes two shell scripts:
- mc-backup-hourly.sh this takes a snapshot every hour and keeps backups for 24hs (times are adjustable) and automatically deletes them after the set time.
- mc-backup-weekly.sh this takes a snapshot every Sunday at 4AM (also adjustable) and keeps them indefinitely (unless you change that).

### Features:
- it uses no dependencies other than the GNU coreutils and tar.
- it's a super lightweight Bash script
- most likely the most suckless and most lightweight solution for automatic backups possible.
- flexible scheduling via cron or systemd timers.
- automatically deletes the hourly backups after a set time to save disk space.
- clear directory structure (backups/hourly | backups/weekly).

### Prerequisites
- Bash
- tar

### Installation
- git clone https://github.com/EliasofIX/minecraft-server-backup-scripts
- make scripts executable chmod +x ~/minecraft-backup/mc-backup-hourly.sh \
                                    ~/minecraft-backup/mc-backup-weekly.sh
- edit the scripts to adjust paths WORLD_DIR (your actual world directory) and BACKUP_DIR (your actual backup directory)

### Usage:
- open crontab: crontab -e
- add the following lines: 
# Hourly backup every hour on the hour, keep 24h
0 * * * * /home/youruser/minecraft-backup/mc-backup-hourly.sh >/dev/null 2>&1

# Weekly backup every Sunday at 4 AM, keep forever
0 4 * * 0 /home/youruser/minecraft-backup/mc-backup-weekly.sh >/dev/null 2>&1
- alternatively you could use systemd timers but those were too tedious for me so IDK how that works sorry

### Directories:
minecraft-backup/
├── mc-backup-hourly.sh     # Hourly script
├── mc-backup-weekly.sh     # Weekly script
└── backups/
    ├── hourly/             # 24-hour retention snapshots
    └── weekly/             # Weekly snapshots (forever)

### *Yeah that's it, super easy.*

MIT © EliasofIX 2025

#### Created with ❤️ for hassle-free Minecraft backups.
