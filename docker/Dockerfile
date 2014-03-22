FROM busybox
MAINTAINER Harald Weber <harald.h.weber@gmail.com>

ADD opentracker /bin/opentracker
ADD opentracker.conf /etc/opentracker.conf

EXPOSE 6969

CMD ["/bin/opentracker", "-f /etc/opentracker.conf"]

