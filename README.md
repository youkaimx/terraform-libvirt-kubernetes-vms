# terraform-libvirt-kubernetes-vms

Infrastructure as Code to cerate VMs using the `libvirt` provider using ubuntu 22.04 and cloudinit. This is intented to be used as the basis for a kubernetes so a set of examples for deployments services and ingresses are provided in the `kubernetes-examples`

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | ~>1 |
| <a name="requirement_libvirt"></a> [libvirt](#requirement\_libvirt) | ~>0.7 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_libvirt"></a> [libvirt](#provider\_libvirt) | 0.7.6 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [libvirt_cloudinit_disk.cloudinit_disk](https://registry.terraform.io/providers/dmacvicar/libvirt/latest/docs/resources/cloudinit_disk) | resource |
| [libvirt_domain.vm](https://registry.terraform.io/providers/dmacvicar/libvirt/latest/docs/resources/domain) | resource |
| [libvirt_pool.k8s-snowwhite-pool](https://registry.terraform.io/providers/dmacvicar/libvirt/latest/docs/resources/pool) | resource |
| [libvirt_volume.jammy](https://registry.terraform.io/providers/dmacvicar/libvirt/latest/docs/resources/volume) | resource |
| [libvirt_volume.vm_vols](https://registry.terraform.io/providers/dmacvicar/libvirt/latest/docs/resources/volume) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_public_key"></a> [public\_key](#input\_public\_key) | The public key associated with the default user | `string` | `"ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAILdcgEmxt5Jedyvrp9oW3z44wsLbI0sSU5aetd/Yfxi3 rvald@softserveinc.com"` | no |
| <a name="input_user"></a> [user](#input\_user) | The initial user for the created vms | `string` | `"rvaldez"` | no |
| <a name="input_vm_details"></a> [vm\_details](#input\_vm\_details) | A dictionary with the details of VMs to create | <pre>map(object(<br>    {<br>      memory    = number<br>      processor = number<br>      disk      = number<br>      host      = number # The last part of the IP address for the<br>    }<br>  ))</pre> | n/a | yes |

## Outputs

No outputs.
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
