module "container" {
  source = "git::https://github.com/ajcborges/terraform-modules.git//container?ref=d8722e8"

  image          = "portainer/agent:2.20.2"
  container_name = "portainer_agent"
  hostname       = "portainer_agent"
  restart_policy = "always"
  ports = [{
    external = "9001"
    internal = "9001"
    protocol = "tcp"
  }]

  host_paths = {
    "/home/ajcborges/portaineragent/data/" = {
      container_path = "/opt/portaineragent/"
      read_only      = false
    },
    "/var/run/docker.sock" = {
      container_path = "/var/run/docker.sock"
      read_only      = true

    },
    "/var/lib/docker/volumes" = {
      container_path = "/var/lib/docker/volumes"
      read_only      = true

    }

  }


}
