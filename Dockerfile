FROM caddy:2.7-builder AS builder

RUN xcaddy build \
    --with github.com/lucaslorentz/caddy-docker-proxy@v2.8.11 \
    --with github.com/caddy-dns/cloudflare

FROM caddy:2.7
COPY --from=builder /usr/bin/caddy /usr/bin/caddy

ENTRYPOINT ["/usr/bin/caddy"]

CMD ["docker-proxy"]
