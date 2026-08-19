FROM quay.io/centos/centos:stream9

LABEL maintainer="ashish"

ENV NAME="ashishp"

RUN dnf -y update && \
    dnf -y install httpd && \
    dnf clean all && \
    mkdir -p /var/www/html/sample

WORKDIR /var/www/html

COPY index.html .

ADD https://s3-us-west-2.amazonaws.com/studentapi-cit/index.html sample/index.html
RUN chmod -R 755 /var/www/html/sample
EXPOSE 80

CMD ["/usr/sbin/httpd", "-D", "FOREGROUND"]