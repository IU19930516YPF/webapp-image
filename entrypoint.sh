#!/bin/sh
# Railway 注入 $PORT；$UUID / $WSPATH 在 Railway 面板里设为环境变量
set -e
sed -i "s/__PORT__/${PORT}/g; s/__UUID__/${UUID}/g; s|__WSPATH__|${WSPATH}|g" /etc/xray/config.json
exec /usr/local/bin/xray run -config /etc/xray/config.json
