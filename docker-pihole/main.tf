module "container" {
  source = "git::https://github.com/ajcborges/terraform-modules.git//container?ref=d8722e8"

  image          = "pihole/pihole:latest"
  container_name = "docker-pihole-host"
  hostname       = "docker-pihole-host"
  restart_policy = "unless-stopped"
  environment = {
    TZ = "Australia/Melbourne"
    WEBPASSWORD = "PleaseChangeMe"
    IPv6 = false
    DNSSEC = false
    DNS1 = "1.0.0.1"
    DNS2 = "1.1.1.1"
    PIHOLE_DNS = "1.1.1.1"

  }
  ports = [{
    external = "53"
    internal = "53"
    protocol = "tcp"
  },
  {
    external = "53"
    internal = "53"
    protocol = "udp"
  },
  {
    external = "80"
    internal = "80"
    protocol = "tcp"
  }]

  host_paths = {
    "/home/ajcborges/etc-pihole" = {
      container_path = "/etc/pihole"
      read_only      = false
    },
    "/home/ajcborges/etc-dnsmasq.d" = {
      container_path = "/etc-dnsmasq.d"
      read_only      = true

    }

  }


}
