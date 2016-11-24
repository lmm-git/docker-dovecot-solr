# Docker image of a running solr instance for dovecot
This repo contains a running instance of solr optimized for dovecot.

## Build architecture
The images are automatically build at the docker hub: https://hub.docker.com/r/lmmdock/dovecot-solr

## Tested with

* dovecot 2.2.9 on Ubuntu 14.04 LTS
* dovecot 2.2.22 on Ubuntu 16.04 LTS

## First steps
Before you start please note the two main problems with this docker image:

1. This image contains a solr instance which is not compatible to all versions of dovecot by default; up to date versions should work out of the box
2. This image **does not** support any authentication or encryption

### Installation of solr

Simply execute

```bash
docker run -d -p 127.0.0.1:8983:8983 -t lmmdock/dovecot-solr:latest
```
on your server running `dovecot`

Afterwards you can access the solr admin panel at http://127.0.0.1:8983/solr

### Hooking up dovecot
Afterwards you have to configure the solr usage in dovecot like described at http://wiki2.dovecot.org/Plugins/FTS/Solr

Please note that the url schema has changed a bit; you probably should use this url: `http://localhost:8983/solr/dovecot/`

#### Dovecot 2.2.9
With dovecot version 2.2.9 there is a problem with dovecot's header setting here: https://github.com/dovecot/core/blob/master/src/plugins/fts-solr/solr-connection.c#L490

I solved the problem by removing the line completly.

More information: http://dovecot.org/list/dovecot/2015-June/101207.html

#### Dovecot 2.2.22
Working out of the box.
