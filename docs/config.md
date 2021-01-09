# Configuration
## Virtual Machine Driver
For Linux KVM2 is recommended when planning to use with VMs:
```bash
minikube config set driver kvm2
```
Mac
```bash
minikube config set driver hyperkit
```
### Memory and CPU
Virtual machine resources can be configured as follows:
```bash
minikube config set cpus 4
minikube config set memory 4000
```

[//]: # (Averiguar bien que es el driver y como interactua con minikube y las VMs)

### Driver 
### Container Runtime
Defaults to [docker's container runtime](https://www.docker.com/products/container-runtime), but a few options are available:
* `cri-o`
* `containerd`
* `dockerd`

```bash
minikube config set container-runtime containerd
```

## Addons
Minikube provides two addons by default:
* `default-storageclass`
* `storage-provisioner`

If you create your cluster using `make create`, then you've already got Ingress support. If you have created your cluster manually and you want to enable Ingress you must run:
```bash
minikube addons enable ingress
```
To list all available addons, run `minikube addons list`
```
$ minikube addons list -p k8s-dev-env -o json | jq -r '. |= keys'
[
  "ambassador",
  "csi-hostpath-driver",
  "dashboard",
  "default-storageclass",
  "efk",
  "freshpod",
  "gcp-auth",
  "gvisor",
  "helm-tiller",
  "ingress",
  "ingress-dns",
  "istio",
  "istio-provisioner",
  "kubevirt",
  "logviewer",
  "metallb",
  "metrics-server",
  "nvidia-driver-installer",
  "nvidia-gpu-device-plugin",
  "olm",
  "pod-security-policy",
  "registry",
  "registry-aliases",
  "registry-creds",
  "storage-provisioner",
  "storage-provisioner-gluster",
  "volumesnapshots"
]
```