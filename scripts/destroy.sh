#!/bin/bash

helm uninstall talentsphere || true

helm uninstall monitoring -n monitoring || true

helm uninstall ingress-nginx -n ingress-nginx || true

eksctl delete cluster --name talentsphere-eks --region us-east-1
