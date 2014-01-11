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
    sudo reboot

Once the system has come backup and you are logged in again:

    sudo adduser miner  <-- take defaults for most things
    sudo miner
    cd /home/miner
    git clone https://github.com/Griffitsj/cgminerbootstrap.git
    cd cgminerbootstrap
    exit
    ./install.sh
