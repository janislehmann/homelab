
# Create Cloud-init template in Proxmox

## Instructions

SSH into Proxmox host

Download Ubuntu (replace with the url of the one you chose from above)

``` bash
wget https://cloud-images.ubuntu.com/noble/current/noble-server-cloudimg-amd64.img
```

Create a new virtual machine

``` bash
qm create 8000 --memory 2048 --core 2 --name ubuntu-cloud --net0 virtio,bridge=vmbr0
```

Import the downloaded Ubuntu disk to local storage (Change local to the storage of your choice)
``` bash
qm disk import 8000 noble-server-cloudimg-amd64.img local
```

Attach the new disk to the vm as a scsi drive on the scsi controller (Change local to the storage of your choice)
``` bash
qm set 8000 --scsihw virtio-scsi-pci --scsi0 local:vm-8000-disk-0
```

Add cloud init drive ((Change local to the storage of your choice)
``` bash
qm set 8000 --ide2 local:cloudinit
```

Make the cloud init drive bootable and restrict BIOS to boot from disk only
``` bash
qm set 8000 --boot c --bootdisk scsi0
```

Add serial console
``` bash
qm set 8000 --serial0 socket --vga serial0
```

DO NOT START YOUR VM!!

Configure Cloud-init in the Proxmox webUI (User, password, ssh-token...)


Create template.
``` bash
qm template 8000
```

Clone template.
``` bash
qm clone 8000 135 --name yoshi --full
```

[source](https://technotim.live/posts/cloud-init-cloud-image/)