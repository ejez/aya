Aya documentation
=================

.. toctree::
   :maxdepth: 2
   :caption: Contents:

With "Aya", building a web environment or making a website/web app becomes quick and easy.
Aya uses ansible, k8s (kubernetes) and other modern tools
to facilitate provisioning machines and getting your web app running in a short time.

In a few quick steps you will have your dev and production environments ready::

  # setup docker, k8s and other tools
  ansible-playbook playbooks/1_node_setup/1_local_node_setup.yml --ask-become-pass -i inventories/local_nodes.ini
  ansible-playbook playbooks/1_node_setup/2_remote_nodes_setup.yml --ask-become-pass -i inventories/example_nodes.ini

  # setup postgres and python and more
  ansible-playbook playbooks/2_web_env/1_web_env.yml -i inventories/example_nodes.ini

  # add a django project
  ansible-playbook playbooks/3_web_projects/django/add_django_project/add_django_project.yml --ask-become-pass -i inventories/example_nodes.ini

Features
--------

- The setup can be customized according to your needs using "variables" files.
- Aya is made with ansible, and ansible syntax is very easy, this will make you
  quickly understand what aya is doing on each step, and facilitates modifying the
  code (roles/playbooks) if needed.

Requirements
------------
To reduce aya complexity it was built only for ubuntu, most of its code can run
unmodified on other operating systems, however some of the code needs adjustments
to run on another os.
(ex: ansible "apt" module needs to be changed to "yum" for CentOS)

To use aya unmodified, ubuntu is required on the controller node and the
provisioned nodes.

Aya was tested in ubuntu 18.04

Quick start
------------
- Get aya::

    git clone https://gitlab.com/aya-projects/aya.git
    cd aya/ansible/

- Install ansible::

    bash ansible_install.sh

- Define the nodes(machines) you want to provision/setup in an inventory file::

    cp inventories/sandbox_nodes.ini.example inventories/mycluster_nodes.ini
    nano inventories/mycluster_nodes.ini

  the provided "sandbox_nodes" is an example of vagrant/virtualbox nodes, copy
  and modify this inventory as needed.
  https://docs.ansible.com/ansible/latest/user_guide/intro_inventory.html

  If you don't have dedicated/cloud nodes you can use your local node
  (your laptop for example) to set up a dev web environment with microk8s.

  You can also use the provided ``aya/vagrant/Vagrantfile`` to create virtual
  machines in your local computer.

- Go to the ``custom`` directories inside the ``playbooks`` directory and check
  the provided example files, if ``OPTIONAL`` is not stated at the top of the
  file, you need to create one for your inventory and modify as needed, ex::

    cp playbooks/1_node_setup/custom/k8s/sandbox_nodes_variables.yml.example playbooks/1_node_setup/custom/k8s/mycluster_nodes_variables.yml
    nano playbooks/1_node_setup/custom/k8s/mycluster_nodes_variables.yml

- Run the ansible playbooks that will do the heavy lifting
  (run sequentially one playbook at a time)::

    # setup docker, k8s and other tools
    ansible-playbook playbooks/1_node_setup/1_local_node_setup.yml --ask-become-pass -i inventories/local_nodes.ini
    ansible-playbook playbooks/1_node_setup/2_remote_nodes_setup.yml --ask-become-pass -i inventories/example_nodes.ini

    # setup postgres and python stacks and more
    ansible-playbook playbooks/2_web_env/1_web_env.yml -i inventories/example_nodes.ini

    # add a django project
    ansible-playbook playbooks/3_web_projects/django/add_django_project/add_django_project.yml --ask-become-pass -i inventories/example_nodes.ini


Contribute
----------

- Issue Tracker: https://gitlab.com/aya-projects/aya/issues
- Source Code: https://gitlab.com/aya-projects/aya

Support
-------

If you are having issues, please let us know.

https://gitlab.com/aya-projects/aya/issues

License
-------

The project is licensed under the MIT license.
