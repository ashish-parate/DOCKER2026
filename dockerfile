FROM httpd:2.4

RUN echo "<h1>HELLO WORLD</h1>" > /usr/local/apache2/htdocs/index.html

EXPOSE 80

CMD ["httpd-foreground"]