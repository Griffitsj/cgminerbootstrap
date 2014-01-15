#!/bin/sh
export DISPLAY=:0
export GPU_MAX_ALLOC_PERCENT=100
export GPU_USE_SYNC_OBJECTS=1
cd ~/cgminerbootstrap/cgminer-3.7.2-x86_64-built
./cgminer -c /etc/cgminer.conf
