#!/bin/bash

# 환경 변수 설정
export JAVA_HOME=/usr/lib/jvm/java-8-openjdk-arm64

# HBase 시작
$HBASE_HOME/bin/start-hbase.sh

# 컨테이너가 종료되지 않도록 유지
tail -f /dev/null
