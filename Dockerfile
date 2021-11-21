FROM alpine:3.15
MAINTAINER Tim Trense <me@timtrense.com>
RUN echo '@testing http://dl-cdn.alpinelinux.org/alpine/edge/testing' >> /etc/apk/repositories
RUN apk add --update --no-cache nut@testing=2.7.4-r10 libcrypto1.1 libssl1.1 net-snmp-libs
RUN apk add bash
RUN mkdir /var/run/nut
RUN chmod 700 /var/run/nut
RUN chmod 700 /etc/nut/upsd.conf
RUN chmod 700 /etc/nut/upsd.users
RUN touch /var/run/nut/upsd.pid
RUN chmod 700 /var/run/nut/upsd.pid
COPY entrypoint.sh /bin/entrypoint.sh
RUN chmod +x /bin/entrypoint.sh
EXPOSE 3493
ENTRYPOINT ["sh", "/bin/entrypoint.sh"]
