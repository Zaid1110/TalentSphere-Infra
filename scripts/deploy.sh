#!/bin/bash

set -e

echo "Creating EKS Cluster"

eksctl create cluster -f eks/cluster.yaml

echo "Installing EBS CSI"

bash addons/ebs-csi.sh

echo "Installing Metrics Server"

bash addons/metrics-server.sh

echo "Installing Ingress"

bash ingress/ingress.sh

echo "Installing Monitoring"

bash monitoring/monitoring.sh

echo "Deploying TalentSphere"

helm upgrade --install talentsphere ../TalentSphere-App/helm/talentsphere

echo "Deployment Completed"
