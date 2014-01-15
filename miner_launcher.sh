#!/bin/bash
source /etc/cgminerbootstraprc
DEFAULT_DELAY=0
if [ "x$1" = "x" -o "x$1" = "xnone" ]; then
   DELAY=$DEFAULT_DELAY
else
   DELAY=$1
fi
sleep $DELAY
su $cguser -c "screen -dmS cgm $cgdir/mine_coins.sh"
