#!/bin/bash

# Config
SRC="/" #dont forget trailing slash!
BACKUP_DIR="/media/storage/backup"

date=`date "+%Y-%b-%d-%T"`
DST="${BACKUP_DIR}/$date"

LAST="${BACKUP_DIR}/last"
LINK="--link-dest=${LAST}" 

OPT="-ax --delete --info=progress2"
EXCLUDE="--exclude={'/dev/*','/proc/*','/sys/*','/tmp/*','/run/*','/mnt/*','/media/*','/lost+found'}"

# Run rsync to create snapshot
rsync $OPT $EXCLUDE $LINK $SRC $DST

# Remove symlink to previous snapshot
rm -f $LAST

# Create new symlink to latest snapshot for the next backup to hardlink
ln -s ${DST} $LAST
