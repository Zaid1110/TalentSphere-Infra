#!/bin/bash

set -e

echo "================================="
echo "Creating DevOps Server"
echo "================================="

cd terraform

terraform init

terraform apply -auto-approve

cd ..

echo "================================="
echo "Creating EKS Cluster"
echo "================================="

eksctl create cluster -f eks/cluster.yaml

echo "================================="
echo "Installing Metrics Server"
echo "================================="

bash addons/metrics-server.sh

echo "================================="
echo "Installing EBS CSI"
echo "================================="

bash addons/ebs-csi.sh

echo "================================="
echo "Installing Ingress"
echo "================================="

bash ingress/ingress.sh

echo "================================="
echo "Installing Monitoring"
echo "================================="

bash monitoring/monitoring.sh

echo "================================="
echo "Deployment Completed"
echo "================================="
