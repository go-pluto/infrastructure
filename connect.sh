#!/bin/bash

set -e

CLUSTERS='europe-west1-b europe-west2-b europe-west3-b us-east1-b'
HOST_CLUSTER='europe-west1-b'
GCP_PROJECT=$(gcloud config list --format='value(core.project)')

echo "Starting to setup clusters for project ${GCP_PROJECT}"

for cluster in ${CLUSTERS}; do
	gcloud container clusters get-credentials ${cluster} --zone ${cluster}
done

for cluster in ${CLUSTERS}; do
	kubectl config set-context ${cluster} \
		--cluster=gke_${GCP_PROJECT}_${cluster}_${cluster} \
		--user=gke_${GCP_PROJECT}_${cluster}_${cluster}
done
