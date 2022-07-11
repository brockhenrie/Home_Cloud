## To instlall on CLI
```
cd heimdall
docker-compose up -d --force-recreate
```

## Create container in Portainer

Copy and paste this into a new stack
```
version: "2.1"
services:
  heimdall:
    image: lscr.io/linuxserver/heimdall:latest
    container_name: home - heimdall
    networks:
      - proxy
    environment:
      - PUID=1000
      - PGID=1000
      - TZ=America/Phoenix
    volumes:
      - /home/${YOUR_USER}/Home_Cloud/heimadall/data:/config
    ports:
      - 680:80
      - 2443:443
    restart: unless-stopped
    labels:
      - "traefik.enable=true"
      - "traefik.http.routers.heimdall.entrypoints=web,websecure"
      - "traefik.http.routers.heimdall.rule=Host(`example.com`)"
      - "traefik.http.routers.heimdall.tls=true"
networks:
  proxy:
    external: true
```

or....

Just create a new container and add all the contents of above docker-compose template

