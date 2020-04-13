
#!/bin/sh
# Deletion of moniroting solution

kubectl delete all --all -n monitoring
echo deployment,pods,services deleted

# configmaps
kubectl delete cm grafana-dashboard-definitions -n monitoring
kubectl delete cm grafana-dashboards -n monitoring
kubectl delete cm grafana-datasources -n monitoring
kubectl delete cm prometheus-config -n monitoring
kubectl delete cm alert-unit-tests -n monitoring
echo config maps deleted

# cluster roles
# kubectl delete clusterroles prometheus
# kubectl delete clusterrolebindings prometheus
# kubectl delete serviceaccounts default -n monitoring

# Delete kube-state
# kubectl delete clusterroles kube-state-metrics
# kubectl delete clusterrolebindings kube-state-metrics
# kubectl delete serviceaccounts kube-state-metrics -n kube-system
# kubectl delete deployment kube-state-metrics -n kube-system
# kubectl delete service kube-state-metrics -n kube-system


#namespace
#kubectl delete namespace monitoring

#echo cluster roles deleted