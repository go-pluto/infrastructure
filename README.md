# infrastructure

Configs and infrastructure-related code for [pluto](https://github.com/go-pluto/pluto). We deploy pluto, Dovecot, benchmarking, monitoring, and metrics-related software in a hosted kubernetes cloud. Thus, the elements in this repository mostly revolve around service, deployment, and configuration of kubernetes components.

### Connect to clusters

Simply run `./connect.sh`.  
Before that ensure that you're connected to the right GCP project. `gcloud config list --format='value(core.project)'`.

Connect to the federation by merging `.kube/config` with the contents of `gopass pluto/gke/federation-kubeconfig`...  
Don't forget to run `kubectl config use-context federation` afterwards.