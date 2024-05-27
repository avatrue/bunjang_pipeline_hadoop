#!/bin/bash

# HDFS 포맷
$HADOOP_HOME/bin/hdfs namenode -format

# Hadoop 시작
$HADOOP_HOME/sbin/start-dfs.sh
$HADOOP_HOME/sbin/start-yarn.sh

# 컨테이너가 종료되지 않도록 유지
tail -f /dev/null


