#!/bin/bash

set -o errexit  # Exit with error on non-zero exit codes
set -o pipefail # Check the exit code of *all* commands in a pipeline
set -o nounset  # Error if accessing an unbound variable
set -x          # Print each command as it is run

sed "s/\$PROJECT_ID/${PROJECT_ID}/g" deploy/provider-gcp-plugin.yaml.tmpl | kubectl apply -f -
kubectl apply -f deploy/workload-id-binding.yaml
