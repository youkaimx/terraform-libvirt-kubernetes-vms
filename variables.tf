# Create a user identified by the public key below
variable "user" {
  default     = "rvaldez"
  type        = string
  description = "The initial user for the created vms"
}

variable "public_key" {
  default     = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAILdcgEmxt5Jedyvrp9oW3z44wsLbI0sSU5aetd/Yfxi3 rvald@softserveinc.com"
  type        = string
  description = "The public key associated with the default user"
}

variable "vm_details" {
  type = map(object(
    {
      memory    = number
      processor = number
      disk      = number
      host      = number # The last part of the IP address for the
    }
  ))
  description = "A dictionary with the details of VMs to create"
}
