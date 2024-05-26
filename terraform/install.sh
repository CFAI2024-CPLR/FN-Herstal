#!/bin/sh

class="$1"
name="$2"

# Verifier si un argument a ete passe en parametre
if [ -z "$class" ] || [ -z "$name" ]; then
  echo "Usage: $0 <class> <name>"
  exit 1
fi

sleep 10

ANSIBLE_HOST_KEY_CHECKING=False /home/projet/ansible/.venv/bin/ansible-playbook -i /home/projet/ansible/inventory/inventory.yaml /home/projet/ansible/playbook/install_packages.yaml -l $name
ANSIBLE_HOST_KEY_CHECKING=False /home/projet/ansible/.venv/bin/ansible-playbook -i /home/projet/ansible/inventory/inventory.yaml /automatisation/ansible/playbook/install_users.yaml -l $name

if [ "$class" = "websites" ]; then
  ANSIBLE_HOST_KEY_CHECKING=False /home/projet/ansible/.venv/bin/ansible-playbook -i /home/projet/ansible/inventory/inventory.yaml /home/projet/ansible/playbook/website.yaml -l $name
fi

if [ "$class" = "bdd" ]; then
  ANSIBLE_HOST_KEY_CHECKING=False /home/projet/ansible/.venv/bin/ansible-playbook -i /home/projet/ansible/inventory/inventory.yaml /home/projet/ansible/playbook/bdd.yaml -l $name
fi
