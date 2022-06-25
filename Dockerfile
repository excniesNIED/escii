FROM alpine:edge

ARG AUUID="ffbdbaa3-5cf5-4e1a-a1e3-661509b3a85d"
ARG CADDYIndexPage="https://codeload.github.com/typecho/typecho/zip/refs/heads/master"
ARG ParameterSSENCYPT="chacha20-ietf-poly1305"
ARG PORT=80

ADD etc/Caddyfile /tmp/Caddyfile
ADD etc/xray.json /tmp/xray.json
ADD deploy.sh /deploy.sh
ADD start.sh /start.sh

RUN apk update && \
    apk add --no-cache ca-certificates bash caddy tor unzip wget && \
    bash deploy.sh

RUN chmod +x /start.sh

CMD /start.sh
