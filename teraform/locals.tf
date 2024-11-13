locals {
  gateway_ip = "192.168.0.1"
  dns = "192.168.0.1"

    k3s_master = [
        {name = "devastator-0", vmid = 200, ip = "192.168.0.20", target_node = "homelab-0"},
        {name = "devastator-1", vmid = 201, ip = "192.168.0.21", target_node = "homelab-0"},
        {name = "devastator-2", vmid = 202, ip = "192.168.0.22", target_node = "homelab-1"}
    ]

    k3s_agent = []  
}