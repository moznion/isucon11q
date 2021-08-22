#!/bin/bash

set -uex

BIN_PATH=$(cd "$(dirname "$0")" || exit; pwd)
pushd "$BIN_PATH"
popd
REPO_ROOT=$(cd ./"$(git rev-parse --show-cdup)" || exit; pwd)
pushd "$REPO_ROOT"
git pull origin main
popd

