# Use cloudinit custom scipts in proxmox


## Prerequisits
Enable snippets in the gui
Datacenter -> Storage -> local -> edit -> add snippets to content

## Use custom script

1. Copy custom script to hosts snippets folder
``` bash
scp basics.yml <user>@<hostname>:/var/lib/vz/snippets

```

2.  Add custom script to terraform
``` terraform
cicustom = "vendor=local:snippets/cloud_init.yml"

```

## References 

[https://pve.proxmox.com/wiki/Storage:_Directory]()
[https://gist.github.com/aw/ce460c2100163c38734a83e09ac0439a]()
[https://yetiops.net/posts/proxmox-terraform-cloudinit-saltstack-prometheus/]()
[https://github.com/Telmate/terraform-provider-proxmox/issues/407]()
