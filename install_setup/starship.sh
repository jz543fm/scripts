#!/usr/bin/env bash

# Install My repo w/ Starship
git clone https://github.com/jz543fm/starship-conf.git
cd starship-conf/; chmod 750 install*; ./install_bash.sh; cd ../; rm -rf starship-conf;
curl -sS https://starship.rs/install.sh | sudo sh #Linux