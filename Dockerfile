FROM alpine:latest

COPY entrypoint.sh /entrypoint.sh

RUN apk add --update --no-cache curl wget \
    && case "$TARGETARCH" in \
        "386") TARGET="i686-linux-musl" ;; \
        "amd64") TARGET="x86_64-linux-musl" ;; \
        "arm64") TARGET="aarch64-linux-musl" ;; \
        *) TARGET="x86_64-linux-musl" ;; \
    esac \
    && mkdir -p /etc/tuic \
    && export VERSION=$(curl -s https://api.github.com/repos/EAimTY/tuic/releases/latest | grep "tag_name" | sed -E 's/.*"([^"]+)".*/\1/') \
    && wget -O /usr/bin/tuic-server https://github.com/EAimTY/tuic/releases/download/${VERSION}/tuic-server-${VERSION}-${TARGET} \
    && wget -O /usr/bin/tuic-client https://github.com/EAimTY/tuic/releases/download/${VERSION}/tuic-client-${VERSION}-${TARGET} \
    && chmod +x /usr/bin/tuic-server \
    && chmod +x /usr/bin/tuic-client \
    && chmod +x /entrypoint.sh

ENTRYPOINT [ "/entrypoint.sh" ]