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

variable "digitalocean_token" {}

provider "digitalocean" {
  token = "${var.digitalocean_token}"
}

variable "digitalocean_droplet_name" {}
variable "digitalocean_droplet_image" {}
variable "digitalocean_droplet_size" {}
variable "digitalocean_droplet_region" {}

resource "digitalocean_droplet" "web" {
  name   = "${var.digitalocean_droplet_name}"
  image  = "${var.digitalocean_droplet_image}"
  size   = "${var.digitalocean_droplet_size}"
  region = "${var.digitalocean_droplet_region}"
}

output "Droplet domain" { value = "${dnsimple_record.web.hostname}" }
output "Droplet IP address" { value = "${dnsimple_record.web.ipv4_address}" }
