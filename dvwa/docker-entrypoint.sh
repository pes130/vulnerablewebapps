#!/bin/sh
set -e

# Si se pasa un comando explícito, ejecútalo
if [ "$#" -gt 0 ]; then
  exec "$@"
fi

# Por defecto, arrancar Apache en foreground (apache2ctl está presente en esta imagen)
exec apache2ctl -D FOREGROUND
