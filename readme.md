# Simple infrastructure for creating a Digital Ocean machine

### Requirements

- [Terraform](https://www.terraform.io/downloads.html)
- A [digital ocean account](https://m.do.co/c/154d3aaf9ff8)
- A [DNSimple account](https://dnsimple.com/r/f52a00d5100b1b)

### Setup

Create a `terraform.tfvars` file at the root of the project with the following keys:

```
dnsimple_email                          = "dnsimple@example.com"
dnsimple_token                          = "API token from https://dnsimple.com/user"
dnsimple_domain                         = "domain.tld"
dnsimple_subdomain                      = "subdomain"
digitalocean_token                      = "API token from https://cloud.digitalocean.com/settings/api/tokens"
digitalocean_image_name                 = "image-name-or-image-id"
digitalocean_droplet_name               = "droplet-name"
digitalocean_droplet_private_networking = "true" # optional
digitalocean_droplet_size               = "512mb"
digitalocean_droplet_region             = "sfo1"
ssh_key_id                              = "12345 id from `tugboat keys` command"
```

### Plan infrastructure
See what changes will be made to your server infrastructure on apply.

``` sh
make plan
```

### Create infrastructure

``` sh
make apply
```

### Plan & create infrastructure in one step

``` sh
make

# or

make all
```

### Destroy

Destroy all server infrastructure created in the step above.

``` sh
make destroy
```

### Remove local state

WARNING: This destroys any record of infrastructure state, thereby preventing terraform from managing your infrastructure. Use at your own risk.

``` sh
make clean
```

### Destroy server resources and remove any local state

``` sh
make implode
```

### License
See [license](./LICENSE)
