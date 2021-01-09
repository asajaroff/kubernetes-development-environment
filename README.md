# Local Kubernetes Environment
A fully reproducible local development environment that's aimed to simulate one running on a Cloud Provider with production features.

## Introduction
This repo aims to serve as a guide for developing locally with a Kubernets environment.

### Why Minikube?
[Minikube](https://minikube.sigs.k8s.io) is the older and more mature of the Kubernetes distributions for a local environment. 
The more important features are highlighted here:
* It runs on any OS which provides Virtualization Features.
* It's developer friendly
* It allows for complex objects (such as Ingresses and Certificates) through addons.
* Multi node clusters are [supported](https://minikube.sigs.k8s.io/docs/tutorials/multi_node/), but optional.
* Supports most of the [container runtimes](https://developers.redhat.com/blog/2018/02/22/container-terminology-practical-introduction/#h.6yt1ex5wfo55)
* No need to run a container engine daemon on the host machine. Container CLI running locally can be configured to connect to the Container Engine running on the guest (by default Docker engine)

### Why not K3S?
[K3S](https://k3s.io/) is a Kubernetes distribution developed by Rancher which aims for a small footprint, and implements a couple of changes to accomplish this.
* It replaces etcd for sqlite3
* Optimized for ARM architectures

### Why not something else?
I like minikube ;-)

## Installation
### Pre Requisites
A supported driver (can be a VM runtime or a container based one). 
A list of supported drivers can be found [here](https://minikube.sigs.k8s.io/docs/drivers/).
### Linux
```
curl -LO https://storage.googleapis.com/minikube/releases/latest/minikube-linux-amd64
sudo install minikube-linux-amd64 /usr/local/bin/minikube
```
### Mac
```
brew install minikube
```
### Windows
```bash
# if Windows Package Manager is available
winget install minikube
# If Chocolatey Package Manager is available
choco install minikube
```
## Configuration
You can either choose run minikube as is, or use [my setup](docs/config.md) or define your own.
```bash
make config
```

or define your own custom configuration, as shown below:
```bash
minikube config set cpus 2
minikube config set memory 2000
minikube config set kubernetes-version ${K8S_VERSION}
minikube config set container-runtime  ${RUNTIME}
```

## 

## Creating a basic cluster
```
minikube start
```

## Creating a more complex cluster
This is a more complex example with a multi node setup running containerd and calico:
```bash
minikube start -p ${PROFILE} \
  		--nodes ${NODES} \
		--kubernetes-version ${K8S_VERSION} \ # In the form v1.20.0
		--cni ${CNI} \
		--delete-on-failure true \
		--addons ingress storage-provisioner default-storageclass
minikube addons enable ingress
```

## Deploying apps
Helm based installs are recommended.