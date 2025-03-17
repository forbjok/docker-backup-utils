#!/bin/bash

SUBDIR=$1
PREFIX=$2
VOLUME_NAME=$3
BACKUP_ROOT=${DBU_BACKUP_ROOT:-"$HOME/backup"}

# Generate timestamp
printf -v timestamp '%(%Y-%m-%d_%H-%M-%S)T' -1

BACKUP_PATH=$BACKUP_ROOT/$SUBDIR
BACKUP_FILENAME=$PREFIX$timestamp.tar.zst

sudo docker run \
	-it \
	--rm \
	-v "$VOLUME_NAME:/mnt/data:rw" \
	-v "$BACKUP_PATH:/mnt/backup:ro" \
	-e "BACKUP_FILENAME=$BACKUP_FILENAME" \
	dbu-volume \
	${@:4}
