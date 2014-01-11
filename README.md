cgminerbootstrap
================

Bootstrapper for installation of cgminer on Linux including ability to manage cgminer.conf for multiple machines.
This utility has been tested on Ubuntu 13.10, but should work on other Debian systems.
The default cgminer.conf supplied is setup for mining using a GPU and uses defaults.  
You should modify this cgminer.conf to use the pool of your choice and optimise the settings so you get maximum hashrate and close to zero hardware errors.


Pre-Requisites
==============
From a clean Ubuntu 13.10 installation, run the following commands:
    sudo apt-get install openssh-server screen git
    sudo apt-get install fglrx-updates fglrx-amdcccle-updates fglrx-updates-dev
    sudo aticonfig --adapter=all --initial
    sudo adduser miner admin <-- take defaults for most things but be sure to add a password
    sudo reboot

Once the system has come backup, login as the new user miner then run:
    git clone https://github.com/Griffitsj/cgminerbootstrap.git
    cd cgminerbootstrap
    sudo ./install.sh
    sudo reboot

CgMiner will start 30 seconds after rebooting.  To monitor it login as miner again and enter the command cgm.


Inspiration taken from: http://www.cryptobadger.com/2013/04/build-a-litecoin-mining-rig-linux/ 

If you found this project helpful then please consider a small donation:

    BTC:  1Nr38qvx2YCaahfxgD8sGsMHG2Roua8pib
    LTC:  
    DOGE: DJ1TMApNDSyH9FVwKdiBNCow6n3arAi8zn

