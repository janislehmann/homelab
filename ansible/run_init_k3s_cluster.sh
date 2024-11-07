#!/bin/bash
ansible-playbook --ask-become-pass --ask-vault-pass provision.yml -e bootstrap_cluster=True