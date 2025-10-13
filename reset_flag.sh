#!/bin/bash
set -e
FLAG_DIR="./host_flags"
mkdir -p "$FLAG_DIR"
NEWFLAG="FLAG{prueba_lab_$(date +%s)}"
echo "$NEWFLAG" > "$FLAG_DIR/flag.txt"
chmod 440 "$FLAG_DIR/flag.txt"
echo "Nuevo flag: $NEWFLAG"
docker-compose down --remove-orphans
docker-compose up -d --build
