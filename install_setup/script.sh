#!/usr/bin/env bash

#My personal setup

read -p "Enter architecture: " ARCHITECTURE
read -p "Enter architecture for kubens+kubectx - (arm64, armhf, armv7, ppc64Ie, s390x, x86_64 ) : " ARCHITECTURE2
read -p "Enter architecture for docker-compose - (aarch64, x86_64, arm6, arm7, 	ppc64Ie, risvc64, s390x ) : " ARCHITECTURE3

sudo apt-get update

sudo apt-get install -y wget curl bmon htop vim nmap

#Common tools:

#k9s
K9S_VERSION=0.27.4; curl -sSLO https://github.com/derailed/k9s/releases/download/v${K9S_VERSION}/k9s_Linux_${ARCHITECTURE}.tar.gz; tar -xvf k9s_Linux_${ARCHITECTURE}.tar.gz; rm -rf LICENSE README.md; sudo cp k9s /usr/local/bin; rm -rf k9s; rm -rf k9s_*.tar.gz

#Dive
DIVE_VERSION=0.11.0;  curl -sSLO https://github.com/wagoodman/dive/releases/download/v${DIVE_VERSION}/dive_${DIVE_VERSION}_linux_${ARCHITECTURE}.deb && sudo dpkg -i dive_${DIVE_VERSION}_linux_${ARCHITECTURE}.deb

#Trivy
TRIVY_VERSION=0.44.0; curl -sSLO https://github.com/aquasecurity/trivy/releases/download/v${TRIVY_VERSION}/trivy_${TRIVY_VERSION}_Linux-${ARCHITECTURE}.deb && sudo dpkg -i trivy_${TRIVY_VERSION}_Linux-${ARCHITECTURE}.deb

#Docker Engine
curl -fsSL https://get.docker.com -o get-docker.sh; sudo sh get-docker.sh; rm -rf get-docker.sh

	#Permissions:
	sudo usermod -aG docker $USER
	newgrp docker

#Docker compose
mkdir -p ~/.docker/cli-plugins/; DOCKER_COMPOSE=2.20.2; curl -SL 	download/v${DOCKER_COMPOSE}/docker-compose-linux-${ARCHITECTURE2} -o ~/.docker/cli-plugins/docker-compose; chmod +x ~/.docker/cli-plugins/docker-compose #permission

docker compose version #verify

#Kubens + Kubectx
KUBECTX_VERSION=0.9.5; curl -sSLO https://github.com/ahmetb/kubectx/releases/download/v${KUBECTX_VERSION}/kubectx_v${KUBECTX_VERSION}_linux_${ARCHITECTURE3}.tar.gz; tar -xvf kubectx_v${KUBECTX_VERSION}_linux_${ARCHITECTURE3}.tar.gz; rm -rf LICENSE; sudo cp kubectx /usr/local/bin/; rm -rf kubectx*

KUBENS_VERSION=0.9.5; curl -sSLO https://github.com/ahmetb/kubectx/releases/download/v${KUBENS_VERSION}/kubens_v${KUBENS_VERSION}_linux_${ARCHITECTURE3}tar.gz; tar -xvf kubens_v${KUBENS_VERSION}_linux_${ARCHITECTURE3}.tar.gz; rm -rf LICENSE; sudo cp kubens /usr/local/bin/; rm -rf kubens*

#Kubectl

KUBECTL_VERSION=1.27.4; curl -LO https://dl.k8s.io/release/v${KUBECTL_VERSION}/bin/linux/${ARCHITECTURE}/kubectl
sudo install -o root -g root -m 0755 kubectl /usr/local/bin/kubectl

# Install My repo w/ Starship
git clone https://github.com/jz543fm/starship-conf.git
curl -sS https://starship.rs/install.sh | sudo sh #Install Starship
cd starship-conf/; chmod 750 install*; ./install_bash.sh; cd ../; rm -rf starship-conf;
