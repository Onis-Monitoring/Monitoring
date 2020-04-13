#!/bin/sh
# Deletion of moniroting solution

kubectl create -f 01-namespace.yaml

echo "Installing Prometheus"
kubectl create -f 02-cluster-role.yaml
kubectl create -f 03-prometheus-configmap.yaml
kubectl create -f tests/alert-tests.yaml
kubectl create -f 04-prometheus-deployment.yaml
kubectl create -f 05-prometheus-service.yaml

echo "Installing Grafana"
kubectl create -f grafana-datasources.yaml
kubectl create -f grafana-dashboards.yml
kubectl create -f grafana-dashboards-definition.yaml
kubectl create -f grafana-deployment.yaml
kubectl create -f grafana-service.yaml

echo "Installing Alert Manager"
#
kubectl create -f alertmanager-deployment.yaml
kubectl create -f alertmanager-service.yaml

echo "Installing kube-state"
#kube-state
kubectl create -f kube-state/

kubectl get all -n monitoring