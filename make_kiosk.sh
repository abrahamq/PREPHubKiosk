#!/bin/bash
#adapted from blog post written by Dan Purdy
mkdir build 
cd build 

#sudo apt-get update 
sudo apt-get install  x11-xserver-utils

#install chromium: 
wget http://ftp.us.debian.org/debian/pool/main/libg/libgcrypt11/libgcrypt11_1.5.0-5+deb7u3_armhf.deb
wget http://launchpadlibrarian.net/218525709/chromium-browser_45.0.2454.85-0ubuntu0.14.04.1.1097_armhf.deb
wget http://launchpadlibrarian.net/218525711/chromium-codecs-ffmpeg-extra_45.0.2454.85-0ubuntu0.14.04.1.1097_armhf.deb
sudo dpkg -i libgcrypt11_1.5.0-5+deb7u3_armhf.deb
sudo dpkg -i chromium-codecs-ffmpeg-extra_45.0.2454.85-0ubuntu0.14.04.1.1097_armhf.deb
sudo dpkg -i chromium-browser_45.0.2454.85-0ubuntu0.14.04.1.1097_armhf.deb
#also install unclutter if you don't want the cursor to show on the screen
#sudo apt-get install unclutter

#install npm 
sudo apt-get install npm

cd .. 
npm install
cd build 


#disable power management 
sudo echo "@xset s off" > /etc/xdg/lxsession/LXDE/autostart 
sudo echo "@xset -dpms" > /etc/xdg/lxsession/LXDE/autostart 
sudo echo "@xset s noblank" > /etc/xdg/lxsession/LXDE/autostart 

#clear error messages from chromium 
sudo echo "@sed -i 's/"exited_cleanly": false/"exited_cleanly": true/' ~/.config/chromium/Default/Preferences" > /etc/xdg/lxsessions/LXDE/autostart 

#make chrome run on start 
sudo /etc/xdg/lxsessions/LXDE/autostart << echo  "@chromium --noerrdialogs --kiosk localhost:3000 --incognito" 
