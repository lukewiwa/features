#!/usr/bin/env bash

set -e

VERSION=${SC_VERSION:-"stable"}

apt-get update
apt-get install -y xz-utils

curl -sSL \
    "https://github.com/koalaman/shellcheck/releases/download/${VERSION}/shellcheck-${VERSION}.linux.$(uname -m).tar.xz" | tar -xJv
cp "shellcheck-${VERSION}/shellcheck" /usr/local/bin/
