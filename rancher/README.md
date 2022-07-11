## Docker Install

docker install command if running standalone on own server
```
sudo docker run -d --name rancher --restart=unless-stopped  -p 80:80 -p 443:443 -v ~/rancher/data:/var/lib/rancher   --privileged   rancher/rancher:v2.6-head --no-cacerts

```
change ports if needed

the loadbalancer config is then used in /traefik/data/config.yml