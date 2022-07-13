terraform {
  required_version = ">=1.1.4"
  required_providers {
    pihole = {
      source = "ryanwholey/pihole"
    }
  }
}


data "pihole_cname_records" "cname_records" {
  
}


data "pihole_dns_records" "dns_records" {
  
}
