### Adding your own Nameservers for different services resolutions
1) edit the coredns config map and add exa
```yaml
apiVersion: v1
data:
  Corefile: |
    .:53 {
        errors
        health
        ready
        kubernetes cluster.local in-addr.arpa ip6.arpa {
           pods insecure
           fallthrough in-addr.arpa ip6.arpa       
           ttl 30 
        }
        prometheus :9153
        forward . /etc/resolv.conf {
          max_concurrent 1000
        }
        loop
        reload
        loadbalance
        cache 30
    }
    zlog360.com.:53 {
      errors
      log
      prometheus :9153
      loadbalance
      forward . 192.168.0.97
      cache 30
    }
    k8s.:53 {
      errors
      log
      prometheus :9153
      loadbalance
      forward . 192.168.0.97
      cache 30
    }
kind: ConfigMap
metadata:
  creationTimestamp: "2021-02-24T11:25:12Z"
  managedFields:
  - apiVersion: v1
    fieldsType: FieldsV1
    fieldsV1:
      f:data: {}
    manager: kubeadm
    operation: Update
    time: "2021-02-24T11:25:12Z"
  - apiVersion: v1
    fieldsType: FieldsV1
    fieldsV1:
      f:data:
        f:Corefile: {}
    manager: kubectl-edit
    operation: Update
    time: "2021-02-25T06:11:44Z"
  name: coredns
  namespace: kube-system
  resourceVersion: "5195064"
  selfLink: /api/v1/namespaces/kube-system/configmaps/coredns
  uid: 1c85a9e6-2a40-43d3-acc2-db66fa9e0315

```
2) either edit coredns map or create the new one but delete old one first
3) now delete the pods kubectl delete pod --namespace kube-system -l k8s-app=kube-dns
4) coredns pods will be deleted and the  created again
