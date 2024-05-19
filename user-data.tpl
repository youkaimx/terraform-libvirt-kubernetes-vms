#cloud-config
hostname: ${hostname}
users:
  - default
  - name: "${user}"
    sudo: "ALL=(ALL) NOPASSWD:ALL"
    shell: /bin/bash
    # default passwd: notsafe
    passwd: $6$rounds=4096$JpxkInEG1PKvm$0d2.kUMVeHYMO04IQBFSlYFySkvuLTdBkjifMY9QT0J1K9PYzGpkRQmZh7QXiVjPyrnsdR4hObHwWbc1Joi851
    lock_passwd: False
    groups: sudo
    ssh_authorized_keys:
      - "${public_key}"
package_update: true
package_upgrade: true
packages:
  - apt-transport-https
  - ca-certificates
  - curl
  - software-properties-common
  - gnupg2
  - qemu-guest-agent
  - nfs-common
  - vim
runcmd:
  - timedatectl set-timezone "America/Merida"
  - install -m 0755 -d /etc/apt/keyrings
  - for pkg in docker.io docker-doc docker-compose docker-compose-v2 podman-docker containerd runc; do sudo apt-get remove $pkg; done
  - curl -fsSL https://download.docker.com/linux/ubuntu/gpg -o /etc/apt/keyrings/docker.asc
  - chmod a+r /etc/apt/keyrings/docker.asc

  - echo "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.asc] https://download.docker.com/linux/ubuntu  $(. /etc/os-release && echo "$VERSION_CODENAME") stable" | sudo tee /etc/apt/sources.list.d/docker.list
  - apt update
  - apt install -y docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin
power_state:
  mode: reboot
  timeout: 30
  condition: True
