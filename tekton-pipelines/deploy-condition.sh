#!/bin/bash


# while [[ $(kubectl get pods -n test -o 'jsonpath={..status.conditions[?(@.type=="Ready")].status}') != "True" ]]; \
# do echo "waiting for all pods to be ready" && sleep 1; done





kubectl wait --for=condition=available --timeout=150s -n test --all deployments 
