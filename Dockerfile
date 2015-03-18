FROM debian:wheezy

RUN apt-get update && apt-get upgrade -y
RUN echo 'deb http://files.freeswitch.org/repo/deb/debian/ wheezy main' >> /etc/apt/sources.list.d/freeswitch.list
RUN apt-get install -y curl
RUN curl http://files.freeswitch.org/repo/deb/debian/freeswitch_archive_g0.pub | apt-key add -
RUN apt-get update
RUN apt-get install freeswitch-meta-vanilla -y
RUN apt-get install -y tmux vim
RUN cp -r /usr/share/freeswitch/conf/vanilla /etc/freeswitch

ADD acl.conf.xml.sh /etc/freeswitch/autoload_configs/acl.conf.xml.sh
ADD public.xml /etc/freeswitch/dialplan/public.xml

CMD sh /etc/freeswitch/autoload_configs/acl.conf.xml.sh && freeswitch
