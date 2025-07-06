#!/usr/bin/env bash
#
# Weekly backups, kept indefinitely

WORLD_DIR="$HOME/minecraft/world"
BACKUP_DIR="$HOME/minecraft/backups/weekly"

mkdir -p "$BACKUP_DIR"

TS=$(date +'%Y-%m-%d')
tar -czf "$BACKUP_DIR/mc-weekly-$TS.tar.gz" -C "$WORLD_DIR" .

