#!/bin/bash

kubectl get deployment metrics-server -n kube-system >/dev/null 2>&1

if [ $? -eq 0 ]
then
    echo "Metrics Server already installed"
else
    helm repo add metrics-server https://kubernetes-sigs.github.io/metrics-server
    helm repo update

    helm install metrics-server metrics-server/metrics-server -n kube-system --set args="{--kubelet-insecure-tls}"
fi
