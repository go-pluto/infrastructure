.PHONY: benchmark-dovecot
benchmark-dovecot:
	kubectl --namespace benchmark delete job dovecot-benchmark
	kubectl apply -f k8s/benchmark/jobs/dovecot-benchmark.yml

.PHONY: benchmark-pluto
benchmark-pluto:
	kubectl --namespace benchmark delete job pluto-benchmark
	kubectl apply -f k8s/benchmark/jobs/pluto-benchmark.yml

.PHONY: dovecot-forward
dovecot-forward:
	kubectl --namespace dovecot port-forward `kubectl --namespace dovecot get pods | grep proxy | cut -d ' ' -f1` 1993:99

.PHONY: dovecot-simple-forward
dovecot-simple-forward:
	kubectl --namespace dovecot-simple port-forward `kubectl --namespace dovecot-simple get pods | grep proxy | cut -d ' ' -f1` 1993:993

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
	kubectl apply -f k8s/pluto/distributor/
	kubectl apply -f k8s/pluto/worker-1/
	kubectl apply -f k8s/pluto/storage/

.PHONY: pluto-secrets
pluto-secrets:
	mkdir -p k8s/pluto/secrets/
	for name in internal-distributor-cert internal-storage-cert internal-worker-1-cert public-distributor-cert root-cert; do \
		gopass show -f pluto/gke/pluto/$$name-cert.pem > k8s/pluto/secrets/$$name-cert.pem; \
		gopass show -f pluto/gke/pluto/$$name-key.pem > k8s/pluto/secrets/$$name-key.pem; \
		kubectl --namespace pluto create secret generic $$name-cert.pem --from-file k8s/pluto/secrets/$$name-cert.pem; \
		kubectl --namespace pluto create secret generic $$name-key.pem --from-file k8s/pluto/secrets/$$name-key.pem; \
	done

.PHONY: pluto-fed-secrets
pluto-fed-secrets:
	mkdir -p k8s/pluto-federation/secrets/
	for name in internal-distributor internal-eu-worker-1 internal-eu-worker-2 internal-eu-worker-3 internal-storage internal-us-worker-1 internal-us-worker-2 internal-us-worker-3 public-distributor root; do \
		gopass show -f pluto/gke/pluto-federation/$$name-cert.pem > k8s/pluto-federation/secrets/$$name-cert.pem; \
		gopass show -f pluto/gke/pluto-federation/$$name-key.pem > k8s/pluto-federation/secrets/$$name-key.pem; \
		kubectl --namespace pluto create secret generic $$name-cert.pem --from-file k8s/pluto-federation/secrets/$$name-cert.pem; \
		kubectl --namespace pluto create secret generic $$name-key.pem --from-file k8s/pluto-federation/secrets/$$name-key.pem; \
	done

.PHONY: pluto-fed-secrets-rm
pluto-fed-secrets-rm:
	for name in internal-distributor internal-eu-worker-1 internal-eu-worker-2 internal-eu-worker-3 internal-storage internal-us-worker-1 internal-us-worker-2 internal-us-worker-3 public-distributor root; do \
		kubectl --namespace pluto delete secret $$name-cert.pem; \
		kubectl --namespace pluto delete secret $$name-key.pem; \
	done

.PHONY: benchmark-secrets
benchmark-secrets:
	mkdir -p k8s/benchmark/secrets/
	gopass show -f pluto/gke/benchmark/service-account.json > k8s/benchmark/secrets/service-account.json
	kubectl --namespace benchmark create secret generic service-account.json --from-file k8s/benchmark/secrets/service-account.json

# Make sure to run prometheus-forward in another terminal
.PHONY: prometheus-configmap
prometheus-configmap:
	kubectl apply -f k8s/monitoring/prometheus/configmap.yml
	sleep 5
	curl -s -i -X POST localhost:9090/-/reload

.PHONY: prometheus-forward
prometheus-forward:
	kubectl --namespace monitoring port-forward `kubectl --namespace monitoring get pods | grep prometheus | cut -d ' ' -f1` 9090
