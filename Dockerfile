FROM alpine:latest
RUN apk add --no-cache ca-certificates curl unzip \
 && mkdir -p /usr/local/bin /etc/xray \
 && curl -sL https://github.com/XTLS/Xray-core/releases/download/v26.11.9/Xray-linux-64.zip -o /tmp/xray.zip \
 && unzip -o /tmp/xray.zip -d /usr/local/bin/ \
 && chmod +x /usr/local/bin/xray \
 && rm -f /tmp/xray.zip
COPY config.json /etc/xray/config.json
COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh
EXPOSE 8080
CMD ["/entrypoint.sh"]
