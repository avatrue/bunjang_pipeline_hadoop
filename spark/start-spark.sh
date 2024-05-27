#!/bin/bash

# Spark 마스터 시작
$SPARK_HOME/sbin/start-master.sh

# Spark 워커 시작
$SPARK_HOME/sbin/start-slave.sh spark://master:7077

# 컨테이너가 종료되지 않도록 유지
tail -f /dev/null
