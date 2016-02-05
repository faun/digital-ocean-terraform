variable "digitalocean_token" {}

provider "digitalocean" {
  token = "${var.digitalocean_token}"
}

variable "digitalocean_droplet_name" {}
variable "digitalocean_image_name" {}
variable "digitalocean_droplet_size" {}
variable "digitalocean_droplet_region" {}
variable "ssh_key_id" { default = "" }

resource "digitalocean_droplet" "web" {
  name     = "${var.digitalocean_droplet_name}"
  image    = "${var.digitalocean_image_name}"
  size     = "${var.digitalocean_droplet_size}"
  region   = "${var.digitalocean_droplet_region}"
  ssh_keys = ["${var.ssh_key_id}"]
}

output "Droplet domain" { value = "${dnsimple_record.web.hostname}" }
output "Droplet IP address" { value = "${dnsimple_record.web.ipv4_address}" }
