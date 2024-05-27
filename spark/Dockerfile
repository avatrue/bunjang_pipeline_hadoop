FROM ubuntu:20.04

# 기본 패키지 설치
RUN apt-get update && apt-get install -y openjdk-8-jdk wget

# 환경 변수 설정
ENV JAVA_HOME /usr/lib/jvm/java-8-openjdk-arm64
ENV SPARK_VERSION 3.1.2
ENV SPARK_HOME /opt/spark
ENV PATH $PATH:$SPARK_HOME/bin:$JAVA_HOME/bin

# Java 설치 확인
RUN java -version
RUN ls -la $JAVA_HOME/bin/java

# Spark 설치
RUN wget https://archive.apache.org/dist/spark/spark-$SPARK_VERSION/spark-$SPARK_VERSION-bin-hadoop3.2.tgz \
    && tar -xzvf spark-$SPARK_VERSION-bin-hadoop3.2.tgz -C /opt/ \
    && mv /opt/spark-$SPARK_VERSION-bin-hadoop3.2 /opt/spark \
    && rm spark-$SPARK_VERSION-bin-hadoop3.2.tgz

COPY spark-env.sh $SPARK_HOME/conf/spark-env.sh
COPY start-spark.sh /usr/local/bin/start-spark.sh

RUN chmod +x /usr/local/bin/start-spark.sh

CMD ["start-spark.sh"]
