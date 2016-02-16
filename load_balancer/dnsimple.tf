resource "dnsimple_record" "load_balancer" {
  domain = "${var.domain}"
  name   = "${var.subdomain}"
  value  = "${digitalocean_droplet.load_balancer.ipv4_address}"
  type   = "A"
  ttl    = 30
}
