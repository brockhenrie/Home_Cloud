## To instlall on CLI
```
cd kuma
docker-compose up -d --force-recreate
```

## Create container in Portainer

Copy and paste this into a new stack
```
version: "3.1"

services:
  uptime-kuma:
    image: louislam/uptime-kuma:1
    container_name: uptime-kuma
    volumes:
      - /home/${YOUR_USER}/Home_Cloud/kuma/data:/app/data
    ports:
      - 3001:3001
    restart: unless-stopped
    networks:
        - proxy
    security_opt:
      - no-new-privileges:true
    labels:
      - "traefik.enable=true"
      - "traefik.http.routers.kuma.entrypoints=web,websecure"
      - "traefik.http.routers.kuma.rule=Host(`kuma.example.com`)"
      - "traefik.http.routers.kuma.tls=true"

networks:
  proxy:
    external: true

```

or....

Just create a new container and add all the contents of above docker-compose template

