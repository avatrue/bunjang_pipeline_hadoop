FROM ubuntu:20.04

# 기본 패키지 설치
RUN apt-get update && apt-get install -y openjdk-8-jdk wget ssh rsync

# 환경 변수 설정
ENV JAVA_HOME /usr/lib/jvm/java-8-openjdk-arm64


ENV HADOOP_VERSION 3.3.6
ENV HADOOP_HOME /opt/hadoop
ENV PATH $PATH:$HADOOP_HOME/bin:$HADOOP_HOME/sbin:$JAVA_HOME/bin

# Java 설치 확인
RUN java -version
RUN ls -la $JAVA_HOME/bin/java

# Hadoop 설치
RUN wget https://downloads.apache.org/hadoop/common/hadoop-$HADOOP_VERSION/hadoop-$HADOOP_VERSION.tar.gz \
    && tar -xzvf hadoop-$HADOOP_VERSION.tar.gz -C /opt/ \
    && mv /opt/hadoop-$HADOOP_VERSION /opt/hadoop \
    && rm hadoop-$HADOOP_VERSION.tar.gz

# SSH 설정
RUN ssh-keygen -t rsa -P '' -f ~/.ssh/id_rsa && \
    cat ~/.ssh/id_rsa.pub >> ~/.ssh/authorized_keys

COPY hadoop-env.sh $HADOOP_HOME/etc/hadoop/hadoop-env.sh
COPY core-site.xml $HADOOP_HOME/etc/hadoop/core-site.xml
COPY hdfs-site.xml $HADOOP_HOME/etc/hadoop/hdfs-site.xml
COPY yarn-site.xml $HADOOP_HOME/etc/hadoop/yarn-site.xml
COPY start-hadoop.sh /usr/local/bin/start-hadoop.sh

RUN chmod +x /usr/local/bin/start-hadoop.sh

CMD ["start-hadoop.sh"]
