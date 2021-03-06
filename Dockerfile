# Mycat Openep Dockerfile

#FROM daocloud.io/lovelonger/centos:master-init
FROM index.tenxcloud.com/kirito/centos-6
MAINTAINER tanmingxiao <tanmingxiao@gmail.com>

RUN git clone https://github.com/lovelonger/centos-base.git ; mkdir -p tmp/_dt/ ; mv centos-base/* tmp/_dt/
RUN sh tmp/_dt/modules/install.sh

VOLUME /opt/data-vol

#      ssh   web supervisor zookeeper jboss ofbiz1  ofbiz2
EXPOSE 2222  80  9001       2181      8081  8080    8443

CMD ["/usr/bin/supervisord"]
