FROM quay.io/centos/centos:stream9

LABEL maintainer="ashish"

ENV NAME="ashishp"

RUN dnf -y update && \
    dnf -y install httpd && \
    dnf clean all && \
    mkdir -p /var/www/sample

WORKDIR /var/www/html

COPY index.html .

EXPOSE 80

CMD ["/usr/sbin/httpd", "-D", "FOREGROUND"]