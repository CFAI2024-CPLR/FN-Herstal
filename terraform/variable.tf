variable password {
  type        = string
  default     = "azerty"
  description = "Default password for containers"
}

variable ssh_public_keys {
  type        = string
  default     = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAACAQCoWtU6emsO2dgGFK+gJJchA+rvO9hzvffe6nEj1HDo9IwfCBMO59KaCMOWbjeQx6S10X/vTRxNWiLfhuPlRSXwdAXK6/bzpWGecpQnxNn6Df6qaYhb/WMt9nb7AnghRnljTEFoPP+aMr1vrm1hISlNMmbSews3y+8BNUTLykEauan18eBcjLeoCjLsSC6S1R8zyIyVxhLasmw3wGlJF1NrIT/qyoa/xDAP1SMATUdWrqYulWXpoSNp8nOHeQRyw7gEwHl6QcsLVtOR1PmEj6+mOjkZdHrIupL6xBzYBDqSM0oRRn68/Tz+OqCHt6bzduL8MaaQUdZCu3Z/9hkqg9xTTjRDeVxe1zqHgpeoK9WUS2aNIs0kYcNT1R63NTYmtfhhK1xHPqePbZrG6gaKCRJNCtfy9sAMBshHDotSgBTYbtSU2RflSqRZ6RAYQG6zVZ0T4qyZdmSQKwq0CiWAj+WocaF+JzLVR9AHPr6CzeWqT6QDWYBNvknFTY/Paz5a/KKIVweTBUvPc1D/+TWsxcuFq5dRy2TgqLvZ75XbNsPJD8UTsSB6UNl5VciSdvJCwfPZFOdYB/7uQpKI6mO/8aBsV5zhti8hc7SYAqRABQUYvN+cChMR1NtuEY3oCm0x8Tslm0wesE4Yz5x+C5oMhadEa6jv1itqbXdWhV9lhyv+XQ== root@fnherstal-terraform"
  description = "multiline each line a ssh-key"
}

variable target_node {
  type        = string
  default     = "cfai2024"
  description = "Target to proxmox deployment"
}

variable pool {
  type        = string
  default     = ""
  description = "Pool to deploy on"

}

variable containers {
  type          = list(object({
    name        = string
    cpuunits    = number
    rootfs_size = string
    memory      = number
    
    ipv6        = string
    
  }))
  default       = [{
    name        = "default"
    cpuunits    = 128
    rootfs_size = "10G"
    memory      = 128
    ostemplate  = "local:vztmpl/debian-12-standard_12.2-1_amd64.tar.zst"
    ipv6        = "2a03:5840:111:1024:b121:13ff:feea:1000"
  }]
  description   = ""

}  


