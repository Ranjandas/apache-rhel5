#!/bin/bash

# Build and Install APR

yum-builddep -y apr && \
        rpmbuild -bb /usr/src/redhat/SPECS/apr.spec && \
        rpm -ivh /usr/src/redhat/RPMS/x86_64/apr-$APR_VERSION-$APR_RELEASE.x86_64.rpm && \
        rpm -ivh /usr/src/redhat/RPMS/x86_64/apr-devel-$APR_VERSION-$APR_RELEASE.x86_64.rpm


# Build and Install APR-Utils

yum-builddep -y apr-util && \
        yum install -y freetds-devel unixODBC-devel nss-devel && \
        rpmbuild --nodeps -bb /usr/src/redhat/SPECS/apr-util.spec && \
        rpm -ivh /usr/src/redhat/RPMS/x86_64/apr-util-$APR_UTIL_VERSION-$APR_UTIL_RELEASE.x86_64.rpm && \
        rpm -ivh /usr/src/redhat/RPMS/x86_64/apr-util-devel-$APR_UTIL_VERSION-$APR_UTIL_RELEASE.x86_64.rpm


# Build and Install PCRE

rpm -ivh --nomd5 /usr/src/redhat/SOURCES/pcre-$PCRE_VERSION-$PCRE_RELEASE.el6.src.rpm && \
        rpmbuild -bb /usr/src/redhat/SPECS/pcre.spec && \
        rpm -Uvh /usr/src/redhat/RPMS/x86_64/pcre-$PCRE_VERSION-$PCRE_RELEASE.x86_64.rpm && \
        rpm -Uvh /usr/src/redhat/RPMS/x86_64/pcre-devel-$PCRE_VERSION-$PCRE_RELEASE.x86_64.rpm

# Build and Install Apache HTTPD

yum-builddep -y httpd && \
	yum install -y libxml2-devel lua-devel && \
        rpmbuild --nodeps -bb /usr/src/redhat/SPECS/httpd.spec && \
        yum localinstall -y --nogpgcheck /usr/src/redhat/RPMS/x86_64/httpd*

