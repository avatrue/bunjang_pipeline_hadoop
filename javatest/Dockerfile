# 기본 이미지를 최신 Ubuntu로 설정
FROM ubuntu:20.04

# 비대화식 모드로 설정하여 설치 시 질문 방지
ENV DEBIAN_FRONTEND=noninteractive

# 기본 패키지 설치
RUN apt-get update && apt-get install -y openjdk-8-jdk wget ssh rsync

# 환경 변수 설정
ENV JAVA_HOME /usr/lib/jvm/java-8-openjdk-arm64
ENV PATH $JAVA_HOME/bin:$PATH

# 기본 명령 설정 (옵션)
CMD ["java", "-version"]
