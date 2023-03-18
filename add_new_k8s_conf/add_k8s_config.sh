#!/usr/bin/env bash

cnf=$(realpath $1)
echo "This script adds new K8s conf $config to ~/.kube/config"
if [ -d "$HOME/.kube/bckp" ] 
then
    echo "Directory ~/.kube/bckp exists." 
else
    echo "Error: Directory ~/.kube/bckp does not exists."
    echo -e "\t Info: Creates a ~/.kube/bckp backup directory\n"
    mkdir -p ~/.kube/bckp
    cp ~/.kube/config ~/.kube/bckp/config-$(date +%Y-%d-%m-%H%M%S)
fi
KUBECONFIG=$cnf:/home/$(whoami)/.kube/config kubectl config view --merge --flatten > /tmp/k8s-cnf; mv /tmp/k8s-cnf /home/$(whoami)/.kube/config
echo -e "New config get-contexts:\n"
kubectl config get-contexts
