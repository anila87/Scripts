kubectl create namespace monitoring #craete a namespace 
# Prometheus repo
helm repo add prometheus-community https://prometheus-community.github.io/helm-charts
helm repo update

# Grafana repo
helm repo add grafana https://grafana.github.io/helm-charts
helm repo update

#install Prometheus
helm install prometheus prometheus-community/prometheus \
  --namespace monitoring \  
  --set alertmanager.persistentVolume.enabled=true \
  --set server.persistentVolume.enabled=true

#install Grafana
helm install grafana grafana/grafana \
  --namespace monitoring \
  --set persistence.enabled=true \
  --set adminPassword='YourStrongPassword' \
  --set service.type=LoadBalancer
