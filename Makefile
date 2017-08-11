.PHONY: dovecot-dsync-stop
dovecot-dsync-stop:
	kubectl --context="gke_pluto-167312_europe-west1-b_europe-west1-b" scale --replicas=0 -f k8s/dovecot-dsync/backend-01-eu/deployment.yml
	kubectl --context="gke_pluto-167312_europe-west1-b_europe-west1-b" scale --replicas=0 -f k8s/dovecot-dsync/backend-02-eu/deployment.yml
	kubectl --context="gke_pluto-167312_europe-west1-b_europe-west1-b" scale --replicas=0 -f k8s/dovecot-dsync/backend-03-eu/deployment.yml
	kubectl --context="gke_pluto-167312_europe-west1-b_europe-west1-b" scale --replicas=0 -f k8s/dovecot-dsync/proxy/deployment.yml
	kubectl --context="gke_pluto-167312_europe-west1-b_europe-west1-b" delete --ignore-not-found=true -f k8s/dovecot-dsync/backend-01-eu/pvc.yml
	kubectl --context="gke_pluto-167312_europe-west1-b_europe-west1-b" delete --ignore-not-found=true -f k8s/dovecot-dsync/backend-02-eu/pvc.yml
	kubectl --context="gke_pluto-167312_europe-west1-b_europe-west1-b" delete --ignore-not-found=true -f k8s/dovecot-dsync/backend-03-eu/pvc.yml
	kubectl --context="gke_pluto-167312_us-east1-b_us-east1-b" scale --replicas=0 -f k8s/dovecot-dsync/backend-01-us/deployment.yml
	kubectl --context="gke_pluto-167312_us-east1-b_us-east1-b" scale --replicas=0 -f k8s/dovecot-dsync/backend-02-us/deployment.yml
	kubectl --context="gke_pluto-167312_us-east1-b_us-east1-b" scale --replicas=0 -f k8s/dovecot-dsync/backend-03-us/deployment.yml
	kubectl --context="gke_pluto-167312_us-east1-b_us-east1-b" scale --replicas=0 -f k8s/dovecot-dsync/proxy/deployment.yml
	kubectl --context="gke_pluto-167312_us-east1-b_us-east1-b" delete --ignore-not-found=true -f k8s/dovecot-dsync/backend-01-us/pvc.yml
	kubectl --context="gke_pluto-167312_us-east1-b_us-east1-b" delete --ignore-not-found=true -f k8s/dovecot-dsync/backend-02-us/pvc.yml
	kubectl --context="gke_pluto-167312_us-east1-b_us-east1-b" delete --ignore-not-found=true -f k8s/dovecot-dsync/backend-03-us/pvc.yml

.PHONY: dovecot-dsync-start
dovecot-dsync-start:
	kubectl --context="gke_pluto-167312_europe-west1-b_europe-west1-b" apply -f k8s/dovecot-dsync/backend-01-eu/pvc.yml
	kubectl --context="gke_pluto-167312_europe-west1-b_europe-west1-b" apply -f k8s/dovecot-dsync/backend-02-eu/pvc.yml
	kubectl --context="gke_pluto-167312_europe-west1-b_europe-west1-b" apply -f k8s/dovecot-dsync/backend-03-eu/pvc.yml
	kubectl --context="gke_pluto-167312_us-east1-b_us-east1-b" apply -f k8s/dovecot-dsync/backend-01-us/pvc.yml
	kubectl --context="gke_pluto-167312_us-east1-b_us-east1-b" apply -f k8s/dovecot-dsync/backend-02-us/pvc.yml
	kubectl --context="gke_pluto-167312_us-east1-b_us-east1-b" apply -f k8s/dovecot-dsync/backend-03-us/pvc.yml
	kubectl --context="gke_pluto-167312_europe-west1-b_europe-west1-b" scale --replicas=1 -f k8s/dovecot-dsync/backend-01-eu/deployment.yml
	kubectl --context="gke_pluto-167312_europe-west1-b_europe-west1-b" scale --replicas=1 -f k8s/dovecot-dsync/backend-02-eu/deployment.yml
	kubectl --context="gke_pluto-167312_europe-west1-b_europe-west1-b" scale --replicas=1 -f k8s/dovecot-dsync/backend-03-eu/deployment.yml
	kubectl --context="gke_pluto-167312_europe-west1-b_europe-west1-b" scale --replicas=1 -f k8s/dovecot-dsync/proxy/deployment.yml
	kubectl --context="gke_pluto-167312_us-east1-b_us-east1-b" scale --replicas=1 -f k8s/dovecot-dsync/backend-01-us/deployment.yml
	kubectl --context="gke_pluto-167312_us-east1-b_us-east1-b" scale --replicas=1 -f k8s/dovecot-dsync/backend-02-us/deployment.yml
	kubectl --context="gke_pluto-167312_us-east1-b_us-east1-b" scale --replicas=1 -f k8s/dovecot-dsync/backend-03-us/deployment.yml
	kubectl --context="gke_pluto-167312_us-east1-b_us-east1-b" scale --replicas=1 -f k8s/dovecot-dsync/proxy/deployment.yml

