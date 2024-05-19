resource "libvirt_pool" "k8s-snowwhite-pool" {
  type = "dir"
  name = "k8s-snowwhite-pool"
  path = "/opt/sdb/vms/k8s-snowwhite"
}

resource "libvirt_volume" "jammy" {
  name   = "ubuntu-jammy-22-04"
  source = "/opt/sdb/images/ubuntu-22.04-minimal-cloudimg-amd64.img"
}
# 
resource "libvirt_volume" "vm_vols" {
  for_each       = var.vm_details
  depends_on     = [libvirt_pool.k8s-snowwhite-pool]
  name           = "${each.key}-root.qcow"
  base_volume_id = libvirt_volume.jammy.id
  size           = each.value.disk
  pool           = libvirt_pool.k8s-snowwhite-pool.name
}

resource "libvirt_cloudinit_disk" "cloudinit_disk" {
  for_each       = var.vm_details
  depends_on     = [libvirt_pool.k8s-snowwhite-pool]
  name           = "cloudinit-${each.key}.img"
  pool           = libvirt_pool.k8s-snowwhite-pool.name
  user_data      = templatefile("./user-data.tpl", { hostname = each.key, user = var.user, public_key = var.public_key })
  network_config = templatefile("./network-config.tpl", { host = each.value.host })
}

resource "libvirt_domain" "vm" {
  for_each = var.vm_details
  name     = each.key
  vcpu     = each.value.processor
  disk {
    volume_id = libvirt_volume.vm_vols[each.key].id
  }

  network_interface {
    bridge = "br0"
  }
  cloudinit = libvirt_cloudinit_disk.cloudinit_disk[each.key].id
  memory    = each.value.memory
  autostart = true
  console {
    type        = "pty"
    target_type = "serial"
    target_port = "0"
  }
  graphics {
    type        = "spice"
    listen_type = "address"
    autoport    = true
  }
}


