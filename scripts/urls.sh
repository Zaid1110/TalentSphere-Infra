#!/bin/bash

echo "Grafana"

kubectl get svc -n monitoring

echo ""

echo "Ingress"

kubectl get ingress
