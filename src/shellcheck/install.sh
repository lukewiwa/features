#!/usr/bin/env bash

set -e

SC_VERSION=${VERSION:-"stable"}

if command -v apt-get >/dev/null 2>&1; then
    apt-get update
    apt-get install -y curl xz-utils
elif command -v yum >/dev/null 2>&1; then
    yum install -y tar xz
else
    echo "Cannot find supported package manager"
    exit 1
fi


TMP_DIR=/tmp/shellcheck-tmp

mkdir --parents $TMP_DIR
pushd $TMP_DIR

curl -sSL \
    "https://github.com/koalaman/shellcheck/releases/download/${SC_VERSION}/shellcheck-${SC_VERSION}.linux.$(uname -m).tar.xz" | tar -xJv
cp "shellcheck-${SC_VERSION}/shellcheck" /usr/local/bin/

popd
rm -rf $TMP_DIR
