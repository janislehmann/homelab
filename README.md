# homelab

## helpfull commands

Copy k8s config file to local host
 ``` bash
 scp -i ~/.ssh/homelab_key <user>@192.168.0.20:/etc/rancher/k3s/k3s.yaml ~/.kube/config
 ```