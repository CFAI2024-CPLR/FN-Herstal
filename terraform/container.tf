resource "proxmox_lxc" "basic" {

  for_each = { for cont in var.containers : cont.name => cont }

  target_node  = "cfai2024"
  hostname     = each.value.name
  ostemplate   = "local:vztmpl/debian-12-standard_12.2-1_amd64.tar.zst"
  password     = var.password
#  unprivileged = true
  pool = "mfleuret"
  cpuunits = each.value.cpuunits
  memory = each.value.memory
  start = true
  onboot = true
  unprivileged = true
 



  // Terraform will crash without rootfs defined
  rootfs {
    storage = "local-lvm"
    size    = each.value.rootfs_size

  }

  network {
    name   = "eth0"
    bridge = "vmbr0"
    ip     = "dhcp"
    ip6 = each.value.ipv6
  }


  provisioner "local-exec" {
    command = "sh install.sh ${each.value.class} ${each.value.name}"
  }


}
