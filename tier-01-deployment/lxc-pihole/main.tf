module "proxmox_lxc" {
  source = "git::https://github.com/ajcborges/terraform-modules.git//proxmox_lxc?ref=cb4354c"
  #source = "./modules/common/"

  proxmox_node          = var.proxmox_node          # String containing the cluster node name.
  proxmox_resource_pool = var.proxmox_resource_pool # The name of the Proxmox resource pool to add this container to.

  lxc_ostemplate = var.lxc_ostemplate # The volume identifier that points to the OS template or backup file.
  lxc_ostype     = var.lxc_ostype     # The operating system type, used by LXC to set up and configure the container. 
  lxc_arch       = var.lxc_arch       # Sets the container OS architecture type.

  lxc_description   = var.lxc_description   # Sets the container description seen in the web interface.
  lxc_vmid          = var.lxc_vmid          # A number that sets the VMID of the container. If set to 0, the next available VMID is used. Default is 0
  lxc_hostname      = var.lxc_hostname      # Specifies the host name of the container.
  lxc_root_password = var.lxc_root_password # Sets the root password inside the container.
  # Multi-line string of SSH public keys that will be added to the container.
  lxc_public_ssh_keys = var.lxc_public_ssh_keys

  lxc_unprivileged    = var.lxc_unprivileged    # A boolean that makes the container run as an unprivileged user.
  lxc_start_on_boot   = var.lxc_start_on_boot   # A boolean that determines if the container will start on boot. 
  lxc_start_on_create = var.lxc_start_on_create # A boolean that determines if the container is started after creation.
  lxc_protection      = var.lxc_protection      # A boolean that enables the protection flag on this container. 

  lxc_enable_fuse         = var.lxc_enable_fuse                    # A boolean for enabling FUSE mounts.
  lxc_enable_keyctl       = var.lxc_enable_keyctl                  # A boolean for enabling the keyctl() system call.
  lxc_allowed_mount_types = var.lxc_allowed_mount_types # Defines the filesystem types (separated by semicolons) that are allowed to be mounted.
  lxc_enable_nesting      = var.lxc_enable_nesting                 # A boolean to allow nested virtualization.


  lxc_cores       = var.lxc_cores       # The number of cores assigned to the container. A container can use all available cores by default.
  lxc_memory      = var.lxc_memory      # A number containing the amount of RAM to assign to the container (in MB).
  lxc_swap_memory = var.lxc_swap_memory #A number that sets the amount of swap memory available to the container.

  # Terraform will crash without rootfs defined
  lxc_rootfs_storage_volume = var.lxc_rootfs_storage_volume         # A string containing the volume , directory, or device to be mounted into the container (at the path specified by mp)
  lxc_rootfs_size_gb        = var.lxc_rootfs_size_gb # Size of the underlying volume. Must end in T, G, M, or K. Note that this is a read only value.


  # mountpoint { # An object for defining a volume to use as a container mount point. Can be specified multiple times.
  #   key     = "1"  # The number that identifies the mount point (
  #   slot    = 1 # A string containing the number that identifies the mount point
  #   storage = "/mnt/containers/" # A string containing the volume , directory, or device to be mounted into the container (at the path specified by mp)
  #   # Without 'volume' defined, Proxmox will try to create a volume with
  #   # the value of 'storage' + : + 'size' (without the trailing G) - e.g. "/mnt/containers/:256".
  #   # This behaviour looks to be caused by a bug in the provider.
  #   volume  = "/mnt/containers/"
  #   mp      = "/mnt/data/" # The path to the mount point as seen from inside the container. The path must not contain symlinks for security reasons.
  #   size    = "256G" # Size of the underlying volume. Must end in T, G, M, or K. Note that this is a read only value.
  # }

  lxc_dns_name_server   = var.lxc_dns_name_server   # The DNS server IP address used by the container.
  lxc_dns_search_domain = var.lxc_dns_search_domain # Sets the DNS search domains for the container.

  # An object defining a network interface for the container. Can be specified multiple times.
  lxc_firewall = var.lxc_firewall # A boolean to enable the firewall on the network interface.

}
