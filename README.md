## Runner Install 

```
cd ~
mkdir mantisd-runner
mkdir mantisd-runner/config
```
```
docker run -d --name mantisd-runner --restart always \
  -v ~/code/mantisd-runner/config:/etc/gitlab-runner \
  -v /var/run/docker.sock:/var/run/docker.sock \
  -v ~/code/traefik/data/acme.json:/certs:ro \
  --network proxy \
  -e "CA_CERTIFICATES_PATH=/certs" \
  gitlab/gitlab-runner:latest

```
