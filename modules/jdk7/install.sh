#!/bin/bash

pkg='jdk-7u80-linux-x64.tar.gz'
ver='jdk1.7.0_80'
dest='/opt/javahome'

[ -f "../cache/${pkg}" ] && pkg="../cache/${pkg}" || wget --no-cookies --no-check-certificate --header "Cookie: gpw_e24=http%3A%2F%2Fwww.oracle.com%2F; oraclelicense=accept-securebackup-cookie" "http://download.oracle.com/otn-pub/java/jdk/7u80-b15/${pkg}"

cp jdk.sh /etc/profile.d/
mkdir -p ${dest}
tar zxf ${pkg} -C ${dest}
cd ${dest}
ln -s ${ver} jdk7
[ ! -d jdk ] && ln -s ${ver} jdk

rm -f ${ver}/src.zip
rm -rf ${ver}/db
