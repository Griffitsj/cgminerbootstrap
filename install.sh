#!/bin/sh

if [ ! -d backupfiles ]; then
  mkdir backupfiles
fi

if [ -f /etc/cgminerbootstraprc ]; then
  cp /etc/cgminerbootstraprc backupfiles
fi

echo cguser=$SUDO_USER > /etc/cgminerbootstraprc
echo cgdir=`pwd` >> /etc/cgminerbootstraprc
echo cguserdir=$HOME >> /etc/cgminerbootstraprc

# add cgminer.conf
if [ ! -d ~/.cgminer ]; then
  mkdir ~/.cgminer
fi

if [ -f /etc/cgminer.conf ]; then
  cp /etc/cgminer.conf backupfiles/cgminer.conf
fi

if [ -f config/cgminer.`hostname`.conf ]; then
  echo "copying config/cgminer.`hostname`.conf to /etc/cgminer.conf"
  cp config/cgminer.`hostname`.conf /etc/cgminer.conf
else
  echo "copying config/cgminer.conf to /etc/cgminer.conf"
  cp config/cgminer.conf /etc/cgminer.conf
fi

# extract cgminer
echo "extracting cgminer"
tar xjf cgminer-3.7.2-x86_64-built.tar.bz2

# add cron job that runs every hour
echo "adding checkcgminerconfig.sh to /etc/cron.hourly"
cp checkcgminerconfig.sh /etc/cron.hourly/

# add a job at startup
if ! grep -q miner_launcher.sh /etc/rc.local; then
  echo "backing up /etc/rc.local to backupfiles/rc.local"
  cp /etc/rc.local backupfiles/rc.local
  echo "updating /etc/rc.local"
  cp rc.local /etc/rc.local
fi

# update and reload .bashrc
if ! grep -q ^alias\ cgm ~/.bashrc; then
  echo "backing up ~/.bashrc to backupfiles/bashrc"
  cp ~/.bashrc backupfiles/bashrc
  echo "updating .bashrc"
  echo "alias cgm='screen -x cgm'" >> ~/.bashrc
fi
