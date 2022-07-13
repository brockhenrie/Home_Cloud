resource "pihole_cname_record" "pihole" {
  domain = "pihole.${var.domain_name}"
  target = var.domain_name
}

resource "pihole_cname_record" "pihole2" {
  domain = "pihole2.${var.domain_name}"
  target = var.domain_name
}

resource "pihole_cname_record" "rancher" {
  domain = "rancher.${var.domain_name}"
  target = var.domain_name
}

resource "pihole_cname_record" "proxmox" {
  domain = "proxmox.${var.domain_name}"
  target = var.domain_name
}

resource "pihole_cname_record" "synology" {
  domain = "syn.${var.domain_name}"
  target = var.domain_name
}

resource "pihole_cname_record" "traefik_dashboard" {
  domain = "traefik-dashboard.${var.domain_name}"
  target = var.domain_name
}
resource "pihole_cname_record" "router" {
  domain = "router.${var.domain_name}"
  target = var.domain_name
}
resource "pihole_cname_record" "portainer" {
  domain = "portainer.${var.domain_name}"
  target = var.domain_name
}
resource "pihole_cname_record" "kuma" {
  domain = "kuma.${var.domain_name}"
  target = var.domain_name
}
resource "pihole_cname_record" "plex" {
  domain = "plex.${var.domain_name}"
  target = var.domain_name
}


