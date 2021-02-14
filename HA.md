### Load balancer should be working fine
```bash
sudo kubeadm init --control-plane-endpoint "k8s.proxy.1:6443" --upload-certs --pod-network-cidr=192.168.0.0/24 --> on the first master.node
```

### Network 
```bash
#try https://docs.projectcalico.org/getting-started/kubernetes/quickstart
## OR do below
kubectl create -f https://docs.projectcalico.org/v3.14/manifests/calico.yaml
# OR based on your choice or install flannel
kubectl apply -f https://raw.githubusercontent.com/coreos/flannel/master/Documentation/kube-flannel.yaml
# if flannel pods or calico pods stuck in failure to start or other pre run status execute 
#below command replace name with the node and podcidr with your network 
kubectl patch node [name] -p '{"spec":{"podCIDR":"[PodCidr]"}}'
```
#### Note: update hostnames on all nodes
#### Note: Add Hosts map to /etc/hosts in all nodes including loadbalalancer node example is below
```yaml
192.168.0.107   k8s.proxy.1
192.168.0.108   k8s.master.1
192.168.0.109   k8s.master.2 
192.168.0.110   k8s.master.3 
192.168.0.111   k8s.worker.1
192.168.0.112   k8s.worker.2
192.168.0.113   k8s.worker.3 
192.168.0.114   k8s.worker.4
192.168.0.115   k8s.worker.5
192.168.0.116   k8s.worker.6
192.168.0.101   k8s.worker.7
192.168.0.125   k8s.nfs.server

```
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
