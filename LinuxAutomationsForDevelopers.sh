#!/bin/bash

echo "Enter the user name : "
IFS="" read -s UserName  </dev/tty # OR < /proc/$$/fd/0

echo "Enter the user password : "
IFS="" read -s UserPassword  </dev/tty # OR < /proc/$$/fd/0


#To update the local package index with the latest changes made in the repositories
sudo apt update

/usr/bin/expect <<EOD
expect "[sudo] password for $UserName\r"
send -- "$UserPassword\r"
interact
EOD
echo "you're out"


# To upgrade your system, first, update your package index as outlined above, and then use:
sudo apt upgrade

#Installing Google Chrome
wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
sudo dpkg -i google-chrome-stable_current_amd64.deb
sudo apt -f install #this is in case there is some error in the installation process

#Installing Telegram Snap App
sudo snap install telegram-desktop

#Installing Visual Studio Code
sudo snap install code --classic

#Installing VLC mediaplayer
sudo apt install vlc

#Installing z Shell (which is is a Unix shell that can be used as an interactive login shell and as a command interpreter for shell scripting)
sudo apt-get install zsh

echo "It Is Done!"
