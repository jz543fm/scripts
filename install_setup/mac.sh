#!/usr/bin/env bash

uptime

#Get OS
uname -a

#Homebrew
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

#Brew packaging
brew install ansible
brew install netcat
brew install nmap
brew install tcpdump
brew install pass
brew install kubectx
brew install k9s

#Starship
cd ~/; git clone https://github.com/jz543fm/starship-conf.git
cd starship-conf/; ./install_bash.sh; cd ~/; rm -rf starship-conf;

echo -e 'ssh\n'
ls -ltr ~/.ssh/

echo -e 'Do not forget to set up pass-backup\n'
cd ~/; git clone https://github.com/jz543fm/pass-backup.git

echo -e 'Do not forget to scripts\n'
cd ~/; git clone https://github.com/jz543fm/scripts

read -p "Do you want to list all users on this system? (y/n): " answer

if [[ "$answer" == [yY] || "$answer" == [yY][eE][sS] ]]; then
    echo "Listing all users on macOS:"
    awk -F: '{ print $1}' /etc/passwd
else
    echo "Operation canceled."
fi