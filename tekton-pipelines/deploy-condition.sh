#!/bin/bash


while [[ $(kubectl get pods -n test -l app=carts-db  -o 'jsonpath={..status.conditions[?(@.type=="Ready")].status}') != "True" ]]; \
 do echo "waiting for carts pod to be ready" && sleep 10; done
while [[ $(kubectl get pods -n test -l app=carts  -o 'jsonpath={..status.conditions[?(@.type=="Ready")].status}') != "True" ]]; \
 do echo "waiting for all pods to be ready carrrts" && sleep 10; done
while [[ $(kubectl get pods -n test -l app=catalogue-db -o 'jsonpath={..status.conditions[?(@.type=="Ready")].status}') != "True" ]]; \
 do echo "waiting for all pods to be ready catalog" && sleep 10; done
while [[ $(kubectl get pods -n test -l name=front-end  -o 'jsonpath={..status.conditions[?(@.type=="Ready")].status}') != "True" ]]; \
 do echo "waiting for all pods to be ready frontend" && sleep 10; done
while [[ $(kubectl get pods -n test -l app=orders-db -o 'jsonpath={..status.conditions[?(@.type=="Ready")].status}') != "True" ]]; \
 do echo "waiting for all pods to be readyorders " && sleep 10; done
while [[ $(kubectl get pods -n test -l app=orders -o 'jsonpath={..status.conditions[?(@.type=="Ready")].status}') != "True" ]]; \
 do echo "waiting for all pods to be ready orders" && sleep 10; done
while [[ $(kubectl get pods -n test -l name=payment -o 'jsonpath={..status.conditions[?(@.type=="Ready")].status}') != "True" ]]; \
 do echo "waiting for all pods to be ready payment" && sleep 10; done
while [[ $(kubectl get pods -n test -l app=queue-master -o 'jsonpath={..status.conditions[?(@.type=="Ready")].status}') != "True" ]]; \
 do echo "waiting for all pods to be readytest " && sleep 10; done
while [[ $(kubectl get pods -n test -l app=rabbitmq -o 'jsonpath={..status.conditions[?(@.type=="Ready")].status}') != "True" ]]; \
 do echo "waiting for all pods to be readytt" && sleep 10; done
while [[ $(kubectl get pods -n test -l app=shipping -o 'jsonpath={..status.conditions[?(@.type=="Ready")].status}') != "True" ]]; \
 do echo "waiting for all pods to be readyttt" && sleep 10; done
while [[ $(kubectl get pods -n test -l name=user-db -o 'jsonpath={..status.conditions[?(@.type=="Ready")].status}') != "True" ]]; \
 do echo "waiting for all pods to be readyyyy" && sleep 10; done
while [[ $(kubectl get pods -n test -l app=user -o 'jsonpath={..status.conditions[?(@.type=="Ready")].status}') != "True" ]]; \
 do echo "waiting for all pods to be readyyy" && sleep 10; done


echo "all of the sockshop pods have been started"



