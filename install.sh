#!/bin/sh

if [ ! -d backupfiles]; then
  mkdir backupfiles
fi

# extract cgminer
echo "extracting cgminer"
tar xjf cgminer-3.7.2-x86_64-built.tar.bz2

# add cron job that runs every hour
echo "adding cron job to check if cgminer.conf has changed"
cp checkcgminerconfig.sh /etc/cron.hourly

# add a job at startup
if ! grep --quiet "^/home/miner/miner_launcher.sh 30 &"; then
  echo "backing up /etc/rc.local to `pwd`/backupfiles/rc.local_backup"
  cp /etc/rc.local rc.local_backup
  echo "updating /etc/rc.local"
  cp rc.local > /etc/rc.local
fi

# update and reload .bashrc
if ! grep --quiet "^alias cgm='screen -x cgm'" /home/miner/.bashrc; then
  echo "backing up /home/miner/.bashrc to `pwd`/backupfiles/bashrcbackup"
  cp /home/miner/.bashrc bashrc_backup
  echo "updating /home/miner/.bashrc"
  cat /home/miner/.bashrc bashrc > /home/miner.bashrc
fi
