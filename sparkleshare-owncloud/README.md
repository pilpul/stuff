I use this configuration to make my [sparkleshare](http://sparkleshare.org/) project accessible (and editable) via [owncloud](http://owncloud.org/).
The sparkleshare repository and owncloud instance are located on the same machine.

1. Clone the sparkelshare repository (Attention: From that moment on you'll have all files doubled on the filesystem; in the sparkleshare main repository and as a copy in owncloud)
 ```
 cd /$PATHTOOWNCLOUDDATA/$USER/files
 git clone /home/storage/$PROJECT
 cd $PROJECT
 ```

2. To prevent that 'root' is logged as user for all actions you may set it as well
```
git config user.name "owncloud"
git config user.email "owncloud@$HOST"
```

3. copy [sync script](https://github.com/pilpul/stuff/blob/master/sparkleshare-owncloud/sparkleshare-owncloud-sync.sh)
```
sudo nano /home/storage/sparkeshare-owncloud-sync-$USER.sh
```
 
4. set up cron to sync each minute
```
sudo nano /etc/crontab
```
add this lines to the end
```
#update owncloud from sparkleshare-git-repository
 * *    * * *   root   /home/storage/sparkleshare-owncloud-sync-$USER.sh >/dev/null 2>&1
 ```

