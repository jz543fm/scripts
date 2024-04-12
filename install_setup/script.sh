#!/usr/bin/env bash

#My personal setup

read -p "Enter architecture: " ARCHITECTURE
read -p "Enter architecture for kubens+kubectx - (arm64, armhf, armv7, ppc64Ie, s390x, x86_64 ) : " ARCHITECTURE2
read -p "Enter architecture for docker-compose - (aarch64, x86_64, arm6, arm7, ppc64Ie, risvc64, s390x ) : " ARCHITECTURE3
read -p "Enter architecture for trivy - (32bit, 64bit, ARM, ARM64, PPC64LE, s390x ) : " ARCHITECTURE4

sudo apt-get update

sudo apt-get install -y wget curl bmon htop vim nmap

#Common tools:

#k9s
K9S_VERSION=0.32.4; curl -sSLO https://github.com/derailed/k9s/releases/download/v${K9S_VERSION}/k9s_Linux_${ARCHITECTURE}.tar.gz; tar -xvf k9s_Linux_${ARCHITECTURE}.tar.gz; rm -rf LICENSE README.md; sudo cp k9s /usr/local/bin; rm -rf k9s; rm -rf k9s_*.tar.gz

#Dive
DIVE_VERSION=0.12.0;  curl -sSLO https://github.com/wagoodman/dive/releases/download/v${DIVE_VERSION}/dive_${DIVE_VERSION}_linux_${ARCHITECTURE}.deb && sudo dpkg -i dive_${DIVE_VERSION}_linux_${ARCHITECTURE}.deb; rm -rf dive*

#Trivy
TRIVY_VERSION=0.50.1; curl -sSLO https://github.com/aquasecurity/trivy/releases/download/v${TRIVY_VERSION}/trivy_${TRIVY_VERSION}_Linux-${ARCHITECTURE4}.deb && sudo dpkg -i trivy_${TRIVY_VERSION}_Linux-${ARCHITECTURE4}.deb; rm -rf trivy*.deb

#Kubens + Kubectx
KUBECTX_VERSION=0.9.5; curl -sSLO https://github.com/ahmetb/kubectx/releases/download/v${KUBECTX_VERSION}/kubectx_v${KUBECTX_VERSION}_linux_${ARCHITECTURE3}.tar.gz; tar -xvf kubectx_v${KUBECTX_VERSION}_linux_${ARCHITECTURE3}.tar.gz; rm -rf LICENSE; sudo cp kubectx /usr/local/bin/; rm -rf kubectx*

KUBENS_VERSION=0.9.5; curl -sSLO https://github.com/ahmetb/kubectx/releases/download/v${KUBENS_VERSION}/kubens_v${KUBENS_VERSION}_linux_${ARCHITECTURE3}.tar.gz; tar -xvf kubens_v${KUBENS_VERSION}_linux_${ARCHITECTURE3}.tar.gz; rm -rf LICENSE; sudo cp kubens /usr/local/bin/; rm -rf kubens*

#kubectl
KUBECTL_VERSION=1.29.2; curl -sSLO https://dl.k8s.io/release/v${KUBECTL_VERSION}/bin/linux/${ARCHITECTURE}/kubectl
sudo install -o root -g root -m 0755 kubectl /usr/local/bin/kubectl; rm -rf kubectl

#Docker compose
DOCKER_CONFIG=${DOCKER_CONFIG:-$HOME/.docker}
mkdir -p $DOCKER_CONFIG/cli-plugins
DOCKER_COMPOSE_VERSION=2.26.1; curl -SL https://github.com/docker/compose/releases/download/v${DOCKER_COMPOSE_VERSION}/docker-compose-linux-${ARCHITECTURE2} -o $DOCKER_CONFIG/cli-plugins/docker-compose
chmod +x $DOCKER_CONFIG/cli-plugins/docker-compose

#Docker Engine
curl -fsSL https://get.docker.com -o get-docker.sh; sudo sh get-docker.sh; rm -rf get-docker.sh

        #Permissions:
        sudo usermod -aG docker $USER
        newgrp docker

rm -rf get-docker.sh

docker compose version #verify