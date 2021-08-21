#!/bin/bash
set -xu -o pipefail

CURRENT_DIR=$(cd $(dirname $0);pwd)
export MYSQL_HOST=${MYSQL_HOST:-127.0.0.1}
export MYSQL_PORT=${MYSQL_PORT:-3306}
export MYSQL_USER=${MYSQL_USER:-isucon}
export MYSQL_DBNAME=${MYSQL_DBNAME:-isucondition}
export MYSQL_PWD=${MYSQL_PASS:-isucon}

export MYSQL_HOST_SHARD1=${MYSQL_HOST_SHARD1:-127.0.0.1}
export MYSQL_PORT_SHARD1=${MYSQL_PORT_SHARD1:-3306}
export MYSQL_USER_SHARD1=${MYSQL_USER_SHARD1:-isucon}
export MYSQL_DBNAME_SHARD1=${MYSQL_DBNAME_SHARD1:-isucondition_shard1}
export MYSQL_PWD_SHARD1=${MYSQL_PASS_SHARD1:-isucon}

export MYSQL_HOST_SHARD2=${MYSQL_HOST_SHARD2:-127.0.0.1}
export MYSQL_PORT_SHARD2=${MYSQL_PORT_SHARD2:-3306}
export MYSQL_USER_SHARD2=${MYSQL_USER_SHARD2:-isucon}
export MYSQL_DBNAME_SHARD2=${MYSQL_DBNAME_SHARD2:-isucondition_shard2}
export MYSQL_PWD_SHARD2=${MYSQL_PASS_SHARD2:-isucon}

export MYSQL_HOST_SHARD3=${MYSQL_HOST_SHARD3:-127.0.0.1}
export MYSQL_PORT_SHARD3=${MYSQL_PORT_SHARD3:-3306}
export MYSQL_USER_SHARD3=${MYSQL_USER_SHARD3:-isucon}
export MYSQL_DBNAME_SHARD3=${MYSQL_DBNAME_SHARD3:-isucondition_shard3}
export MYSQL_PWD_SHARD3=${MYSQL_PASS_SHARD3:-isucon}

export LANG="C.UTF-8"
cd $CURRENT_DIR

cat 0_Schema.sql 1_InitData.sql | mysql --defaults-file=/dev/null -h $MYSQL_HOST -P $MYSQL_PORT -u $MYSQL_USER $MYSQL_DBNAME
cat 0_Schema.sql 1_InitData.sql | mysql --defaults-file=/dev/null -h $MYSQL_HOST_SHARD1 -P $MYSQL_PORT_SHARD1 -u $MYSQL_USER_SHARD1 $MYSQL_DBNAME_SHARD1
cat 0_Schema.sql 1_InitData.sql | mysql --defaults-file=/dev/null -h $MYSQL_HOST_SHARD2 -P $MYSQL_PORT_SHARD2 -u $MYSQL_USER_SHARD2 $MYSQL_DBNAME_SHARD2
cat 0_Schema.sql 1_InitData.sql | mysql --defaults-file=/dev/null -h $MYSQL_HOST_SHARD2 -P $MYSQL_PORT_SHARD3 -u $MYSQL_USER_SHARD3 $MYSQL_DBNAME_SHARD3
