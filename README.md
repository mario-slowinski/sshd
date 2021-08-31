sshd
====

Ansible role to configure ssh server.

Destination paths are prefixed with `{{ test_dir }}` so during testing files are created/modified in isolated location.

Requirements
------------

* [ansible.builtin](https://docs.ansible.com/ansible/latest/collections/ansible/builtin/index.html)

Role Variables
--------------

* defaults

  ```yaml
  sshd_firewalld: {}    # firewalld settings

  sshd_banner: {}       # banner file attributes
  sshd_prompt: {}       # prompt script attributes

  sshd_AllowUsers: []   # list of users allowed to connect
  sshd_AuthenticationMethods: []   
                        # list of methods allowed to use for connect
  sshd_AcceptEnv: []    # list of AcceptEnv parameters
                        # each item = single line in config file
  ```

* vars

  ```yaml
  test_files: []        # list of files included in tests
                        # (to create subdirectories)

  sshd_pkgs:
    - name: []          # list of ssh server software packages

  sshd_config: {}       # sshd_config file attributes

  sshd_service: ""      # sshd service name
  ```

Dependencies
------------

* [service](https://github.com/mario-slowinski/service)
  * [software](https://github.com/mario-slowinski/software)

Examples
--------

* `requirements.yaml`

  ```yaml
  - name: sshd
    src: https://github.com/mario-slowinski/sshd
  ```

* `playbook.yaml`

  ```yaml
  - hosts: servers
    gather_facts: true  # to get ansible_os_family
    roles:
      - role: sshd
  ```

* testing, `test_dir` must exist and end with `/`

  ```sh
  ansible-playbook -i inventory -e test_dir=/tmp playbook.yaml
  ```

License
-------

[GPL-3.0](https://www.gnu.org/licenses/gpl-3.0.html)

Author Information
------------------

[mario.slowinski@gmail.com](mailto:mario.slowinski@gmail.com)
