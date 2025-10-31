#!/bin/bash
# ------------------------------------------------------------
# Limpia los logs de Apache de contenedores
# ------------------------------------------------------------

# Obtener el ID del contenedor según docker compose
CID_DVWA=$(docker compose ps -q dvwa)
CID_MUTI=$(docker compose ps -q mutillidae)


echo "[*] Limpiando logs de Apache en el contenedor DVWA ($CID_DVWA)..."
truncate -s 0 "/var/log/apache2/access.log" && echo "    [+] Vaciado /var/log/apache2/access.log"
truncate -s 0 "/var/log/apache2/error.log" && echo "    [+] Vaciado /var/log/apache2/error.log"
echo "[*] Logs limpiados correctamente."


echo "[*] Limpiando logs de Apache en el contenedor Mutillidae ($CID_MUTI)..."
truncate -s 0 "/var/log/apache2/mutillidae-access.log" && echo "    [+] Vaciado /var/log/apache2/mutillidae-access.log"
truncate -s 0 "/var/log/apache2/mutillidae-error.log" && echo "    [+] Vaciado /var/log/apache2/mutillidae-error.log"
echo "[*] Logs limpiados correctamente."


echo "Logs limpiados correctamente."



















echo "Logs limpiados correctamente."
