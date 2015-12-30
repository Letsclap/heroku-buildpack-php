#!/usr/bin/env bash
# Build Path: /app/.heroku/php/

# fail hard
set -o pipefail
# fail harder
set -eux

echo "-----> Building curve25519..."

curl -L https://codeload.github.com/lt/php-curve25519-ext/tar.gz/master | tar xz
pushd php-curve25519-ext-master/
phpize
./configure
make -s -j 9
make install -s
popd

echo "-----> Adding extension curve25519 to PHP."

install_ext "curve25519" "automatic"
exts+=("curve25519")

echo "-----> Done."