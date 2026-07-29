FROM centos:7
RUN yum install httpd -y
RUN echo "<h1> HELLO WORLD" >/var/www/html/index.html
cMD ["/usr/sbin/httpd", "-D", "FOREGROUND"]
EXPOSE 80