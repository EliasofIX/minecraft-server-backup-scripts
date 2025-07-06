#!/usr/bin/env bash
#
# Hourly backups, kept for 24 hours

WORLD_DIR="$HOME/minecraft/world"
BACKUP_DIR="$HOME/minecraft/backups/hourly"
RETENTION_HOURS=24

mkdir -p "$BACKUP_DIR"

TS=$(date +'%Y-%m-%d_%H-%M-%S')
tar -czf "$BACKUP_DIR/mc-hourly-$TS.tar.gz" -C "$WORLD_DIR" .

# delete any file older than $RETENTION_HOURS
find "$BACKUP_DIR" -maxdepth 1 -type f -name 'mc-hourly-*.tar.gz' \
     -mmin +$((RETENTION_HOURS * 60)) -delete

