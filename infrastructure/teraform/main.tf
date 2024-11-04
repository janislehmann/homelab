resource "proxmox_vm_qemu" "k3s_master" {
  count = length(local.k3s_master)
  name = local.k3s_master[count.index].name
  desc = "k3s master machine"
  pool        = "k3s"
  target_node = local.k3s_master[count.index].target_node
  clone       = "ubuntu-cloud"
  qemu_os     = "l26"
  os_type     = "cloud-init"
  sshkeys     = var.ssh_public_key
  agent       = 1
  ciuser      = var.local_user_name
  cipassword  = var.local_user_pass
  cores       = 2
  sockets     = 1
  vcpus       = 0
  cpu         = "host"
  memory      = 6144
  scsihw      = "virtio-scsi-pci"
  ipconfig0   = "ip=${local.k3s_master[count.index].ip}/24,gw=${local.gateway_ip}"
  nameserver  = local.dns
  vm_state    = "started"
  cicustom    = "vendor=local:snippets/ubuntu_basics.yml"

  disks {
    ide {
      ide3 {
        cloudinit {
          storage = "local-lvm"
        }
      }
    }
    scsi {
      scsi0 {
        disk {
          size    = "100G"
          storage = "local-lvm"
          discard = true
        }
      }
    }
  }

  network {
    model  = "virtio"
    bridge = "vmbr0"
  }
}


resource "proxmox_vm_qemu" "k3s_agent" {
  count = length(local.k3s_agent)
  name = local.k3s_agent[count.index].name
  desc = "k3s agent machine"
  pool        = "k3s"
  target_node = local.k3s_agent[count.index].target_node
  clone       = "ubuntu-cloud"
  qemu_os     = "l26"
  os_type     = "cloud-init"
  sshkeys     = var.ssh_public_key
  agent       = 1
  ciuser      = var.local_user_name
  cipassword  = var.local_user_pass
  cores       = 2
  sockets     = 1
  vcpus       = 0
  cpu         = "host"
  memory      = 6144
  scsihw      = "virtio-scsi-pci"
  ipconfig0   = "ip=${local.k3s_agent[count.index].ip}/24,gw=${local.gateway_ip}"
  nameserver  = local.dns
  vm_state    = "started"
  cicustom    = "vendor=local:snippets/ubuntu_basics.yml"

  disks {
    ide {
      ide3 {
        cloudinit {
          storage = "local-lvm"
        }
      }
    }
    scsi {
      scsi0 {
        disk {
          size    = "100G"
          storage = "local-lvm"
          discard = true
        }
      }
    }
  }

  network {
    model  = "virtio"
    bridge = "vmbr0"
  }
}