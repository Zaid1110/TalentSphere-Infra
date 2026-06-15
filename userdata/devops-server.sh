#!/bin/bash

set -e

apt update -y

apt install -y \
docker.io \
curl \
wget \
unzip \
git \
jq

systemctl enable docker
systemctl start docker

usermod -aG docker ubuntu

# Docker Compose v2
mkdir -p /usr/local/lib/docker/cli-plugins

curl -SL \
https://github.com/docker/compose/releases/latest/download/docker-compose-linux-x86_64 -o /usr/local/lib/docker/cli-plugins/docker-compose

chmod +x /usr/local/lib/docker/cli-plugins/docker-compose

docker compose version

mkdir -p /opt/devops

# Jenkins
docker run -d --name jenkins --restart unless-stopped -p 8080:8080 -p 50000:50000 -v jenkins_home:/var/jenkins_home jenkins/jenkins:lts

# SonarQube
docker run -d --name sonarqube --restart unless-stopped -p 9000:9000 sonarqube:lts-community

# Nexus
docker run -d --name nexus --restart unless-stopped -p 8081:8081 -v nexus-data:/nexus-data sonatype/nexus3

# AWS CLI
curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip"

unzip awscliv2.zip

./aws/install

# kubectl
curl -LO https://dl.k8s.io/release/v1.34.0/bin/linux/amd64/kubectl

install -o root -g root -m 0755 kubectl /usr/local/bin/kubectl

# Helm
curl https://raw.githubusercontent.com/helm/helm/main/scripts/get-helm-3 | bash

# eksctl
curl --silent --location \
"https://github.com/weaveworks/eksctl/releases/latest/download/eksctl_$(uname -s)_amd64.tar.gz" \
| tar xz -C /tmp

mv /tmp/eksctl /usr/local/bin

# Verification
docker ps

kubectl version --client || true

helm version || true

eksctl version || true
