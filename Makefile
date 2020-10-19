.PHONY: up down

up: deploy-app

deploy-app:
	    kubectl apply -f ./deploy/k8s/sockshop-app.yaml 
	    kubectl apply -f ./deploy/k8s/ingress.yaml 
