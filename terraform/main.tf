terraform {
  required_providers {
    proxmox = {
      source = "Telmate/proxmox"
      version = "3.0.1-rc2"
      #version = "2.9.14"
    }
  }
}

provider "proxmox" {
  # Configuration options
  pm_api_url = "https://cfai2024.ajformation.fr:8006/api2/json"

#  pm_log_enable = true
#  pm_log_file   = "terraform-plugin-proxmox.log"
#  pm_debug      = true
#  pm_log_levels = {
#    _default    = "debug"
#    _capturelog = ""
#	}
}






