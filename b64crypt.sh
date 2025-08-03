#!/usr/bin/env bash

set -e

usage() {
  echo "Usage:"
  echo "  Encrypt:   echo 'plaintext' | $0 -e -p <password>"
  echo "  Decrypt:   echo 'base64cipher' | $0 -d -p <password>"
  exit 1
}

if [[ $# -ne 3 ]]; then
  usage
fi

MODE="$1"
FLAG="$2"
PASSWORD="$3"

if [[ "$FLAG" != "-p" || -z "$PASSWORD" ]]; then
  usage
fi

case "$MODE" in
  -e)
    echo "Encryption mode. Entering..."
    openssl enc -aes-256-cbc -pbkdf2 -iter 100000 -salt -a -pass pass:"$PASSWORD"
    echo "Encryption complete."
    ;;
  -d)
    echo "Decryption mode. Entering..."
    if ! openssl enc -d -aes-256-cbc -pbkdf2 -iter 100000 -salt -a -pass pass:"$PASSWORD"; then
      echo "❌ Error: Incorrect password or corrupted data." >&2
      exit 1
    fi
    echo "Decryption complete."
    ;;
  *)
    usage
    ;;
esac
