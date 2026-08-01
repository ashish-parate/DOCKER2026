FROM centos

RUN yum install httpd -y

RUN echo "<h1>HELLO WORLD</h1>" > /var/www/html/index.html

CMD httpd -DFOREGROUND

EXPOSE 80

