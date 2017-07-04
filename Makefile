.PHONY: dovecot-forward
dovecot-forward:
	kubectl --namespace dovecot port-forward `kubectl --namespace dovecot get pods | grep proxy | cut -d ' ' -f1` 1993:993

.PHONY: grafana-forward
grafana-forward:
	kubectl --namespace monitoring port-forward `kubectl --namespace monitoring get pods | grep grafana | cut -d ' ' -f1` 3000

.PHONY: pluto-distributor-forward
pluto-distributor-forward:
	kubectl --namespace pluto port-forward `kubectl --namespace pluto get pods | grep distributor | cut -d ' ' -f1` 1993

.PHONY: pluto-recreate
pluto-recreate:
	kubectl --namespace pluto delete deployment distributor
	kubectl --namespace pluto delete deployment worker-1
	kubectl --namespace pluto delete deployment storage
	kubectl apply -f k8s/pluto/distributor/deployment.yml
	kubectl apply -f k8s/pluto/worker-1/deployment.yml
	kubectl apply -f k8s/pluto/storage/deployment.yml

.PHONY: pluto-secrets
pluto-secrets:
	mkdir -p k8s/pluto/secrets/
	gopass pluto/gke/pluto/internal-distributor-cert.pem > k8s/pluto/secrets/internal-distributor-cert.pem
	gopass pluto/gke/pluto/internal-distributor-key.pem > k8s/pluto/secrets/internal-distributor-key.pem
	gopass pluto/gke/pluto/internal-storage-cert.pem > k8s/pluto/secrets/internal-storage-cert.pem
	gopass pluto/gke/pluto/internal-storage-key.pem > k8s/pluto/secrets/internal-storage-key.pem
	gopass pluto/gke/pluto/internal-worker-1-cert.pem > k8s/pluto/secrets/internal-worker-1-cert.pem
	gopass pluto/gke/pluto/internal-worker-1-key.pem > k8s/pluto/secrets/internal-worker-1-key.pem
	gopass pluto/gke/pluto/public-distributor-cert.pem > k8s/pluto/secrets/public-distributor-cert.pem
	gopass pluto/gke/pluto/public-distributor-key.pem > k8s/pluto/secrets/public-distributor-key.pem
	gopass pluto/gke/pluto/root-cert.pem > k8s/pluto/secrets/root-cert.pem
	gopass pluto/gke/pluto/root-key.pem > k8s/pluto/secrets/root-key.pem
	kubectl --namespace pluto create secret generic internal-distributor-cert.pem --from-file k8s/pluto/secrets/internal-distributor-cert.pem
	kubectl --namespace pluto create secret generic internal-distributor-key.pem --from-file k8s/pluto/secrets/internal-distributor-key.pem
	kubectl --namespace pluto create secret generic internal-storage-cert.pem --from-file k8s/pluto/secrets/internal-storage-cert.pem
	kubectl --namespace pluto create secret generic internal-storage-key.pem --from-file k8s/pluto/secrets/internal-storage-key.pem
	kubectl --namespace pluto create secret generic internal-worker-1-cert.pem --from-file k8s/pluto/secrets/internal-worker-1-cert.pem
	kubectl --namespace pluto create secret generic internal-worker-1-key.pem --from-file k8s/pluto/secrets/internal-worker-1-key.pem
	kubectl --namespace pluto create secret generic public-distributor-cert.pem --from-file k8s/pluto/secrets/public-distributor-cert.pem
	kubectl --namespace pluto create secret generic public-distributor-key.pem --from-file k8s/pluto/secrets/public-distributor-key.pem
	kubectl --namespace pluto create secret generic root-cert.pem --from-file k8s/pluto/secrets/root-cert.pem
	kubectl --namespace pluto create secret generic root-key.pem --from-file k8s/pluto/secrets/root-key.pem


# Make sure to run prometheus-forward in another terminal
.PHONY: prometheus-configmap
prometheus-configmap:
	kubectl apply -f k8s/monitoring/prometheus/configmap.yml
	sleep 5
	curl -s -i -X POST localhost:9090/-/reload

.PHONY: prometheus-forward
prometheus-forward:
	kubectl --namespace monitoring port-forward `kubectl --namespace monitoring get pods | grep prometheus | cut -d ' ' -f1` 9090
