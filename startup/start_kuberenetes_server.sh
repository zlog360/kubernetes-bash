#!/bin/bash
echo $MASTER_IP:$POD_NET_CIDR 
kubeadm init --apiserver-advertise-address=$MASTER_IP --pod-network-cidr=$POD_NET_CIDR  --ignore-preflight-errors=all --v=5 &&
mkdir -p $HOME/.kube &&
sudo rm -r $HOME/.kube/config &&
sudo cp -i /etc/kubernetes/admin.conf $HOME/.kube/config &&
sudo chown $USER:$USER $HOME/.kube/config &&
kubectl --kubeconfig=/etc/kubernetes/admin.conf create -f https://docs.projectcalico.org/v3.14/manifests/calico.yaml