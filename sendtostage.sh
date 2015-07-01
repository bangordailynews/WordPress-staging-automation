#!/bin/bash
scp -i [path-to-key] [path-to-files]/db_`date '+%Y-%m-%d_%H'`.sql.gz [user]@[server]:~/db-latest.sql.gz
