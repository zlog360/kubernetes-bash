### Command to Edit Coredns Map
```bash
kubectl edit configmap coredns -n kube-system
```

#### Hosts Data Example to be added in Coredns map
```yaml
hosts {
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
}

```
