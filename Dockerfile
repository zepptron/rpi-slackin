FROM hypriot/rpi-alpine-scratch
COPY slacker/ /
RUN apk update && \
    apk add ca-certificates

CMD /bin/sh

