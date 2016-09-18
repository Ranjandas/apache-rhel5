# Building Apache HTTPD 2.4.23 RPM for CentOS5/RHEL5

## Setting up build container

```
docker run -d --name httpd-c5 centos:5 /bin/sleep infinity

docker cp httpd-2.4.23.tar.bz2 httpd-c5:/root
docker cp apr-1.5.2.tar.bz2 httpd-c5:/root
docker cp apr-util-1.5.4.tar.bz2 httpd-c5:/root
```

Install bzip2 for extracting the archives

```
yum install bzip2
```

Install rpmbuild and build dependencies

```
yum install -y rpm-build yum-utils epel-release

yum-builddep httpd
```

Try to build httpd rpm using rpmbuild

```
rpmbuild -tb httpd-2.4.23.tar.bz2 
error: Failed build dependencies:
        libuuid-devel is needed by httpd-2.4.23-1.x86_64
        apr-devel >= 1.4.0 is needed by httpd-2.4.23-1.x86_64
        apr-util-devel >= 1.4.0 is needed by httpd-2.4.23-1.x86_64
        lua-devel is needed by httpd-2.4.23-1.x86_64
        libxml2-devel is needed by httpd-2.4.23-1.x86_64
```

Now we have to install libxml2-devel and lua-devel 

```
yum install libxml2-devel lua-devel
```
