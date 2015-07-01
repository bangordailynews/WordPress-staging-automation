#!/bin/bash
gunzip -f ~/db-latest.sql.gz
mysql -uroot [database] < ~/db-latest.sql
mysql -uroot -e "use [database]; DELETE FROM wp_postmeta WHERE post_id IN( SELECT ID FROM wp_posts WHERE post_date < '2015-02-01' AND post_type != 'page' );  DELETE FROM wp_term_relationships WHERE object_id IN( SELECT ID FROM wp_posts WHERE post_date < '2015-02-01' AND post_type != 'page' ); DELETE FROM wp_posts WHERE post_date < '2015-02-01' AND post_type != 'page'; TRUNCATE TABLE wp_similar_posts; TRUNCATE TABLE wp_email;TRUNCATE TABLE wp_comments;TRUNCATE TABLE wp_commentmeta;TRUNCATE TABLE wp_131_posts;TRUNCATE TABLE wp_131_postmeta; TRUNCATE TABLE wp_131_term_relationships; TRUNCATE TABLE wp_51_similar_posts; DELETE FROM wp_51_posts WHERE post_date < '2015-02-01' AND post_type != 'page'; DELETE FROM wp_104_posts WHERE post_date < '2015-02-01' AND post_date != 'page'; DELETE FROM wp_93_posts WHERE post_date < '2015-02-01' AND post_date != 'page';"
mysqldump -uroot [database] | gzip > /home/ubuntu/db-latest-sveldt.sql.gz
wp plugin activate git-switch.php --network
