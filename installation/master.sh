#!/bin/bash
apt update && apt install -y kubeadm kubelet kubectl &&
kubeadm reset