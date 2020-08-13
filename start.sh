#!/bin/sh
# Deletion of moniroting solution

kubectl create namespace monitoring

# kubectl create -f secret.yaml

kubectl create secret generic regcred \
    --from-file=.dockerconfigjson=/home/Matrixx/.docker/config.json \
    --type=kubernetes.io/dockerconfigjson \
-n monitoring

echo "Installing Prometheus"
kubectl create -f 02-cluster-role.yaml
kubectl create -f 03-prometheus-configmap.yaml
# kubectl create -f 04-prometheus-deployment.yaml
# kubectl create -f 05-prometheus-service.yaml
kubectl create -f 04-prometheus-statefulset.yaml
kubectl create -f 05-service.yaml
# kubectl create -f prometheus-statefulset/

echo "Installing Grafana"
kubectl create -f grafana-datasources.yaml
kubectl create -f grafana-dashboards.yml
kubectl create -f grafana-dashboards-definition.yaml
kubectl create -f grafana-pvc.yaml
kubectl create -f grafana-deployment-persist.yaml
kubectl create -f grafana-service.yaml

echo "Installing Alert Manager"
kubectl create -f alertmanager-config.yaml
kubectl create -f alertmanager-deployment.yaml
kubectl create -f alertmanager-service.yaml

echo "Installing kube-state"
kubectl create -f kube-state/

echo "Installing Node-exporter"
kubectl create -f node-exporter/

echo "Installing mongodb-exporter"
kubectl create -f mongodb-exporter/deployment.yaml
kubectl create -f mongodb-exporter/deployment-shards.yaml
# kubectl create -f mongodb-exporter/service.yaml

echo "Installing snmp-exporter"
kubectl create -f snmp-exporter/configmap.yaml
kubectl create -f snmp-exporter/deployment.yaml
kubectl create -f snmp-exporter/service.yaml

echo "Installing vmware-exporter"
kubectl create secret generic vmware-exporter-password --from-literal=VSPHERE_PASSWORD=Password@1 -n monitoring
kubectl create -f vmware-exporter/config.yml
kubectl create -f vmware-exporter/vmware-exporter.yml

kubectl get all -n monitoring