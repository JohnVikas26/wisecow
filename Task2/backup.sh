#!/bin/bash

# Configuration
SOURCE_DIR="/home/ubuntu/wisecow"   # Directory to back up (local path)
DEST_DIR="ubuntu@54.209.126.230:/home/ubuntu/wisecow"  # EC2 instance destination
LOG_FILE="/home/ubuntu/wisecow/logs/backup_logfile.log"  # Local log file inside the repo

# Timestamp for backup and logging
TIMESTAMP=$(date "+%Y-%m-%d_%H-%M-%S")

# Perform backup using rsync
echo "Starting backup: $TIMESTAMP" >> $LOG_FILE
rsync -av --delete $SOURCE_DIR $DEST_DIR >> $LOG_FILE 2>&1

# Check if rsync was successful
if [ $? -eq 0 ]; then
    echo "Backup completed successfully: $TIMESTAMP" >> $LOG_FILE
else
    echo "Backup failed: $TIMESTAMP" >> $LOG_FILE
fi


