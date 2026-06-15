#!/bin/bash

echo ""
echo "TalentSphere"
kubectl get ingress

echo ""
echo "Grafana"
kubectl get svc -n monitoring monitoring-grafana

echo ""
echo "Prometheus"
kubectl get svc -n monitoring monitoring-kube-prometheus-prometheus
