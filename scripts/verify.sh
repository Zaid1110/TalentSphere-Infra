#!/bin/bash

echo "========= NODES ========="
kubectl get nodes

echo "========= PODS ========="
kubectl get pods -A

echo "========= SERVICES ========="
kubectl get svc -A

echo "========= INGRESS ========="
kubectl get ingress

echo "========= PVC ========="
kubectl get pvc

echo "========= HPA ========="
kubectl get hpa
