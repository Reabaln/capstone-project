.PHONY: up down


up: deploy-app

deploy-app:
	    kubectl apply -f ./deploy/k8s/sockshop-complete/sockshop-app.yaml -n test
	    kubectl apply -f ./deploy/k8s/manifests/ingress.yaml -n test
