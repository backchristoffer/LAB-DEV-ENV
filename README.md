# Lab and Dev setup automation

Lab Dev Env is a collection of Ansible playbooks designed to automate the setup of development environments for various operating systems including Linux, Windows, and macOS. These playbooks are intended to streamline the process of setting up development environments for labs and personal use. This is a work in progress and I will add more environments for various systems in the future.

## Playbooks

### Fedora 40 Development Environment

- **Playbook:** [fedora40-dev.yml](playbooks/fedora40-dev.yml)
- **Description:** This playbook automates the setup of a development environment for Fedora 40 Workstation. It installs essential development tools and packages required for software development, including compilers, interpreters, version control systems, and other development utilities.

## Usage

To use the playbooks in this repository, follow these steps:

1. Clone this repository to your local machine:

    ```bash
    git clone https://github.com/backchristoffer/lab-dev-env.git
    ```

2. Navigate to the `lab-dev-env` directory:

    ```bash
    cd lab-dev-env
    ```

3. Choose the playbook for the desired operating system/environment and execute it using the `ansible-playbook` command. For example, to set up the Fedora 40 development environment:

    ```bash
    ansible-playbook -i "hostip" --ask-become-password --user=user playbooks/fedora40-dev.yml 
    ```