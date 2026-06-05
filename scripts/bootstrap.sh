#!/bin/bash

sudo apt update -y

sudo apt install -y docker.io git

sudo apt install -y docker-compose-v2

sudo systemctl enable docker

sudo systemctl start docker

sudo usermod -aG docker ubuntu

echo "Bootstrap completed"
