output "dns_records" {
  value = data.pihole_dns_records.dns_records
}

output "cname_record" {
  value = data.pihole_cname_records.cname_records
}