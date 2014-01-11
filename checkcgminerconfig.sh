#!/bin/sh
if [ ! -d "/home/miner/.cgminer" ]; then
  mkdir /home/miner/.cgminer
fi

cd /home/miner/cgminerbootstrap
git pull
if [ cgminer.conf -nt /home/miner/.cgminer/cgminer.conf ]; then
  echo "restarting cgminer with new config"
  cp config/cgminer.conf /home/miner/.cgminer/cgminer.conf
  killall cgminer
  su miner -c ./miner_launcher.sh 10 &
fi
