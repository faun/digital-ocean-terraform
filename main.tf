module "load_balancer" {
  source   = "./load_balancer/"
  droplet_ssh_key_ids = "${var.digitalocean_droplet_ssh_key_id}"
  droplet_size = "${var.digitalocean_droplet_size}"
  droplet_region = "${var.digitalocean_droplet_region}"
  droplet_name = "${var.digitalocean_droplet_name}"
  droplet_image_name = "${var.digitalocean_droplet_image_name}"
  droplet_private_networking = "${var.digitalocean_droplet_private_networking}"
  domain = "${var.dnsimple_domain}"
  subdomain = "${var.dnsimple_subdomain}"
}

provider "dnsimple" {
  email = "${var.dnsimple_email}"
  token = "${var.dnsimple_token}"
}

provider "digitalocean" {
  token = "${var.digitalocean_token}"
}

variable "dnsimple_email" {}
variable "dnsimple_token" {}
variable "dnsimple_subdomain" {}
variable "dnsimple_domain" {}

variable "digitalocean_token" {}
variable "digitalocean_droplet_size" {}
variable "digitalocean_droplet_region" {}
variable "digitalocean_droplet_name" {}
variable "digitalocean_droplet_image_name" {}
variable "digitalocean_droplet_private_networking" { default = false }
variable "digitalocean_droplet_ssh_key_id" {}

output "Load balancer hostname" {
  value = "${module.load_balancer.hostname}"
}
