#!/bin/bash
for file in $HOME/.auth_codes/*; do
  echo $USER
  echo whoami
  # ls -l "$file" | awk '{print $1, $9}'  # Extracts permissions and filename
  ansible-vault decrypt "$file" # --vault-password-file $HOME/ansible/.vault
done