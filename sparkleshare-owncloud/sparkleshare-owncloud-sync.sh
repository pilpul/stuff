#!/bin/sh
cd /$PATHTOOWNCLOUDDATA/$USER/files/$PROJECT
git add *
git commit -a -m 'commit from owncloud'
git pull
git push
git fetch origin
git reset origin/master
git clean -f
chown -R www-data:www-data /$PATHTOOWNCLOUDDATA/$USER/files/$PROJECT/
