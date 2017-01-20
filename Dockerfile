FROM ubuntu:16.04

WORKDIR /dokuwiki
ADD . .

RUN bash install_dokuwiki.sh

EXPOSE 80

CMD tail -f /dev/null 

