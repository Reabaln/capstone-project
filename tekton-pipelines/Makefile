
tkn-cli:
	sudo apt update
	sudo apt install -y gnupg
	sudo apt-key adv --keyserver keyserver.ubuntu.com --recv-keys 3EFE0E0A2F2F60AA
	echo "deb http://ppa.launchpad.net/tektoncd/cli/ubuntu eoan main"|sudo tee /etc/apt/sources.list.d/tektoncd-ubuntu-cli.list
	sudo apt update && sudo apt install -y tektoncd-cli

secret:
	kubectl apply -f ./resources/rbac/secrets.yaml -n test
build-task:
	kubectl apply -f ./tasks/build-task.yaml -n test
pipeline:
	kubectl apply -f ./pipelines/ci-pipelines/front-end-ci/ci-pipeline.yaml -n test 
front-end-runner: 
	kubectl apply -f ./pipelines/ci-pipelines/front-end-ci/pipeline-runner.yaml -n test 
rbac:
	kubectl apply -f ./resources/rbac/tekton-sa.yaml -n test
	kubectl apply -f ./resources/rbac/clusterrole.yaml -n test
	kubectl apply -f ./resources/rbac/clusterrole-binding.yaml -n test
	
resource:
	kubectl apply -f ./pipelines/ci-pipelines/front-end-ci/resource.yaml -n test
