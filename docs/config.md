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
If we're opting to use a container engine instead of a 
### Container Runtime
Defaults to [docker's container runtime](https://www.docker.com/products/container-runtime), but a few options are available:
* `cri-o`
* `containerd`
* `dockerd`

```bash
minikube config set container-runtime containerd
```

## Addons
Minikube provides a few addons 
```bash
|-----------------------------|----------|--------------|
|         ADDON NAME          | PROFILE  |    STATUS    |
|-----------------------------|----------|--------------|
| ambassador                  | minikube | disabled     |
| csi-hostpath-driver         | minikube | disabled     |
| dashboard                   | minikube | disabled     |
| default-storageclass        | minikube | enabled ✅   |
| efk                         | minikube | disabled     |
| freshpod                    | minikube | disabled     |
| gcp-auth                    | minikube | disabled     |
| gvisor                      | minikube | disabled     |
| helm-tiller                 | minikube | disabled     |
| ingress                     | minikube | disabled     |
| ingress-dns                 | minikube | disabled     |
| istio                       | minikube | disabled     |
| istio-provisioner           | minikube | disabled     |
| kubevirt                    | minikube | disabled     |
| logviewer                   | minikube | disabled     |
| metallb                     | minikube | disabled     |
| metrics-server              | minikube | disabled     |
| nvidia-driver-installer     | minikube | disabled     |
| nvidia-gpu-device-plugin    | minikube | disabled     |
| olm                         | minikube | disabled     |
| pod-security-policy         | minikube | disabled     |
| registry                    | minikube | disabled     |
| registry-aliases            | minikube | disabled     |
| registry-creds              | minikube | disabled     |
| storage-provisioner         | minikube | enabled ✅   |
| storage-provisioner-gluster | minikube | disabled     |
| volumesnapshots             | minikube | disabled     |
|-----------------------------|----------|--------------|
```