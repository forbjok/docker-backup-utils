#!/bin/bash
sudo docker build ./docker-volume --tag dbu-volume
sudo docker build ./docker-postgres --tag dbu-postgres
