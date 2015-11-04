#!/bin/bash
ver='jboss-as-7.1.1.Final'
pkg="${ver}.zip"
dest='/opt/'
prg=`pwd`

[ -f "../cache/${pkg}" ] && pkg="../cache/${pkg}" || wget http://download.jboss.org/jbossas/7.1/${ver}/${pkg}

mkdir -p ${dest}
yum install unzip -y
unzip -q ${pkg} -d ${dest}
cd ${dest}
mv jboss-as-7.1.1.Final jboss-7.1.1
\cp ${prg}/standalone.xml jboss-7.1.1/standalone/configuration/
#nohup sh jboss-7.1.1/bin/standalone.sh &

cat > /etc/supervisord.d/jboss.conf << EOF
[program:jboss]
command=/opt/jboss-7.1.1/bin/standalone.sh
priority=1500
stopsignal=INT
stopasgroup=true
autorestart=true
EOF
