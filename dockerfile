FROM quay.io/centos/centos:stream9

RUN dnf install httpd -y

RUN echo "<h1>HELLO WORLD</h1>" > /var/www/html/index.html

CMD ["/usr/sbin/httpd", "-D", "FOREGROUND"]

EXPOSE 80
