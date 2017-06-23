#!/bin/bash

set -e
set -x

kubectl create secret generic internal-distributor-cert.pem --from-file secrets/internal-distributor-cert.pem
kubectl create secret generic internal-distributor-key.pem --from-file secrets/internal-distributor-key.pem
kubectl create secret generic internal-storage-cert.pem --from-file secrets/internal-storage-cert.pem
kubectl create secret generic internal-storage-key.pem --from-file secrets/internal-storage-key.pem
kubectl create secret generic internal-worker-1-cert.pem --from-file secrets/internal-worker-1-cert.pem
kubectl create secret generic internal-worker-1-key.pem --from-file secrets/internal-worker-1-key.pem
kubectl create secret generic public-distributor-cert.pem --from-file secrets/public-distributor-cert.pem
kubectl create secret generic public-distributor-key.pem --from-file secrets/public-distributor-key.pem
kubectl create secret generic root-cert.pem --from-file secrets/root-cert.pem
kubectl create secret generic root-key.pem --from-file secrets/root-key.pem
