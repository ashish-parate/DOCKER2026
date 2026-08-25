FROM quay.io/centos/centos:stream9

ENV TOMCAT_VERSION=10.1.59
ENV JAVA_HOME=/usr/lib/jvm/java-17-openjdk
ENV CATALINA_HOME=/opt/apache-tomcat
ENV PATH=$CATALINA_HOME/bin:$PATH

# Install Java, wget and tar
RUN dnf install -y java-17-openjdk wget tar \
    && dnf clean all \
    && rm -rf /var/cache/dnf

# Download and install Tomcat
RUN wget https://dlcdn.apache.org/tomcat/tomcat-10/v${TOMCAT_VERSION}/bin/apache-tomcat-${TOMCAT_VERSION}.tar.gz \
    && tar -xzf apache-tomcat-${TOMCAT_VERSION}.tar.gz \
    && mv apache-tomcat-${TOMCAT_VERSION} ${CATALINA_HOME} \
    && rm -f apache-tomcat-${TOMCAT_VERSION}.tar.gz

# Expose Tomcat port
EXPOSE 8080

# Start Tomcat
CMD ["catalina.sh", "run"]