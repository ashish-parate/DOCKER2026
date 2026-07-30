FROM centos:7

RUN dnf install -y httpd

RUN echo "<h1>HELLO WORLD</h1>" > /var/www/html/index.html

EXPOSE 80

CMD ["/usr/sbin/httpd", "-D", "FOREGROUND"]