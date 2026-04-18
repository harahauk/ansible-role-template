{{ ansible-role-template-name }}
================================
```diff
# Project maturity (- Dev|@ Staging|+ Prod):
- Dev
```
This is an [Ansible](https://www.ansible.com/)-role which installs and configures `something` and `something-more` on the target host. [Links to additonal documentation](https://).


Role Variables
--------------
| Variable        | Mandatory | Description |
| --------------- | --------- | ----------- |
| docker_user     | no        | Defines a user that you want to given access to docker, defaults to the user running the playbook if not set |
| role_name_debug | no        | Display debug-info during role execution |

A description of the modifiable variables for this role should go here, including any variables that are in defaults/main.yml, vars/main.yml, and any variables that can/should be set via parameters to the role. Any variables that are read from other roles and/or the global scope (ie. hostvars, group vars, etc.) should be mentioned here as well.


Requirements
------------
### 1. Linux
This role is tested and expected to perform on the following Linux-distributions:
- Debian 12 "Bookworm"
- Red Hat Linux 9
- AlmaLinux 9
- Fedora 38

The role *might* work on the following distributions with no guarantees:
- RHEL-based (RockyLinux, AlmaLinux)
- Debian-based (Kali, Debian, Ubuntu)

### 2. Ansible
You need 'ansible' installed for a control-node. Either as a seperate computer/VM or on the intended target. You need the Ansible module-collection `community general` (which often is pre-installed with your Ansible-distribution). This is the basis of any Ansible-control node, additionally to operate this role you need  the `community docker` module.  

I maintain a [script at Github](https://raw.githubusercontent.com/harahauk/ansible-help/refs/heads/main/install_ansible.sh) which automates installation in a way that do not interfere with system stability. The script installs the two module-packs as well.

On most systems these commands will lead to a working control node and is maintainable without the use of the script:
```
dnf install ansible-core
ansible-galaxy collection install community.general
ansible-galaxy collection install community.docker     # Only needed if you plan to automate Docker-deployments.
```
**Note**: Replace `dnf` with your package-manager like `apt` for Ubuntu/Debian-based OS.


Ansible-dependencies
--------------------
Roles needed to support this role, needs be executed prior to the execution of this role.

- [docker](https://github.com/harahauk/ansible-docker). If docker is already installed you may omit this step


Example Playbook
----------------
    - hosts: docker_hosts    # Define a group or a hostname as a target
      roles:
      - this_folder          # Change to the folder you checked this role out as
      vars:
        docker_user: "my_unprivileged_user"


License
-------

[The Unlicense](./LICENSE)


Author Information
------------------

[Harald Hauknes](https://github.com/harahauk)
