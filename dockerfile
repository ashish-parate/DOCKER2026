FROM quay.io/centos/centos:stream9

ENV TOMCAT_VERSION=10.1.59
ENV CATALINA_HOME=/opt/apache-tomcat
ENV PATH=$CATALINA_HOME/bin:$PATH

# Install Java JDK, wget and tar
RUN dnf install -y java-17-openjdk java-17-openjdk-devel wget tar \
    && dnf clean all \
    && rm -rf /var/cache/dnf

# Detect Java installation and create stable JAVA_HOME
RUN JAVA_HOME=$(dirname $(dirname $(readlink -f $(which java)))) \
    && echo "Java path: $JAVA_HOME" \
    && ln -s $JAVA_HOME /opt/java

ENV JAVA_HOME=/opt/java

# Download Tomcat
RUN wget -O /tmp/tomcat.tar.gz \
    https://dlcdn.apache.org/tomcat/tomcat-10/v${TOMCAT_VERSION}/bin/apache-tomcat-${TOMCAT_VERSION}.tar.gz \
    && tar -xzf /tmp/tomcat.tar.gz -C /opt \
    && mv /opt/apache-tomcat-${TOMCAT_VERSION} ${CATALINA_HOME} \
    && rm -f /tmp/tomcat.tar.gz

# Deploy application
COPY student.war ./webapps/

EXPOSE 8080

CMD ["catalina.sh", "run"]