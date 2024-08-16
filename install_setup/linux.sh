#!/usr/bin/env bash

uptime

#Get OS
uname -a

#Base Packaging
sudo apt-get install -y wget curl net-tools whois netcat-traditional pciutils bmon htop git vim nmap tcpdump pass

#Ansible
sudo apt install software-properties-common
sudo add-apt-repository --yes --update ppa:ansible/ansible
sudo apt install -y ansible

#Starship
cd ~; git clone https://github.com/jz543fm/starship-conf.git
brew install starship
cd starship-conf/; ./install_zsh.sh; cd ../; rm -rf starship-conf;

#K8s-Backup
cd ~; git clone https://github.com/jz543fm/k8s-backup; cd k8s-backup; mv add_k8s_config.sh /usr/local/bin

echo -e 'ssh\n'
cat ~/.ssh/

echo -e 'Do not forget to set up pass-backup\n'
cd ~/; git clone https://github.com/jz543fm/pass-backup.git

echo -e 'Do not forget to scripts\n'
cd ~/; git clone https://github.com/jz543fm/scripts

read -p "Do you want to list all users on this Ubuntu system? (y/n): " answer

if [[ "$answer" == [yY] || "$answer" == [yY][eE][sS] ]]; then
    echo "Listing all users on Ubuntu:"
    awk -F: '{ print $1}' /etc/passwd
else
    echo "Operation canceled."
fi