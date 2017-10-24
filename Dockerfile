FROM ubuntu:16.04

ENV DELUGE_CONFIG=/config \
    DELUGE_WEB_PORT=8282

RUN apt-get update && \
    apt-get install -y vim net-tools software-properties-common && \
    add-apt-repository ppa:deluge-team/ppa && \
    apt-get update && \
    apt-get install -y deluge-webui deluged && \
    groupadd -g 1000 deluge && \
    useradd -d $DELUGE_CONFIG -g 1000 -u 1000 deluge && \
    mkdir -p $DELUGE_CONFIG && \
    chown -R deluge:deluge $DELUGE_CONFIG

VOLUME /config

USER deluge

EXPOSE 8282 8444 58846

COPY docker-entrypoint.sh /docker-entrypoint.sh
ENTRYPOINT ["/docker-entrypoint.sh"]

CMD ["/bin/sh", "-c", "/usr/bin/deluge-web -p $DELUGE_WEB_PORT -c $DELUGE_CONFIG"]
