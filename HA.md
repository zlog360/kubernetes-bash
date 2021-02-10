### Load balancer should be working fine
```bash
sudo kubeadm init --control-plane-endpoint "k8s.proxy.1:6443" --upload-certs --pod-network-cidr=192.168.0.0/24 --> on the first master.node
```

### Network 
```bash
kubectl create -f https://docs.projectcalico.org/v3.14/manifests/calico.yaml
```
#### Note: update hostnames on all nodes
### Joining Master Nodes
```bash
kubeadm join proxy:6443 --token Token \
    --discovery-token-ca-cert-hash Some String \
    --control-plane --certificate-key Certificate Key
```

### Joining Worker Nodes

```bash
kubeadm join k8s.proxy.1:6443 --token sometoken --discovery-token-ca-cert-hash sha256:somehash
```
