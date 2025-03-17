#!/bin/bash

SUBDIR=$1
NETWORK_NAME=$2
PGHOST=$3
PGDB=$4
PGUSER=$5
PGPASSWORD=$6

BACKUP_ROOT=${DBU_BACKUP_ROOT:-"$HOME/backup"}

# Generate timestamp
printf -v timestamp '%(%Y-%m-%d_%H-%M-%S)T' -1

BACKUP_PATH=$BACKUP_ROOT/$SUBDIR
BACKUP_FILENAME=db_$timestamp.dump

sudo docker run \
	-it \
	--rm \
	--network=$NETWORK_NAME \
	-v "$BACKUP_PATH:/mnt/backup:rw" \
	-e "BACKUP_FILENAME=$BACKUP_FILENAME" \
	-e "PGHOST=$PGHOST" \
	-e "PGDB=$PGDB" \
	-e "PGUSER=$PGUSER" \
	-e "PGPASSWORD=$PGPASSWORD" \
	dbu-postgres \
	/backup.sh
