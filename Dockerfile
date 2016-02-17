FROM docker.io/jbonachera/consul-template:latest

MAINTAINER Julien BONACHERA <julien@bonachera.fr>
RUN dnf install -y php-fpm nginx php-dom php-apc php-pdo && \
    dnf clean all
ONBUILD COPY php.conf /etc/php-fpm.d/www.conf
ONBUILD COPY consul-template.d/* /etc/consul-template/
ONBUILD COPY vhosts.d/* /etc/nginx/conf.d/
EXPOSE 80 443
COPY nginx.conf /etc/nginx/nginx.conf

