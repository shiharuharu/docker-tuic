#!/bin/sh

case "$1" in
    "server")
        shift
        /usr/bin/tuic-server $@
    ;;
    "client")
        shift
        /usr/bin/tuic-client $@
    ;;
    *)
        /usr/bin/tuic-server -c /etc/tuic/config.json
    ;;
esac