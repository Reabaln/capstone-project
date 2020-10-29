.PHONY: secrets resource user

up: secrets rbac build-tasks deploy-test e2e-test deploy-prod
tkn-cli:
	sudo apt update
	sudo apt install -y gnupg
	sudo apt-key adv --keyserver keyserver.ubuntu.com --recv-keys 3EFE0E0A2F2F60AA
	echo "deb http://ppa.launchpad.net/tektoncd/cli/ubuntu eoan main"|sudo tee /etc/apt/sources.list.d/tektoncd-ubuntu-cli.list
	sudo apt update && sudo apt install -y tektoncd-cli

secrets:
	kubectl apply -f ./resources/docker-secret.yaml -f ./resources/github-secret.yaml -n test
build-tasks:
	kubectl apply -f ./tasks/build-task.yaml -f ./tasks/release-task.yaml -f ./tasks/git-clone.yaml -f ./tasks/e2e-task.yaml -n test
	kubectl apply -f ./tasks/release-to-prod.yaml -n test
rbac:
	kubectl apply -f ./resources/rbac/service-account.yaml -n test
	kubectl apply -f ./resources/rbac/clusterrole.yaml -n test
	kubectl apply -f ./resources/rbac/clusterrole-binding.yaml -n test
	
resource:
	kubectl apply -f ./pipelines/resource.yaml -n test

deploy-test: front-end carts payment shipping queue-master orders user catalogue

carts: 
	kubectl apply -f ./pipelines/ci-pipelines/carts-ci/carts-pvc.yaml -n test
	kubectl apply -f ./pipelines/ci-pipelines/carts-ci/carts-pipeline.yaml -n test
	kubectl apply -f ./pipelines/ci-pipelines/carts-ci/carts-runner.yaml -n test
payment: 
	kubectl apply -f ./pipelines/ci-pipelines/payment-ci/payment-pvc.yaml -n test
	kubectl apply -f ./pipelines/ci-pipelines/payment-ci/payment-pipeline.yaml -n test
	kubectl apply -f ./pipelines/ci-pipelines/payment-ci/payment-runner.yaml -n test

shipping: 
	kubectl apply -f ./pipelines/ci-pipelines/shipping-ci/shipping-pvc.yaml -n test
	kubectl apply -f ./pipelines/ci-pipelines/shipping-ci/shipping-pipeline.yaml -n test
	kubectl apply -f ./pipelines/ci-pipelines/shipping-ci/shipping-runner.yaml -n test

front-end: 
	kubectl apply -f ./pipelines/ci-pipelines/front-end-ci/front-end-pvc.yaml -n test
	kubectl apply -f ./pipelines/ci-pipelines/front-end-ci/front-end-pipeline.yaml -n test
	kubectl apply -f ./pipelines/ci-pipelines/front-end-ci/front-end-runner.yaml -n test

user: 
	kubectl apply -f ./pipelines/ci-pipelines/user-ci/user-pvc.yaml -n test
	kubectl apply -f ./pipelines/ci-pipelines/user-ci/user-pipeline.yaml -n test
	kubectl apply -f ./pipelines/ci-pipelines/user-ci/user-runner.yaml -n test

orders: 
	kubectl apply -f ./pipelines/ci-pipelines/orders-ci/orders-pvc.yaml -n test
	kubectl apply -f ./pipelines/ci-pipelines/orders-ci/orders-pipeline.yaml -n test
	kubectl apply -f ./pipelines/ci-pipelines/orders-ci/orders-runner.yaml -n test

catalogue: 
	kubectl apply -f ./pipelines/ci-pipelines/catalogue-ci/catalogue-pvc.yaml -n test
	kubectl apply -f ./pipelines/ci-pipelines/catalogue-ci/catalogue-pipeline.yaml -n test
	kubectl apply -f ./pipelines/ci-pipelines/catalogue-ci/catalogue-runner.yaml -n test

queue-master: 
	kubectl apply -f ./pipelines/ci-pipelines/queue-ci/queue-master-pvc.yaml -n test
	kubectl apply -f ./pipelines/ci-pipelines/queue-ci/queue-master-pipeline.yaml -n test
	kubectl apply -f ./pipelines/ci-pipelines/queue-ci/queue-master-runner.yaml -n test
e2e-test:
	./deploy-condition.sh
	kubectl apply -f ./pipelines/test-e2e/test-e2e-pvc.yaml -n test 
	kubectl apply -f ./pipelines/test-e2e/test-e2e-pipeline.yaml -n test
	kubectl apply -f ./pipelines/test-e2e/test-e2e-runner.yaml -n test 
deploy-prod:
	kubectl apply -f ./pipelines/production/deploy-prod-pvc.yaml -n prod
	kubectl apply -f ./pipelines/production/deploy-to-prod-pipeline.yaml -n prod
	kubectl apply -f ./pipelines/production/deploy-to-prod-runner.yaml -n prod

