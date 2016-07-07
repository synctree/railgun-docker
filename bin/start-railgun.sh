#!/bin/bash
set -e

echo "[`date +%Y-%m-%dT%T`] Starting Railgun Listener"
/usr/bin/rg-listener -config=/etc/railgun/railgun.conf
