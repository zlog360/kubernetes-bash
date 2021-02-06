#### 1) Assign Static Ip to work Node or Master Node
```yaml
# /etc/network/interfaces in Ubuntu 16
auto ens3
iface ens3 inet static
address 192.168.0.116
netmask 255.255.255.0
network 192.168.0.1
broadcast 192.168.0.255
gateway 192.168.0.1
dns-nameservers 192.168.0.1

```
#### 2) Also Change the hostname of the Machine in /etc/hostname & /etc/hosts file
#### 3) Map Hostnames in the Machine itself and Admin Machine as well
##### example:
```yaml
192.168.0.107   k8s.proxy.1
192.168.0.102   k8s.proxy.2
192.168.0.103   k8s.proxy.3
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
