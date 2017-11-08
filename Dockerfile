FROM        ubuntu:15.10
LABEL  jsongo
 
ENV DEBIAN_FRONTEND noninteractive
RUN apt-get -qq update
RUN apt-get install -y varnish

ADD default.vcl /etc/varnish/default.vcl

ENV VARNISH_PORT 80
EXPOSE 80

ADD parse /parse
ADD start /start

RUN chmod 0755 /start /parse

CMD ["/start"]
