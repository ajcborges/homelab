# Homelab Project

This repository contains the infrastructure and deployment scripts/configuration for a homelab environment. The project is structured into three tiers, each responsible for a different stage of the deployment process.

## Project Structure

### Tier 01: LXC Deployment

This folder contains Terraform scripts to deploy LXC containers on a Proxmox Hypervisor. Each container serves a specific purpose, as indicated by its naming convention `tf-lxc-<application-name>`.

### Tier 02: Configuration Management

This folder contains Ansible roles for configuring the LXC containers before application deployment. Each role is named `ansible-role-<application-name>`.

### Tier 03: Application Deployment

This folder contains Terraform scripts to deploy applications within the configured LXC containers. Each deployment is named `tf-docker-<application-name>`.

## Getting Started

### Prerequisites

- Proxmox Hypervisor. Version: ~> 8.1.3
- Terraform. Version: >= 1.3.0
- Ansible. Version: >= 2.1

### Installation

1. **Deploy LXC Containers**:

    ```bash
    cd tier-01-deployment/tf-lxc-<application-name>
    terraform init
    terraform apply
    ```

2. **Configure LXC Containers**:

    ```bash
    cd tier-02-deployment/ansible-role-<application-name>
    ansible-playbook -i inventory main.yml
    ```

3. **Deploy Applications**:

    ```bash
    cd tier-03-deployment/tf-docker-<application-name>
    terraform init
    terraform apply
    ```

## Usage

After deployment, the applications will be running inside the LXC containers. Access and manage them as needed using the appropriate tools and interfaces.

## Configuration

Adjust the configurations in the respective Terraform and Ansible files as per your requirements.

## Contributing

Contributions are welcome! Please fork the repository and submit pull requests.

## License

This project is licensed under the MIT License.
