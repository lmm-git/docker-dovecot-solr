# Docker image of a running solr instance for dovecot
This repo contains a running instance of solr optimized for dovecot.

## Build architecture
The images are automatically build at the docker hub: https://hub.docker.com/r/lmmdock/dovecot-solr

## Tested with

* dovecot 2.2.9 on Ubuntu 14.04 LTS

## First steps
Before you start please note the two main problems with this docker image:

1. This image contains a solr instance which is not compatible to dovecot by default
2. This image **does not** support any authentication or encryption

### Installation of solr

Simply execute

```bash
docker run -d -p 127.0.0.1:8983:8983 -t lmmdock/dovecot-solr:latest
```
on your server running `dovecot`

Afterwards you can access the solr admin panel at http://127.0.0.1:8983/solr

### Hooking up dovecot
Dovecot seems not to supoort newer solr versions by default (check http://dovecot.org/list/dovecot/2015-June/101207.html for more information)

It seems to be a problem with dovecots header setting here: https://github.com/dovecot/core/blob/master/src/plugins/fts-solr/solr-connection.c#L490

I think the `text/xml` string is the problem because `text/html` is not a valid content type; I tried to change it to `application/xml` but unfortunatly this didn't work either. For me the solution was to remove this line simply. Afterwards dovecot was communication correctly with solr.

**Due to this problem you have to compile dovecot by yourself!**

Afterwards you have to configure the solr usage in dovecot like described at http://wiki2.dovecot.org/Plugins/FTS/Solr

Please note that the url schema has changed a bit; you probably should use this url: `http://localhost:8983/solr/dovecot/`
