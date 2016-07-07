FROM ubuntu:14.04
MAINTAINER Synctree Appforce

RUN apt-get update && \
  apt-get install -y curl && \
  echo 'deb http://pkg.cloudflare.com/ trusty main' | tee /etc/apt/sources.list.d/cloudflare-main.list && \
  curl -C - https://pkg.cloudflare.com/pubkey.gpg | apt-key add - && \
  apt-get update && \
  apt-get install -y railgun-stable && \
  apt-get autoremove -y &&  \
  apt-get clean && \
  rm -rf /var/lib/apt/lists/*

ADD bin/docker-entrypoint.sh /entrypoint.sh
ADD bin/start-railgun.sh /start-railgun
ADD config/generate-config.sh /generate-config.sh

EXPOSE 2408
EXPOSE 24088

ENTRYPOINT ["/entrypoint.sh"]
CMD ["/start-railgun"]
