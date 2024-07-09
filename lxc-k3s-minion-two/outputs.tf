output "id" {
  description = "The Proxmox VMID."
  value       = module.proxmox_lxc.id
}

output "name" {
  description = "The lxc host name."
  value       = module.proxmox_lxc.name
}

output "ip" {
  description = "The lxc host ipaddress."
  value       = module.proxmox_lxc.ip[0].ip
}