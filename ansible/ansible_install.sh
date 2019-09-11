#!/usr/bin/env bash

# create python virtual environments directory
sudo mkdir --parents /opt/pyvenvs
sudo chown $USER:$USER /opt/pyvenvs

# create python virtual env for ansible controller
sudo apt update && sudo apt --yes install virtualenv
virtualenv --python=python3 /opt/pyvenvs/ansible_controller

# install ansible and needed python packages in the created virtual environment
# note: openshift python package needed for k8s inventory source
# https://docs.ansible.com/ansible/latest/plugins/inventory/k8s.html#requirements
source /opt/pyvenvs/ansible_controller/bin/activate
pip install --cache-dir /opt/pyvenvs/pipcache_$UID --upgrade pip
pip install --cache-dir /opt/pyvenvs/pipcache_$UID ansible openshift

# now you can run ansible commands using:
# source /opt/pyvenvs/ansible_controller/bin/activate
# ansible-playbook ...
