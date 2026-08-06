FROM quay.io/centos/centos:stream9

LABEL maintainer="ashish"

ENV name="ashishp"

RUN dnf -y update && \
    dnf -y install httpd && \
    mkdir  /var/www/sample
    

WORKDIR /var/www/html

USER root

COPY index.html /var/www/html/index.html

ADD https://templatemo.com/download/templatemo_630_helix_drift /var/www/sample  

CMD ["httpd", "-D", "FOREGROUND"]

ENTRYPOINT [ "httpd","-D", "FOREGROUND" ]

EXPOSE 80
