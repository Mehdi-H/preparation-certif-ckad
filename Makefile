# This is an auto documented Makefile. For more information see the following article
# @see http://marmelab.com/blog/2016/02/29/auto-documented-makefile.html

SHELL := /bin/bash
.SHELLFLAGS = -ec
.SILENT:
MAKEFLAGS += --silent
.ONESHELL:

.EXPORT_ALL_VARIABLES:

.DEFAULT_GOAL: help

.PHONY: help ## 🛟 to display this prompts. This will list all available targets with their documentation
help:
	{
	echo "❓ Use \`make <target>' where <target> is one of 👇"
	grep -E '^\.PHONY: [a-zA-Z0-9_-]+ .*?##' $(MAKEFILE_LIST) | sort | \
		awk 'BEGIN {FS = "(: |##)"}; {printf "\033[36m%-30s\033[0m %s\n", $$2, $$3}'
	echo "Tips 💡"
	echo "	- use tab for auto-completion"
	echo "	- use the dry run option '-n' to show what make is attempting to do. example: 'make -n backing-services-start'"
	} | tee /dev/tty | freeze -c full -o docs/available-commands.png

.PHONY: minikube-start  ## ▶️ to launch minikube for local tests
minikube-start:
	minikube start

.PHONY: minikube-dashboard  ## 📊 to launch the minikube dashboard for better viz
minikube-dashboard:
	minikube dashboard

.PHONY: simple-job  ## ⚙️ to run a simple job
simple-job:
	kubectl delete job pi || true
	kubectl apply -f jobs-and-cronjobs/simple_job.yaml
	kubectl get jobs --watch

.PHONY: clean-all  ## to clean up the minikube cluster pods, services, deployments, ...
clean-all:
	kubectl delete deployments --all
	kubectl delete services --all
	kubectl delete pods --all
	kubectl delete daemonset --all

