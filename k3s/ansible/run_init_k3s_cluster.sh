#!/bin/bash
ansible-playbook --ask-become-pass --ask-vault-pass k3s_cluster.yml -e bootstrap_cluster=True