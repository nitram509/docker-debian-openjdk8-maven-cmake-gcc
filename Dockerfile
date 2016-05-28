FROM docker.io/debian:jessie
MAINTAINER Martin W. Kirst "x.nitram509@gmail.com"

ENV JAVA_HOME="/usr/local/jdk" \
    ZULU_DOWNLOAD_URL="http://cdn.azul.com/zulu/bin/zulu8.15.0.1-jdk8.0.92-linux_x64.tar.gz" \
    ZULU_CHECKSUM_MD5="509fef886f7c6992d0f6f133c4928ec9" \
    MAVEN_HOME="/usr/share/maven" \
    MAVEN_VERSION="3.3.9"

RUN cd "/tmp" && \
    apt-get update && \
    apt-get -y install wget && \
#    apt-get -y install pgp && \
    apt-get -y install git && \
    apt-get -y install gcc-4.8 && \
    apt-get -y install g++-4.8 && \
    apt-get -y install make && \
    apt-get -y install cmake && \
    ln -s /usr/bin/cpp-4.8 /usr/bin/cpp && \
    ln -s /usr/bin/gcc-4.8 /usr/bin/gcc && \
    ln -s /usr/bin/gcc-ar-4.8 /usr/bin/gcc-ar && \
    ln -s /usr/bin/gcc-nm-4.8 /usr/bin/gcc-nm && \
    ln -s /usr/bin/gcc-ranlib-4.8 /usr/bin/gcc-ranlib && \
    ln -s /usr/bin/gcov-4.8 /usr/bin/gcov && \
    ln -s /usr/bin/x86_64-linux-gnu-cpp-4.8 /usr/bin/x86_64-linux-gnu-cpp && \
    ln -s /usr/bin/x86_64-linux-gnu-gcc-4.8 /usr/bin/x86_64-linux-gnu-gcc && \
    ln -s /usr/bin/x86_64-linux-gnu-gcc-ar-4.8 /usr/bin/x86_64-linux-gnu-gcc-ar && \
    ln -s /usr/bin/x86_64-linux-gnu-gcc-nm-4.8 /usr/bin/x86_64-linux-gnu-gcc-nm && \
    ln -s /usr/bin/x86_64-linux-gnu-gcc-ranlib-4.8 /usr/bin/x86_64-linux-gnu-gcc-ranlib && \
    ln -s /usr/bin/x86_64-linux-gnu-gcov-4.8 /usr/bin/x86_64-linux-gnu-gcov && \
    echo "installing Maven ..." && \
    wget -q "http://archive.apache.org/dist/maven/maven-3/$MAVEN_VERSION/binaries/apache-maven-$MAVEN_VERSION-bin.tar.gz" -O - | tar xvzf - && \
    mv apache-maven-$MAVEN_VERSION /usr/share/maven && \
    ln -s /usr/share/maven/bin/mvn /usr/bin/mvn && \
    echo "done."
