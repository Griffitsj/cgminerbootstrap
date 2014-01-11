#!/bin/sh
if [ ! -d "/home/miner/.cgminer" ]; then
  mkdir /home/miner/.cgminer
fi

if [ -f config/cgminer.`hostname`.conf ]; then
  FILENAME_TO_TEST=config/cgminer.`hostname`.conf 
else
  FILENAME_TO_TEST=config/cgminer.conf
fi

cd /home/miner/cgminerbootstrap
git pull origin master
if [ $FILENAME_TO_TEST -nt /home/miner/.cgminer/cgminer.conf ]; then
  echo "restarting cgminer with new config"
  cp $FILENAME_TO_TEST /home/miner/.cgminer/cgminer.conf
  killall cgminer
  su miner -c ./miner_launcher.sh 10 &
fi
