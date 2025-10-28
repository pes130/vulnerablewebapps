#!/bin/bash
# ------------------------------------------------------------
# Limpia los logs de Apache del contenedor DVWA.
# ------------------------------------------------------------

# Obtener el ID del contenedor DVWA según docker compose
CID=$(docker compose ps -q dvwa)

# Verificar que el contenedor existe
if [ -z "$CID" ]; then
  echo "[!] No se ha encontrado el contenedor 'dvwa'."
  echo "    Asegúrate de estar en la carpeta del proyecto y que esté levantado."
  exit 1
fi

echo "[*] Limpiando logs de Apache en el contenedor DVWA ($CID)..."

# Truncar (vaciar) los logs de Apache sin borrarlos
docker exec -it "$CID" sh -c '
  for log in /var/log/apache2/access.log /var/log/apache2/error.log; do
    if [ -f "$log" ]; then
      truncate -s 0 "$log" && echo "    [+] Vaciado $log"
    else
      echo "    [!] No existe $log"
    fi
  done
'

echo "Logs limpiados correctamente."
