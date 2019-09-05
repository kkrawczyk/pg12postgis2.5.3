FROM postgres:12
LABEL Description="Postgres 12 with Postgis 2.5.3" Version="pg12postgis2.5.3" maintainer="krzysztof@krawczyk.czest.pl"

RUN apt update && \
    apt install -y postgresql-server-dev-12 build-essential libxml2-dev libgdal-dev libproj-dev libjson-c-dev xsltproc docbook-xsl docbook-mathml wget bzip2 && \
    mkdir /src && \
    cd /src && \
    wget http://download.osgeo.org/geos/geos-3.7.2.tar.bz2 && \
    tar xfj geos-3.7.2.tar.bz2 && \
    cd geos-3.7.2 && \
    ./configure && \
    make && \
    make install && \
    cd /src && \
    wget http://download.osgeo.org/postgis/source/postgis-2.5.3.tar.gz && \
    tar xfz postgis-2.5.3.tar.gz && \
    cd postgis-2.5.3 && \
    ./configure && \
    make && \
    make install && \
    ldconfig && \
    make comments-install && \
    rm -rf /var/lib/apt/lists/* && \
    apt-get purge -y --auto-remove && \
    rm -rf /src/*
