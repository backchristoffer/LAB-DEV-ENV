#!/bin/bash
set -o nounset -o pipefail -o errexit

# --- Load .env file ---
ENV_FILE="$(dirname "$0")/.env"

if [[ -f "$ENV_FILE" ]]; then
  echo "Loading environment variables from $ENV_FILE"
  export $(grep -v '^#' "$ENV_FILE" | xargs)
else
  echo "ERROR: .env file not found at $ENV_FILE"
  exit 1
fi

# --- Validate required env vars ---
: "${HV_HOST:?Missing HV_HOST in .env}"
: "${ANSIBLE_USER:?Missing ANSIBLE_USER in .env}"

# --- Run Ansible ---
ansible-playbook -i "${HV_HOST}," \
  --user="$ANSIBLE_USER" \
  --ask-become-pass \
  --ask-pass \
  --connection=ssh \
  prep-ocp-cluster.yml -v
