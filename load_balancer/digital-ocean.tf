resource "digitalocean_droplet" "load_balancer" {
  name               = "${var.droplet_name}"
  image              = "${var.droplet_image_name}"
  size               = "${var.droplet_size}"
  region             = "${var.droplet_region}"
  private_networking = "${var.droplet_private_networking}"
  ssh_keys           = ["${var.droplet_ssh_key_ids}"]
}

output "hostname" {
  value = "${digitalocean_droplet.load_balancer.hostname}"
}

output "ip_address" {
  value = "${digitalocean_droplet.load_balancer.ipv4_address}"
}

output "hostname" {
 value = "${dnsimple_record.load_balancer.hostname}"
}
