#!/bin/bash
set -e

echo "[`date +%Y-%m-%dT%T`] Generating Railgun Config"
HOST_IP=$(curl http://169.254.169.254/latest/meta-data/public-ipv4)
echo "[`date +%Y-%m-%dT%T`] Using host IP: ${HOST_IP}"
/generate-config.sh $HOST_IP > /etc/railgun/railgun.conf 2>&1
echo "[`date +%Y-%m-%dT%T`] Done Generating Railgun Config"

echo "[`date +%Y-%m-%dT%T`] Executing $@"

exec "$@"
