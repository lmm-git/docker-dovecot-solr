FROM solr:latest

MAINTAINER Leonard Marschke <github@marschke.me>

ADD solr_core /opt/solr/server/solr/dovecot

USER root

RUN chown -R solr:solr /opt/solr/server/solr/dovecot

# higher heap size to handle large mailboxes
RUN sed -i 's/#SOLR_HEAP="512m"/SOLR_HEAP="4096m"/g' /etc/default/solr.in.sh

USER solr
