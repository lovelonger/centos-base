# Mycat Openep Dockerfile

FROM daocloud.io/lovelonger/centos:master-init
MAINTAINER tanmingxiao <tanmingxiao@gmail.com>

RUN git clone https://github.com/lovelonger/centos-base.git ; mv centos-base/* tmp/_dt/
RUN sh /tmp/_dt/modules/install.sh

VOLUME /opt/data-vol

#      ssh   web supervisor
EXPOSE 2222  80  9001      

CMD ["/usr/bin/supervisord"]
