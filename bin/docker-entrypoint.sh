#!/bin/bash
set -e

echo "[`date +%Y-%m-%dT%T`] Generating Railgun Config"
/generate-config.sh > /etc/railgun/railgun.conf 2>&1
echo "[`date +%Y-%m-%dT%T`] Done Generating Railgun Config"

echo "[`date +%Y-%m-%dT%T`] Executing $@"

exec "$@"
