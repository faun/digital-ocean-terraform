variable "dnsimple_subdomain" {}
variable "dnsimple_domain" {}
variable "dnsimple_email" {}
variable "dnsimple_token" {}

provider "dnsimple" {
  email = "${var.dnsimple_email}"
  token = "${var.dnsimple_token}"
}

resource "dnsimple_record" "web" {
  domain = "${var.dnsimple_domain}"
  name   = "${var.dnsimple_subdomain}"
  value  = "${digitalocean_droplet.web.ipv4_address}"
  type   = "A"
  ttl    = 30
}

