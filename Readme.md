```shell
kubeadm init
```
```shell
kubectl apply -f curl https://raw.githubusercontent.com/projectcalico/calico/v3.25.0/manifests/calico.yaml -O
```


```shell
vim /etc/containerd/config.toml 

[plugins."io.containerd.grpc.v1.cri".containerd.runtimes.runc.options]
dotorh
   SystemdCgroup = true
bolgono
