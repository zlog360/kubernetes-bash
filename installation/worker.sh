#!/bin/bash
apt update && apt install -y kubeadm kubelet kubectl &&
kubeadm reset &&
if [ -d $HOME/.kube ] 
then
    echo $HOME/.kube exists &&
    sudo rm -r $HOME/.kube/config 
else
    mkdir $HOME/.kube
fi
cd .kube &&
scp $USER@$MASTER_IP:.kube/config config
