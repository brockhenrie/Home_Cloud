## Home Cloud
***** FEEL FREE TO FORK OR UPDATE ******

This is a project that has a traefik reverse proxy hosted in a docker container than will resolve SSL Certificates for your automatically with your cloudflare registered account and domain. Pihole is then used as a DNS server locally. You can port forward the server on port 443 to the traefik instance and set up your DNS in cloudflare, or point your computers DNS to your pihole and use the pihole DNS for a private home network.

Looking into 
* Terraform controlled pihole records
* Terraform controlled Cloudflare Records
* Terraform Proxmox
* Converting docker compose into terraform code

## SETUP
To set up the home cloud project you must have

- [ ] A linux server or VM to run this on
- [ ] A Purchased Domain Name
- [ ] A Cloudflare Account
- [ ] Domain Registered on Cloudflare Account
- [ ] Docker and docker-compose installed
- [ ] A DNS server such as pihole

## Install Docker
```
curl -sSL https://get.docker.com | bash
sudo usermod -aG docker $(whoami)
systemctl enable docker.service
systemctl start docker.service
```
## Install docker-compose
```
sudo apt install docker-compose -y
```

## Install 
Go into your linux server home directory

```
cd ~
```

Clone the repo into the home folder, if you chnage the directory update the paths in all docker compose files accordingly

## Traefik 
Go into Traefik Directory
```
cd ~/Home_Cloud/
cd traefik
chmod 600 data/acme.json
chmod 600 data/syn-acme.json
sudo docker network create proxy
```
You can edit the docker-compose.yml file with nano, vi, vim, or nvim
or...
if you edit in your own repo and just deploy code to machine

```
sudo docker-compose up -d
sudo docker logs traefik
```
if you update the config and need to reapply to traefik
```
sudo docker-compose up -d --force-recreate
```

## Portainer
```
cd ../portainer
```
Edit docker-compose
```
sudo docker-compose up -d
sudo docker logs portainer
```

## Other Apps
the rest of the apps all have a read me to deploy, you can either run them in the cli on the server or in portainer

Portainer Essential to Show Container in Traefik
- [ ] set network to proxy

Set Correct Labels 
- [ ] traefik.enable=true
- [ ] traefik.http.routers.<ROUTERNAME>.entrypoints=web,websecure
- [ ] traefik.http.routers.<ROUTERNAME>.rule=Host(`subdomain.example.com`)
- [ ] traefik.http.routers.<ROUTERNAME>.tls=true
