resource "proxmox_vm_qemu" "k3s_master" {
  name = "test-terraform-1"
  desc = "k3s master machine"
  #   pool        = "test"
  target_node = "homelab-0"
  clone       = "ubuntu-cloud"
  qemu_os     = "l26"
  os_type     = "cloud-init"
  sshkeys     = ""
  agent       = 1
  ciuser      = ""
  cipassword  = ""
  cores       = 2
  sockets     = 1
  vcpus       = 0
  cpu         = "host"
  memory      = 6144
  scsihw      = "virtio-scsi-pci"
  ipconfig0   = "ip=192.168.0.99/24,gw=192.168.0.1"
  nameserver  = "192.168.0.1"
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