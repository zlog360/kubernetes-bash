# kubernetes-bash
This repository includes basic kuberenetes cluster setup  
## Pre Installation Worker and Master both
1) install docker
2) create user which has is also the part of docker group
3) clone this repo
4) execute the following commands
```bash
$ chmod +x *.sh
$ chmod +x */*.sh
```
5) Create env.sh file in installation folder with the below content
```bash
export MASTER_IP=your_ip
export POD_NET_CIDR=ypur_pod_network
export USER=username
```

## Instructions Master
1) Execute run_install as the root user or with sudo priviliges
2) Then Execute ./startup/start_kuberenetes_server.sh with sudo priviliges 
3) Check if .kube folder exists in your home directory of the user if not
then execute below given script, if .kube exists and config are missing then just
copy the config file from etc.
```bash
$ mkdir -p $HOME/.kube
$ sudo cp -i /etc/kubernetes/admin.conf $HOME/.kube/config
$ sudo chown $USER:$USER $HOME/.kube/config
```
4) excute the following bash command the out put should be
```bash
$ kubectl get nodes
NAME        STATUS     ROLES    AGE     VERSION
hostname    Ready      master   3m28s   v1.19.3
```
## Admin Clinet
### Copy Admin Configs
1) scp $USER@$MASTER_IP:/home/$USER/.kube/config remote_config
2) now add the remote_config file to `KUBECONFIG` or pass it as a flag to kubectl however your prefer
3) execute the given script and compare the output
```bash
$ kubectl get nodes
NAME        STATUS     ROLES    AGE     VERSION
hostname    Ready      master   3m28s   v1.19.3
```
# Worker Installation
### Note: hostname must be unique in the cluster of nodes
1) Execute run_install_worker with sudo priviliges in the worker machine
2) Execute in master or Admin client node with sudo priviliges and copy the matching out put and run this in worker node
```bash
$ kubeadm token create --print-join-command
kubeadm join masterip:6443 --token somestring  --discovery-token-ca-cert-hash sha256:somestring
```
3) execute in master or Admin node you should see the following 
```bash
$ kubectl get nodes
NAME           STATUS     ROLES    AGE   VERSION
master-host    Ready     master   49m   v1.19.3
worker-host    Ready     <none>   21m   v1.19.3
```
# New User && Client Certificates
[Client Certifcate Guide](https://medium.com/better-programming/k8s-tips-give-access-to-your-clusterwith-a-client-certificate-dfb3b71a76fe)
#### TODOS
1) High Availibility Cluster Setup
2) multi-worker node setup from the admin node
3) Client Certifcates Management
