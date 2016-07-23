FROM solr:latest

MAINTAINER Leonard Marschke <github@marschke.me>

ADD solr_core /opt/solr/server/solr/dovecot

USER root

RUN chown -R solr:solr /opt/solr/server/solr/dovecot

USER solr
