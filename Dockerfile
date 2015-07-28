FROM ubuntu:14.04
MAINTAINER Rui Shen <rui@voltdb.com>

# Public VoltDB ports
EXPOSE 22 5555 8080 8081 9000 21211 21212

# Internal VoltDB ports
EXPOSE 3021 4560 9090

# Set up environment
RUN apt-get update && apt-get install -y --no-install-suggests --no-install-recommends procps psmisc python openjdk-7-jre-headless
RUN locale-gen en_US.UTF-8

# Set VoltDB environment variables
ENV VOLTDB_DIST=/opt/voltdb VOLTDB_HEAPMAX=1024
ENV PATH=$PATH:$VOLTDB_DIST/bin

# Set locale-related environment variables
ENV LANG=en_US.UTF-8 LANGUAGE=en_US:en LC_ALL=en_US.UTF-8

# Set timezone
ENV TZ=America/New_York
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone

ADD voltdb $VOLTDB_DIST
WORKDIR $VOLTDB_DIST

