FROM phusion/baseimage:0.9.16
MAINTAINER pcjacobse <pcjacobse@gmail.com>
ENV DEBIAN_FRONTEND noninteractive

# Set correct environment variables
ENV HOME /root

# Use baseimage-docker's init system
CMD ["/sbin/my_init"]

# Fix a Debianism of the nobody's uid being 65534
RUN usermod -u 99 nobody
RUN usermod -g 100 nobody

RUN add-apt-repository "deb http://us.archive.ubuntu.com/ubuntu/ trusty universe multiverse"
RUN add-apt-repository "deb http://us.archive.ubuntu.com/ubuntu/ trusty-updates universe multiverse"
RUN apt-get update -qq
RUN apt-get install -qqy unrar python wget

RUN mkdir /opt/couchpotato
RUN wget https://github.com/RuudBurger/CouchPotatoServer/archive/master.tar.gz -O /tmp/couchpotato.tar.gz
RUN tar -C /opt/couchpotato -xvf /tmp/couchpotato.tar.gz --strip-components 1
RUN chown nobody:users /opt/couchpotato

# Path to a directory that only contains the sabnzbd.conf
VOLUME /config
VOLUME /downloads
VOLUME /movies

EXPOSE 5050

# Add sabnzbd to runit
RUN mkdir /etc/service/couchpotato
ADD couchpotato.sh /etc/service/couchpotato/run
RUN chmod +x /etc/service/couchpotato/run

# Clean up APT when done.
RUN apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*
