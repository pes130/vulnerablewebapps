# Laboratorio WebApps - Docker Compose (Ubuntu 24.04)

## Requisitos
- Ubuntu 24.04 en la VM host
- Docker y docker-compose (o `docker compose` integrado)

## Arranque
1. Crear flag:
   mkdir -p host_flags
   echo "FLAG{prueba_lab_init}" > host_flags/flag.txt
   chmod 440 host_flags/flag.txt

2. Levantar:
   docker-compose up -d --build

## Servicios (puertos en la VM host)
- DVWA:      http://<VM_IP>:8081
- Mutillidae: http://<VM_IP>:8082
- Hackazon:  http://<VM_IP>:8083
- WebGoat:   http://<VM_IP>:8084
- DVNA:      http://<VM_IP>:8085
- JuiceShop: http://<VM_IP>:3000

## Token para el bridge (cámbialo en docker-compose.yml si quieres)
SECRET_TOKEN=6f2b9d3e8a7c1f4b5e6d2a9c3b7f8e1d

## Notas
- Los permisos abiertos de logs son **dentro del contenedor DVWA** (no montados al host).
- Aísla la VM y haz snapshot antes de la práctica.
# vulnerablewebapps
