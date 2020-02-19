provider "cloudflare" {
  version = "~> 2.3"
}

data "cloudflare_zones" "psliwka_app" {
  filter {
    name = "psliwka.app"
  }
}

variable "kubesail_verification_code" {
  type = string
}

resource "cloudflare_record" "kubesail_verification" {
  zone_id = data.cloudflare_zones.psliwka_app.zones[0].id
  name    = "miniflux"
  type    = "TXT"
  value   = "KUBESAIL_VERIFY=${var.kubesail_verification_code}"
  proxied = false
}
