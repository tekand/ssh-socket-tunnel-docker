FROM alpine:3.9

VOLUME ["/root/ssh/"]

RUN apk add --update openssh-client && rm -rf /var/cache/apk/*

CMD rm -rf /root/.ssh && \
    mkdir /root/.ssh && \
    cp /config/* /root/.ssh && \
    chmod -R 600 /root/.ssh/* && \
    while true; do ssh -f -N -L *:2323:$REMOTE remote-ssh-host-to-connect-to; sleep 1; done;

EXPOSE 2323
