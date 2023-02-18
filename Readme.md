```shell
kubeadm init
```
```shell
kubectl apply -f https://docs.projectcalico.org/manifests/calico.yaml
```


```shell
vim /etc/containerd/config.toml 

[plugins."io.containerd.grpc.v1.cri".containerd.runtimes.runc.options]
dotorh
   SystemdCgroup = true
bolgono
