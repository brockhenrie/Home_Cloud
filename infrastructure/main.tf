terraform {
  required_providers {
    pihole = {
      source = "ryanwholey/pihole"
    }
  }
}


provider "pihole" {
  url      = local.pihole_primary_url # PIHOLE_URL
  password = var.pihole_password      # PIHOLE_PASSWORD
}

provider "pihole" {
  url      = local.pihole_secondary_url # PIHOLE_URL
  password = var.pihole_password        # PIHOLE_PASSWORD
  alias    = "secondary"
}

module "pihole_1" {
  source      = "./modules/pihole-records"
  domain_name = local.domain_name
  domain_ip   = local.server_ip
    providers = {
      pihole = pihole
    }
}

module "pihole_2" {
  source      = "./modules/pihole-records"
  domain_name = local.domain_name
  domain_ip   = local.server_ip
  providers = {
    pihole = pihole.secondary
  }
}

module "clouflare" {
  source             = "./modules/cloudflare"
  cloudflare_email   = local.cloudflare_email
  cloudflare_api_key = var.cloudflare_api_key
}
