I use this configuration to make my sparkleshare project accessible via owncloud. The Sparkleshare repository and owncloud are on the same machine.

1. Clone the sparkelshare repository (Attention: From that moment on you'll have all files doubled on the filesystem; in the sparkleshare main repository and as a copy in owncloud)
 ```
 cd /$PATHTOOWNCLOUDDATA/$USER/files
 git clone /home/storage/$PROJECT
 cd $PROJECT
 ```

2. To have not 'root' as user logged for all actions you may set it as well
```
git config user.name "owncloud"
git config user.email "owncloud@$HOST"
```

3. set up [sync script](https://github.com/pilpul/stuff/blob/master/sparkleshare-owncloud/sparkleshare-owncloud-sync.sh)
```
nano /home/storage/sparkeshare-owncloud-sync-$USER.sh
```
 
4. set up cron to auto sync each minute
```
sudo nano /etc/crontab
```

add this lines to the end
```
#update owncloud from sparkleshare-git-repository
 * *    * * *   root   /home/storage/sparkleshare-owncloud-sync-$USER.sh >/dev/null 2>&1
 ```

