FROM alpine:3.16

# Install OpenSSL
RUN apk add --no-cache openssl

# Verify OpenSSL installation
RUN openssl version

WORKDIR /certs

COPY scripts/convert.sh /usr/local/bin/convert.sh
RUN chmod +x /usr/local/bin/convert.sh

ENTRYPOINT ["/usr/local/bin/convert.sh"]
