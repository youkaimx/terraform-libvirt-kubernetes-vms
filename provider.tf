terraform {
  required_version = "~>1"
  required_providers {
    libvirt = {
      version = "~>0.7"
      source  = "dmacvicar/libvirt"
    }
  }
}

provider "libvirt" {
  uri = "qemu:///system"
}