#!/bin/sh
echo "OpenSSL version: $(openssl version)"

if [ -z "$1" ]; then
    echo "Please provide the .p12 file name as an argument"
    exit 1
fi

P12_FILE=$1

openssl pkcs12 -in "$P12_FILE" -nocerts -nodes -out private.key -passin pass:
openssl pkcs12 -in "$P12_FILE" -clcerts -nokeys -out certificate.crt -passin pass:
openssl pkcs12 -in "$P12_FILE" -cacerts -nokeys -out ca.crt -passin pass:
echo "Conversion completed successfully!"
echo "Generated files: private.key and certificate.crt"