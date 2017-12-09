FROM hypriot/rpi-alpine
COPY slacker/ /
RUN apk update && \
    apk add ca-certificates

CMD /bin/sh