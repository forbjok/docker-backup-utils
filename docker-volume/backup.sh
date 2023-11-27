#!/bin/bash
tar -acpf /mnt/backup/$BACKUP_FILENAME -C /mnt/data $@
