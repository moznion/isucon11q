#!/bin/bash

set -uex

REPO_ROOT="$(cd ./"$(git rev-parse --show-cdup)" || exit; pwd)"

pushd "$REPO_ROOT/go"
make isucondition
popd

for ADDR in "isucondition-1.t.isucon.dev" "isucondition-2.t.isucon.dev" "isucondition-3.t.isucon.dev"; do
  ssh "isucon@$ADDR" sudo systemctl stop isucondition.go.service
  scp "$REPO_ROOT/go/isucondition" "isucon@${ADDR}:/home/isucon/webapp/go/isucondition"
  ssh "isucon@$ADDR" sudo systemctl restart isucondition.go.service
done

