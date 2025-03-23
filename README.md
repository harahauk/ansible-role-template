{{ ansible-role-template-name }}
================================
```diff
# Project maturity (- Dev|@ Staging|+ Prod):
- Dev
```
This is an [Ansible](https://www.ansible.com/)-role which installs and configures `something` and `something-more` on the target host.

Requirements
------------

## Linux

This role might "work" on a wide range of Linux-distributions, but below are the distros that are actually tested.
Currently supports following distributions
- RHEL-based (RockyLinux, AlmaLinux)
- Debian-based (Kali, Debian, Ubuntu)
xor:
  - Debian 12 "Bookworm"
  - Red Hat Linux 9
  - AlmaLinux 9
  - Fedora 38


## Ansible
You need ansible [optional install script](./templates/install_ansible.sh), and the module 'community general' (which often is pre-installed with your ansible-distribution) and the "community docker" module.
This role comes with a [script](./install_ansible.sh) that might or might not setup Ansible correctly for you depending
on your environment.

On most systems these commands will do the same as the installation-script:
```
dnf install ansible-core
ansible-galaxy collection install community.general
ansible-galaxy collection install community.docker
```
**Note**: Replace `dnf` with your package manager like `apt` for Ubuntu/Debian-based OS.


Role Variables
--------------
| Variable        | Mandatory | Description |
| --------------- | --------- | ----------- |
| docker_user     | no        | Defines a user that you want to given access to docker, defaults to the user running the playbook if not set |
| role_name_debug | no        | Display debug-info during role execution |

A description of the settable variables for this role should go here, including any variables that are in defaults/main.yml, vars/main.yml, and any variables that can/should be set via parameters to the role. Any variables that are read from other roles and/or the global scope (ie. hostvars, group vars, etc.) should be mentioned here as well.

Dependencies
------------

- [docker](https://github.com/harahauk/ansible-docker)

A list of other roles hosted on Galaxy should go here, plus any details in regards to parameters that may need to be set for other roles, or variables that are used from other roles.

Example Playbook
----------------

    - hosts: docker_hosts
      roles:
      - ansible-docker    # Change to the folder you checked this role out as
      vars:
        docker_user: "my_unprivileged_user"

    - hosts: servers
      roles:
         - { role: username.rolename, x: 42 }

License
-------

[The unlicense](./LICENSE)


Author Information
------------------

[Harald Hauknes](https://github.com/harahauk)
