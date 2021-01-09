# Variables
#
PROFILE		= k8s-dev-env
K8S_VERSION	= v1.17.10
DRIVER 		= hyperkit
RUNTIME		= containerd
NODES		= 2
CNI			= calico # Valid options: auto, bridge, calico, cilium, flannel, kindnet, or path to a CNI manifest (default: auto)


# Functions
#
.PHONY: create global-config start stop delete

global-config:
	minikube config unset driver
	minikube config set driver ${DRIVER}
	minikube config set cpus 2 
	minikube config set memory 2000 
	minikube config set kubernetes-version ${K8S_VERSION}
	minikube config set container-runtime  ${RUNTIME}

create:
	@minikube start -p ${PROFILE} \
  		--nodes ${NODES} \
		--kubernetes-version ${K8S_VERSION} \
		--cni ${CNI} \
		--delete-on-failure true \
		--addons ingress storage-provisioner default-storageclass \
	@minikube addons enable ingress

delete:
	minikube delete -p ${PROFILE}

start:
	minikube start -p ${PROFILE}

stop:
	minikube stop -p ${PROFILE}

