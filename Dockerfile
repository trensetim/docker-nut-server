FROM alpine:3.15
MAINTAINER Tim Trense <me@timtrense.com>
RUN echo '@testing http://dl-cdn.alpinelinux.org/alpine/edge/testing' >> /etc/apk/repositories
RUN apk add --update --no-cache nut@testing=2.7.4-r10 libcrypto1.1 libssl1.1 net-snmp-libs
RUN mkdir /var/run/nut
COPY entrypoint.sh /bin/entrypoint.sh
RUN chmod +x /bin/entrypoint.sh
EXPOSE 3493
ENTRYPOINT ["sh", "/bin/entrypoint.sh"]
