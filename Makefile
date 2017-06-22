.PHONY: grafana-forward
grafana-forward:
	kubectl --namespace monitoring port-forward `kubectl --namespace monitoring get pods | grep grafana | cut -d ' ' -f1` 3000

.PHONY: prometheus-forward
prometheus-forward:
	kubectl --namespace monitoring port-forward `kubectl --namespace monitoring get pods | grep prometheus | cut -d ' ' -f1` 9090

# Make sure to run prometheus-forward in another terminal
.PHONY: prometheus-configmap
prometheus-configmap:
	kubectl apply -f k8s/monitoring/prometheus/configmap.yml
	sleep 5
	curl -s -i -X POST localhost:9090/-/reload
