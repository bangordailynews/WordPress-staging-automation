#!/bin/bash
mysqldump -u [user] -p[password] [database] | gzip > [path-to-save]/db_`date '+%Y-%m-%d_%H'`.sql.gz
