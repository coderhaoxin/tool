#!/usr/bin/env zsh

action=$1
param1=$2
param2=$3

FLINK_DIR=/Users/xin.hao/flink-1.12.0/bin
FLINK_FS_DIR=/Users/xin.hao/Downloads

start() {
  cd $FLINK_DIR
  ./start-cluster.sh
}

stop() {
  cd $FLINK_DIR
  ./stop-cluster.sh
}

restart() {
  cd $FLINK_DIR
  ./stop-cluster.sh
  ./start-cluster.sh
}

clean() {
  rm $FLINK_FS_DIR/flink-logs/*
  rm -r $FLINK_FS_DIR/flink-checkpoints/*
}

save() {
  cd $FLINK_DIR
  ./flink savepoint $param1
}

usage() {
  echo Usage
  echo '  - restart'
  echo '  - start'
  echo '  - stop'
  echo '  - save job_id'
  echo '  - clean'
}

case $action in
  restart)
    restart
  ;;
  start)
    start
  ;;
  stop)
    stop
  ;;
  save)
    save
  ;;
  clean)
    clean
  ;;
  *)
    usage
  ;;
esac
