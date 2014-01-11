#!/bin/sh
cd /home/miner/cgminerbootstrap
git pull
if [ cgminer.conf -nt /home/miner/.cgminer/cgminer.conf ]; then
  echo "restarting cgminer with new config"
  cp cgminer.conf /home/miner/.cgminer/cgminer.conf
  killall cgminer
  ./miner_launcher.sh 10 &
fi
