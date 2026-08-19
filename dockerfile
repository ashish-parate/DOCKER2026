FROM quay.io/centos/centos:stream9

LABEL maintainer="ashish"

# Install Java and required tools
RUN dnf install -y java-17-openjdk wget tar \
    && dnf clean all

# Tomcat version
ENV TOMCAT_VERSION=10.1.57

# Download and install Tomcat
RUN wget https://dlcdn.apache.org/tomcat/tomcat-10/v10.1.57/bin/apache-tomcat-${TOMCAT_VERSION}.tar.gz \
    && tar -xzf apache-tomcat-${TOMCAT_VERSION}.tar.gz \
    && mv apache-tomcat-${TOMCAT_VERSION} /opt/apache-tomcat \
    && rm -f apache-tomcat-${TOMCAT_VERSION}.tar.gz

# Working directory
WORKDIR /opt/apache-tomcat

COPY student.html webapps/ROOT/index.html

# Tomcat port
EXPOSE 8080

# Start Tomcat .
CMD ["./bin/catalina.sh", "run"]