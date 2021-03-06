FROM hypriot/rpi-alpine
MAINTAINER zepptron <https://github.com/zepptron>

COPY slacker/ /
RUN apk update && \
    apk upgrade && \
    apk add ca-certificates && \
    rm -rf /var/cache/apk/*

EXPOSE 3000
CMD /bin/sh
