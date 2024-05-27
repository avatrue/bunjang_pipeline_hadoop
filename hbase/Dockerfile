FROM ubuntu:20.04

# 기본 패키지 설치
RUN apt-get update && apt-get install -y openjdk-8-jdk wget

# 환경 변수 설정
ENV JAVA_HOME /usr/lib/jvm/java-8-openjdk-arm64
ENV HBASE_VERSION 2.4.6
ENV HBASE_HOME /opt/hbase
ENV PATH $PATH:$HBASE_HOME/bin:$JAVA_HOME/bin

# HBase 설치
RUN wget https://archive.apache.org/dist/hbase/$HBASE_VERSION/hbase-$HBASE_VERSION-bin.tar.gz \
    && tar -xzvf hbase-$HBASE_VERSION-bin.tar.gz -C /opt/ \
    && mv /opt/hbase-$HBASE_VERSION /opt/hbase \
    && rm hbase-$HBASE_VERSION-bin.tar.gz

COPY hbase-site.xml $HBASE_HOME/conf/hbase-site.xml
COPY start-hbase.sh /usr/local/bin/start-hbase.sh

RUN chmod +x /usr/local/bin/start-hbase.sh

CMD ["start-hbase.sh"]
