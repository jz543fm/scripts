#!/usr/bin/env bash

### kustomize

KUSTOMIZE_VERSION=5.1.1;

curl -sSLO https://github.com/kubernetes-sigs/kustomize/releases/download/kustomize%2Fv${KUSTOMIZE_VERSION}/kustomize_v${KUSTOMIZE_VERSION}_linux_amd64.tar.gz;

tar -xvf kustomize_v${KUSTOMIZE_VERSION}_linux_amd64.tar.gz; mv kustomize kustomize_v${KUSTOMIZE_VERSION}; rm -rf *.tar.gz;