.PHONY: dovecot-simple-stop
dovecot-simple-stop:
	kubectl --context="gke_pluto-167312_europe-west1-b_europe-west1-b" scale --replicas=0 -f k8s/dovecot-simple/backend-1/deployment.yml
	kubectl --context="gke_pluto-167312_europe-west1-b_europe-west1-b" scale --replicas=0 -f k8s/dovecot-simple/backend-2/deployment.yml
	kubectl --context="gke_pluto-167312_europe-west1-b_europe-west1-b" scale --replicas=0 -f k8s/dovecot-simple/backend-3/deployment.yml
	kubectl --context="gke_pluto-167312_europe-west1-b_europe-west1-b" scale --replicas=0 -f k8s/dovecot-simple/proxy/deployment.yml
	kubectl --context="gke_pluto-167312_europe-west1-b_europe-west1-b" delete --ignore-not-found=true -f k8s/dovecot-simple/backend-1/pvc.yml
	kubectl --context="gke_pluto-167312_europe-west1-b_europe-west1-b" delete --ignore-not-found=true -f k8s/dovecot-simple/backend-2/pvc.yml
	kubectl --context="gke_pluto-167312_europe-west1-b_europe-west1-b" delete --ignore-not-found=true -f k8s/dovecot-simple/backend-3/pvc.yml

.PHONY: dovecot-simple-start
dovecot-simple-start:
	kubectl --context="gke_pluto-167312_europe-west1-b_europe-west1-b" apply -f k8s/dovecot-simple/backend-1/pvc.yml
	kubectl --context="gke_pluto-167312_europe-west1-b_europe-west1-b" apply -f k8s/dovecot-simple/backend-2/pvc.yml
	kubectl --context="gke_pluto-167312_europe-west1-b_europe-west1-b" apply -f k8s/dovecot-simple/backend-3/pvc.yml
	kubectl --context="gke_pluto-167312_europe-west1-b_europe-west1-b" scale --replicas=1 -f k8s/dovecot-simple/backend-1/deployment.yml
	kubectl --context="gke_pluto-167312_europe-west1-b_europe-west1-b" scale --replicas=1 -f k8s/dovecot-simple/backend-2/deployment.yml
	kubectl --context="gke_pluto-167312_europe-west1-b_europe-west1-b" scale --replicas=1 -f k8s/dovecot-simple/backend-3/deployment.yml
	kubectl --context="gke_pluto-167312_europe-west1-b_europe-west1-b" scale --replicas=1 -f k8s/dovecot-simple/proxy/deployment.yml

.PHONY: benchmark-simple-dovecot
benchmark-simple-dovecot:
	kubectl apply -f k8s/benchmark/dovecot-users.yml
	kubectl delete --ignore-not-found=true -f k8s/benchmark/dovecot-simple/job.yml
	kubectl apply -f k8s/benchmark/dovecot-simple/config.yml
	kubectl apply -f k8s/benchmark/dovecot-simple/job.yml

.PHONY: benchmark-dsync-dovecot-eu
benchmark-dsync-dovecot-eu:
	kubectl apply -f k8s/benchmark/dovecot-users.yml
	kubectl delete --ignore-not-found=true -f k8s/benchmark/dovecot-dsync-eu/job.yml
	kubectl apply -f k8s/benchmark/dovecot-dsync-eu/config.yml
	kubectl apply -f k8s/benchmark/dovecot-dsync-eu/job.yml

.PHONY: benchmark-dsync-dovecot-us
benchmark-dsync-dovecot-us:
	kubectl apply -f k8s/benchmark/dovecot-users.yml
	kubectl delete --ignore-not-found=true -f k8s/benchmark/dovecot-dsync-us/job.yml
	kubectl apply -f k8s/benchmark/dovecot-dsync-us/config.yml
	kubectl apply -f k8s/benchmark/dovecot-dsync-us/job.yml

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
