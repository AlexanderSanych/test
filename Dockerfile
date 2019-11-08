FROM ubuntu:18.04

MAINTAINER Sanych

# ----------------------------------------------------------------------------------
RUN apt-get update && apt-get install -y build-essential libpcre++-dev libssl-dev zlib1g-dev wget unzip \
&&  cd /root && wget http://nginx.org/download/nginx-1.17.4.tar.gz && tar -zxvf nginx-1.17.4.tar.gz \
&&  cd /root/nginx-1.17.4 && ./configure --prefix=/etc/nginx \
    --sbin-path=/usr/sbin/nginx \
    --conf-path=/etc/nginx/nginx.conf \
    --error-log-path=/var/log/nginx/error.log \
    --http-log-path=/var/log/nginx/access.log \
    --pid-path=/var/run/nginx.pid \
    --lock-path=/var/run/nginx.lock \
    --http-client-body-temp-path=/var/cache/nginx/client_temp \
    --http-proxy-temp-path=/var/cache/nginx/proxy_temp \
    --http-fastcgi-temp-path=/var/cache/nginx/fastcgi_temp \
    --user=nginx \
    --group=nginx \
    --without-http_autoindex_module \
    --without-http_ssi_module \
    --without-http_scgi_module \
    --without-http_uwsgi_module \
    --without-http_geo_module \
    --without-http_split_clients_module \
    --without-http_memcached_module \
    --without-http_empty_gif_module \
    --without-http_browser_module \
    --with-http_ssl_module \
    --with-http_v2_module \
    --with-http_realip_module \
    --with-http_auth_request_module \
    --with-http_stub_status_module \
    --with-http_random_index_module \
    --with-threads \
&&  make && make install && make clean && cd /root && rm -f nginx-1.17.4.tar.gz && rm -rf nginx-1.17.4 \
&&  apt-get -y remove build-essential wget && apt-get clean && apt-get -y autoremove
# ----------------------------------------------------------------------------------
RUN mkdir -p /nonexistent /var/log/nginx /var/cache/nginx/client_temp /var/cache/nginx/fastcgi_temp /var/cache/nginx/proxy_temp /var/cache/nginx/scgi_temp /var/cache/nginx/uwsgi_temp \
&& adduser --system --home /nonexistent --shell /bin/false --no-create-home --disabled-login --disabled-password --gecos "nginx user" --group nginx \
&& chmod 700 /var/cache/nginx/* && chown nginx:root /var/cache/nginx/* \
&& ln -s /dev/stdout /var/log/nginx/access.log && ln -s /dev/stderr /var/log/nginx/error.log

COPY index.html /etc/nginx/html/

EXPOSE 80

CMD ["nginx","-g","daemon off;"]
