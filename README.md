# P12 Certificate Converter

A simple Docker-based tool to convert P12 certificates into separate key and certificate files.

## Important Compatibility Note

This tool specifically uses OpenSSL 1.1.1 (via Alpine 3.16) as newer versions have breaking changes in PKCS12 handling. This version is known to work correctly with most P12 certificates, while newer versions might fail or require additional parameters.

Version details:
- Alpine Linux: 3.16
- OpenSSL: 1.1.1q-r0

## Features

- Converts .p12 files to:
  - Private key (private.key)
  - Certificate (certificate.crt)
  - CA Certificate (ca.crt)
- Docker-based for consistent environment
- Simple one-command execution
- Uses compatible OpenSSL version (1.1.1)

## Why This Specific Version?

OpenSSL 3.0 and later versions introduced changes in how PKCS12 files are handled, which can cause issues with certain certificates. This tool uses OpenSSL 1.1.1 to ensure reliable conversion of P12 certificates without compatibility problems.

## Prerequisites

- Docker
- Docker Compose

## Usage

1. Place your .p12 file in the project directory
2. Run the converter:

```bash
docker-compose run --rm converter vpn0-udp-1244-oleksandrprudnikov.p12
```

The converted files will be created in the same directory.

## Running without Docker

If you prefer to run the script directly, ensure you have OpenSSL 1.1.1 installed:

```bash
# Check OpenSSL version
openssl version

# Run the converter
./scripts/convert.sh your-certificate.p12
```

## Output Files

- `private.key`: Private key file
- `certificate.crt`: Certificate file
- `ca.crt`: CA Certificate file

## Troubleshooting

If you encounter issues with newer OpenSSL versions, consider:
1. Using this Docker-based solution (recommended)
2. Installing OpenSSL 1.1.1 specifically
3. If using newer OpenSSL versions, you might need to modify the commands with additional parameters
4. By default it's keeping password empty, if you do have a password on your p12 file please change it in `convert.sh`

## License

MIT

## Contributing

Pull requests are welcome. For major changes, please open an issue first to discuss what you would like to change.
