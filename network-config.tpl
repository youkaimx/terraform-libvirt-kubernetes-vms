version: 2
ethernets:
    ens3:
        dhcp4: false
        dhcp6: false
        addresses:
          - 192.168.42.${host}/24
        gateway4: 192.168.42.254
        nameservers:
          addresses:
            - 8.8.8.8
            - 8.8.4.4
