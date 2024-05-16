module "container" {
  source = "git::https://github.com/ajcborges/terraform-modules.git//container?ref=d8722e8"

  image          = "portainer/portainer-ce:2.20.2"
  container_name = "docker-portainer-host"
  hostname       = "docker-portainer-host"
  restart_policy = "always"
  ports = [{
    external = "9443"
    internal = "9443"
    protocol = "tcp"
  }]

  named_volumes = {
    "portainer_data" = {
      container_path = "/opt/portainer/data"
      read_only      = false
      create         = true
    }
  }

  host_paths = {
    "/home/ajcborges/portainer/data/" = {
      container_path = "/opt/portainer/"
      read_only      = false
    },
    "/var/run/docker.sock" = {
      container_path = "/var/run/docker.sock"
      read_only      = true

    }

  }


}
