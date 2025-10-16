# Lab and Dev setup automation

Lab Dev Env is a collection of Ansible playbooks designed to automate the setup of development environments for various operating systems including Linux, Windows, and macOS. These playbooks are intended to streamline the process of setting up development environments for labs and personal use. This is a work in progress and I will add more environments for various systems in the future.

Some playbooks or scripts will require a API offline token to run.
Please visit https://access.redhat.com/management/api for more information

## Blueprints

### RHEl 9.4 LAB Image

- **Blueprint:** [rhel94-lab](blueprints/rhel94-lab.toml)
- **Description:** RHEL 9.4 LAB blueprint for a custom RHEL image I will use with libvirt.

## Usage

To use the blueprints in this reposity, follow these steps. Please make sure to follow the Red Hat RHEL Builder documentation.
```
- https://docs.redhat.com/en/documentation/red_hat_enterprise_linux/9/html/composing_a_customized_rhel_system_image/installing-composer_composing-a-customized-rhel-system-image#composer-system-requirements_installing-composer 
```

1. Clone this repository to your local machine:

    ```bash
    git clone https://github.com/backchristoffer/lab-dev-env.git
    ```

2. Navigate to the `lab-dev-env/blueprints` directory:

    ```bash
    cd lab-dev-env/blueprints
    ```

3. Push the blueprint to composer
    ```
    composer-cli blueprints push rhel94-lab.toml
    ```


4. Verify that the contents are uploaded and if dependencies are valid
    ```
    composer-cli blueprints show rhel94-lab
    composer-cli blueprints depsolve rhel94-lab
    ```

5. Start the compose #(I will use qcow2)
    ```
    composer-cli compose start rhel94-lab qcow2  
    ```

6. Check status
    ```
    [user@rhelhost ~]$ sudo composer-cli compose status
    ID                                     Status     Time                       Blueprint         Version   Type       Size
    23abc7ed-433a-4c2d-936f-0b3745110b63   RUNNING    Fri Mar 14 16:35:37 2025   rhel94-lab        1.0.1     qcow2
    ```
    ```
    [user@rhelhost ~]$ sudo composer-cli compose status
    ID                                     Status     Time                       Blueprint         Version   Type               Size
    ca0e16e5-5036-47ae-9e9a-b39e0d11445d   FINISHED   Fri Mar 14 17:27:36 2025   rhel94-lab        1.0.0     qcow2              10737418240
    ```

8. Download image when the status is FINISHED
    ```
    [user@rhelhost ~]$ sudo composer-cli compose image ca0e16e5-5036-47ae-9e9a-b39e0d11445d
    ```

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