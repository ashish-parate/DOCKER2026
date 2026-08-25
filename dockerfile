FROM quay.io/centos/centos:stream9

ENV TOMCAT_VERSION=10.1.59
ENV CATALINA_HOME=/opt/apache-tomcat
ENV PATH=$CATALINA_HOME/bin:$PATH

RUN dnf install -y java-17-openjdk java-17-openjdk-devel wget tar \
    && dnf clean all \
    && rm -rf /var/cache/dnf
WORKDIR /opt/apache-tomcat
COPY student.war ./webapps/
# Set JAVA_HOME to the installed JDK
RUN JAVA_HOME=$(dirname $(dirname $(readlink -f $(which java)))) \
    && echo "JAVA_HOME=$JAVA_HOME" \
    && ln -s $JAVA_HOME /opt/java

ENV JAVA_HOME=/opt/java

RUN wget https://dlcdn.apache.org/tomcat/tomcat-10/v${TOMCAT_VERSION}/bin/apache-tomcat-${TOMCAT_VERSION}.tar.gz \
    && tar -xzf apache-tomcat-${TOMCAT_VERSION}.tar.gz \
    && mv apache-tomcat-${TOMCAT_VERSION} ${CATALINA_HOME} \
    && rm -f apache-tomcat-${TOMCAT_VERSION}.tar.gz

EXPOSE 8080

CMD ["catalina.sh", "run"]