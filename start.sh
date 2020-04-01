#!/bin/sh
# Deletion of moniroting solution

kubectl create -f 01-namespace.yaml
kubectl create -f 02-cluster-role.yaml
kubectl create -f 03-prometheus-configmap.yaml
kubectl create -f 04-prometheus-deployment.yaml
kubectl create -f 05-prometheus-service.yaml
kubectl create -f grafana-datasources.yaml
kubectl create -f grafana-dashboards.yml
kubectl create -f grafana-dashboards-definition.yaml
kubectl create -f grafana-deployment.yaml
kubectl create -f grafana-service.yaml
#alertmanager-configmap.yaml
kubectl create -f alertmanager-deployment.yaml
kubectl create -f alertmanager-service.yaml

#kube-state
kubectl create -f kube-state/