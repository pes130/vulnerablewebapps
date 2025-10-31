#!/bin/sh
set -e

# Crear logs y ajustar permisos (solo dentro del contenedor)
mkdir -p /var/log/apache2
touch /var/log/apache2/mutillidae-access.log /var/log/apache2/mutillidae-error.log

if [ -e "/var/log/apache2/access.log" ]; then
  rm /var/log/apache2/access.log
fi

if [ -e "/var/log/apache2/error.log" ]; then
  rm /var/log/apache2/error.log
fi

ln -s /var/log/apache2/mutillidae-access.log /var/log/apache2/access.log
ln -s /var/log/apache2/mutillidae-error.log /var/log/apache2/error.log

# logs legibles por www-data
chown www-data:www-data /var/log/apache2 /var/log/apache2/* || true
chmod 644 /var/log/apache2/mutillidae-access.log /var/log/apache2/mutillidae-error.log /var/log/apache2/access.log /var/log/apache2/error.log || true

# Mantener compatibilidad con entrypoint original: ejecutar el comando pedido
exec "$@"
