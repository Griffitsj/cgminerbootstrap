#!/bin/sh

if [ ! -d backupfiles ]; then
  mkdir backupfiles
fi

# add cgminer.conf
if [ ! -d /home/miner/.cgminer ]; then
  mkdir /home/miner/.cgminer
fi

if [ -f /home/miner/.cgminer/cgminer.conf ]; then
  cp /home/miner/.cgminer/cgminer.conf backupfiles/cgminer.conf_backup
fi

if [ -f config/cgminer.`hostname`.conf ]; then
  echo "copying config/cgminer.`hostname`.conf to .cgminer/cgminer.conf"
  cp config/cgminer.`hostname`.conf /home/miner/.cgminer/cgminer.conf
else
  echo "copying config/cgminer.conf to .cgminer/cgminer.conf"
  cp config/cgminer.conf /home/miner/.cgminer/cgminer.conf
fi

# extract cgminer
echo "extracting cgminer"
tar xjf cgminer-3.7.2-x86_64-built.tar.bz2

# add cron job that runs every hour
echo "adding checkcgminerconfig.sh to /etc/cron.hourly"
cp checkcgminerconfig.sh /etc/cron.hourly/

# add a job at startup
if ! grep -q miner_launcher.sh /etc/rc.local; then
  echo "backing up /etc/rc.local to backupfiles/rc.local_backup"
  cp /etc/rc.local backupfiles/rc.local_backup
  echo "updating /etc/rc.local"
  cp rc.local /etc/rc.local
fi

# update and reload .bashrc
if ! grep -q ^alias\ cgm /home/miner/.bashrc; then
  echo "backing up /home/miner/.bashrc to backupfiles/bashrcbackup"
  cp /home/miner/.bashrc backupfiles/bashrc_backup
  echo "updating .bashrc"
  cat /home/miner/.bashrc bashrc > backupfiles/newbashrc
  mv backupfiles/newbashrc /home/miner/.bashrc
fi
