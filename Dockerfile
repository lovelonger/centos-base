# Mycat Openep Dockerfile

FROM docker pull daocloud.io/lovelonger/centos:master-init
MAINTAINER tanmingxiao <tanmingxiao@gmail.com>

ADD modules/centos6 tmp/_dt/
RUN sh /tmp/_dt/install.sh

VOLUME /opt/data-vol

#      ssh   web supervisor
EXPOSE 2222  80  9001      

CMD ["/usr/bin/supervisord"]
