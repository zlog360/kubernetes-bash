#!/bin/bash
source $(pwd)/installation/env.sh
ufw disable &&
swapoff -a; sed -i '/swap/d' /etc/fstab &&
customeCat=$(cat >>/etc/sysctl.d/kubernetes.conf <<EOF
    net.bridge.bridge-nf-call-ip6tables = 1
    net.bridge.bridge-nf-call-iptables = 1 
EOF
)
match="net.bridge.bridge-nf-call-ip6tables = 1"
if ! grep -q $match "$File"; then
  echo -e "$customeCat"
fi
sysctl --system &&
curl -s https://packages.cloud.google.com/apt/doc/apt-key.gpg | apt-key add - &&
echo "deb https://apt.kubernetes.io/ kubernetes-xenial main" > /etc/apt/sources.list.d/kubernetes.list