#!/usr/bin/env bash
ansible-playbook  run.yml --vault-password-file .vault --skip-tags "debugger"
