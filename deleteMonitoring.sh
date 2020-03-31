
#!/bin/sh
# Deletion of moniroting solution

kubectl delete all --all -n monitoring
echo deployment,pods,services deleted

# configmaps
kubectl delete cm grafana-dashboard-definitions -n monitoring
kubectl delete cm grafana-dashboards -n monitoring
kubectl delete cm grafana-datasources -n monitoring
kubectl delete cm prometheus-config -n monitoring
echo config maps deleted

# cluster roles
#kubectl delete clusterroles prometheus
#kubectl delete clusterrolebindings prometheus
#kubectl delete serviceaccounts default

#namespace
#kubectl delete namespace monitoring

#echo cluster roles deleted