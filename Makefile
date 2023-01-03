export VERSION=$(shell curl -s https://api.github.com/repos/EAimTY/tuic/releases/latest | grep "tag_name" | sed -E 's/.*"([^"]+)".*/\1/')

dev:
	docker build --no-cache --progress=plain --load -f Dockerfile -t shiharuharu/tuic:${VERSION} -t shiharuharu/tuic:latest .

push:
	docker build --no-cache --progress=plain --push -f Dockerfile -t shiharuharu/tuic:${VERSION} -t shiharuharu/tuic:latest .