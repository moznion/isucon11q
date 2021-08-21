#!/bin/bash

set -uex

REPO_ROOT="$(cd ./"$(git rev-parse --show-cdup)" || exit; pwd)"

pushd "$REPO_ROOT/go"
make isucondition
popd

for ADDR in "52.192.11.192" "13.112.241.239" "54.168.227.71"; do
  ssh "isucon@$ADDR" sudo systemctl stop isucondition.go.service
  scp "$REPO_ROOT/go/isucondition" "isucon@${ADDR}:/home/isucon/webapp/go/isucondition"
  ssh "isucon@$ADDR" sudo systemctl restart isucondition.go.service
done

