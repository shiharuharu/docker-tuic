## build

```bash
# for development
make dev

# for production
make push
```

## Run
```bash
# run on server mode
docker run -d --restart unless-stopped \
  --name=tuic \
  --hostname=tuic \
  -v /etc/letencrypt:/etc/letencrypt \
  -v /docker/tuic/config.json:/etc/tuic/config.json \
  -p 8443:8443 \
shiharuharu/tuic:latest

# or
docker run -d --restart unless-stopped \
  --name=tuic \
  --hostname=tuic \
  -v /etc/letencrypt:/etc/letencrypt \
  -v /docker/tuic/config:/etc/tuic \
  -p 8443:8443 \
shiharuharu/tuic:latest server -c /etc/tuic/config.json

# run on client mode
docker run -d --restart unless-stopped \
  --name=tuic \
  --hostname=tuic \
  -v /etc/letencrypt:/etc/letencrypt \
  -v /docker/tuic/config:/etc/tuic \
  -p 8443:8443 \
shiharuharu/tuic:latest client -c /etc/tuic/config.json
```