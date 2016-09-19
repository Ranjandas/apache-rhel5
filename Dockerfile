FROM centos:5

MAINTAINER Ranjandas A P <thejranjan@gmail.com>

# Install basic build tools

RUN yum install -y gcc gcc-c++ make rpm-build epel-release yum-utils && yum clean all


ENV APR_VERSION 1.5.2
ENV APR_RELEASE 1

ENV APR_UTIL_VERSION 1.5.4
ENV APR_UTIL_RELEASE 1

ENV HTTPD_VERSION 2.4.20
ENV HTTPD_RELEASE 1

ENV PCRE_VERSION 7.8
ENV PCRE_RELEASE 7

COPY files/apr-$APR_VERSION.tar.bz2 /usr/src/redhat/SOURCES/
COPY files/apr-util-$APR_UTIL_VERSION.tar.bz2 /usr/src/redhat/SOURCES/
COPY files/httpd-$HTTPD_VERSION.tar.bz2 /usr/src/redhat/SOURCES/
COPY files/pcre-$PCRE_VERSION-$PCRE_RELEASE.el6.src.rpm /usr/src/redhat/SOURCES/

COPY files/specs/*.spec /usr/src/redhat/SPECS/

COPY files/build.sh /
RUN chmod +x /build.sh

ENTRYPOINT ["/build.sh"]
