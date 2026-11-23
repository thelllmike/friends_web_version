#!/usr/bin/env bash
# Upload this web build to the VPS; Caddy serves /opt/friends/webapp at https://<API_DOMAIN>/app/
set -euo pipefail
cd "$(dirname "$0")"
HOST="${FRIENDS_VPS:-root@189.31.39.180}"
[ -f index.html ] || { echo "No index.html here: copy the build in first (see README)"; exit 1; }
rsync -a --delete --exclude .git --exclude README.md --exclude deploy.sh ./ "$HOST:/opt/friends/webapp/"
echo "Deployed to $HOST:/opt/friends/webapp"
