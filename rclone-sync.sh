#!/bin/bash
echo "$0 ver 1.1  written by Claude Pageau"

# Customize rclone sync variables Below
# ---------------------------------------
rcloneName="gdmedia"
syncRoot="/home/pi"
localSyncDir="rpi-sync"
remoteSyncDir="syncdemo"
# ---------------------------------------

# Display Users Settings
echo "
---------- SETTINGS -------------
rcloneName   : $rcloneName
syncRoot     : $syncRoot
localSyncDir : $localSyncDir
remoteSyncDir: $remoteSyncDir
---------------------------------"
if pidof -o %PPID -x "$0"; then
    echo "WARN  - $0 Already Running. Only One Allowed."
    exit 1
else
    echo "cd $syncRoot"
    cd "$syncRoot"
    echo "/usr/bin/rclone sync -v $localSyncDir $rcloneName:$remoteSyncDir"
    echo "One Moment Please ..."
    /usr/bin/rclone sync -v $localSyncDir $rcloneName:$remoteSyncDir
fi
echo "$0 Bye ..."