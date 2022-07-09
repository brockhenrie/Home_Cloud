# traefik

Repository for my home cloud reverse proxy with tls certificates hooked up to cloudflare

## Getting started
 
git clone into your home directory ~/ and cd into traefik and edit the docker-compose.yml to match your domain name and information 
```
chmod 600 data/acme.json

docker-compose up -d 

docker logs traefik 

```

## Create Auth Middleware Password

```
sudo apt update
sudo apt install apache2-utils
echo $(htpasswd -nb "<USER>" "<PASSWORD>") | sed -e s/\\$/\\$\\$/g

```
NOTE: Replace <USER> with your username and <PASSWORD> with your password to be hashed.

Paste the output in your docker-compose.yml in line (traefik.http.middlewares.traefik-auth.basicauth.users=<USER>:<HASHED-PASSWORD>)

docker-compose up -d --force-recreate

## Config
you can use the ./config.yml to add endpoints...

or use container labels 

- [ ]  "traefik.enable=true"
- [ ]  "traefik.http.routers.<service-name>.entrypoints=web,websecure"
- [ ]  "traefik.http.routers.<service-name>.rule=Host(`subdomain.domain.com`)"
- [ ]  "traefik.http.routers.<service-name>.tls=true"


## Other Conatiners

For other conatiners to show up on network, the labels must be added to the container or config.yml and also added to the proxy network 



