resource "pihole_dns_record" "mantisd_cloud" {
  domain = var.domain_name
  ip     = var.domain_ip
}
