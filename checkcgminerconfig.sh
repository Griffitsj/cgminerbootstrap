#!/bin/bash
source /etc/cgminerbootstraprc
sudo -su $cguser
source /etc/cgminerbootstraprc
if [ -f $cgdir/config/cgminer.`hostname`.conf ]; then
  FILENAME_TO_TEST=$cgdir/config/cgminer.`hostname`.conf 
else
  FILENAME_TO_TEST=$cgdir/config/cgminer.conf
fi
cd $cgir
git pull
if [ $FILENAME_TO_TEST -nt /etc/cgminer.conf ]; then
  echo "restarting cgminer with new config"
  echo cp $FILENAME_TO_TEST /etc/cgminer.conf
  cp $FILENAME_TO_TEST /etc/cgminer.conf
  killall cgminer
  $cgdir/miner_launcher.sh 10 &
fi
exit
