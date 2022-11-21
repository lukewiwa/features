#!/usr/bin/env bash

set -e

VERSION=${SC_VERSION:-"stable"}

if command -v apt-get >/dev/null 2>&1; then
    apt-get update
    apt-get install -y xz-utils
elif command -v yum >/dev/null 2>&1; then
    yum install -y tar xz
else
    echo "Cannot find supported package manager"
    exit 1
fi


curl -sSL \
    "https://github.com/koalaman/shellcheck/releases/download/${VERSION}/shellcheck-${VERSION}.linux.$(uname -m).tar.xz" | tar -xJv
cp "shellcheck-${VERSION}/shellcheck" /usr/local/bin/
