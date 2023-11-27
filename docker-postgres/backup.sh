#!/bin/bash
pg_dump \
	-Fc \
	--no-owner \
	--large-objects \
	-h $PGHOST \
	-d $PGDB \
	-U $PGUSER \
	-f "/mnt/backup/$BACKUP_FILENAME"
