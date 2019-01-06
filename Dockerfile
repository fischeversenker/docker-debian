# use a node base image
FROM debian
LABEL maintainer "benlue@s3root.ovh"
RUN apt-get install apache2
RUN echo “Hello Apache server on Ubuntu Docker” > /var/www/html/index.html
EXPOSE 80
CMD /usr/sbin/apache2ctl -D FOREGROUND


