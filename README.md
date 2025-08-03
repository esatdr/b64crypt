# 🔐 b64crypt — Simple CLI AES Encryption with Base64

`b64crypt` is a minimal Bash-based CLI tool that allows you to **encrypt and decrypt text using AES-256-CBC** encryption with a password, and output the result in **Base64 format**.

No need for input/output files — it works directly with **standard input and output**, making it perfect for simple shell use cases and scripting.

---

## 📦 Features

- 🔐 AES-256-CBC encryption with PBKDF2 key derivation
- 🧾 Base64 output (OpenSSL-compatible)
- ⚡ No file I/O — just use pipes!
- 🧪 Great for small secrets and quick testing
- 💡 Just Bash + OpenSSL (no extra dependencies)

---

## 🚀 Quick Start

### Build and install from source


```bash
git clone https://github.com/esatdr/b64crypt.git

cd b64crypt

chmod +x b64crypt.sh

Encrypt a string:
echo "mytext" | b64crypt -e -p mypassword

Decrypt a Base64 string:
echo "U2FsdGVkX1..." | b64crypt -d -p mypassword

Usage:
  Encrypt:   echo 'plaintext' | b64crypt -e -p <password>
  Decrypt:   echo 'examplebase64cipher' | b64crypt -d -p <password>
