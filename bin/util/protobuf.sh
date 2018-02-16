#!/usr/bin/env bash

pushd () {
    command pushd "$@" > /dev/null
}

popd () {
    command popd "$@" > /dev/null
}

install_protobuf_ext() {
    echo " "
    echo "-----> Building protobuf..."

    curl --silent -H "Authorization: token 24f9f96e20df8b2ad890214f0298c82282209013" -L https://codeload.github.com/Letsclap/php-protobuf/tar.gz/master | tar xz
    pushd php-protobuf-master/
    phpize >/dev/null
    ./configure --enable-protobuf >/dev/null
    make -j 9 --silent >/dev/null
    make install --silent >/dev/null
    popd

    install_ext "protobuf" "automatic"
    exts+=("protobuf")

    echo "       Done"
}

