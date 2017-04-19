FROM ubuntu:16.04
ENV HOME /cab
ENV PATH /cab/bin:$PATH

## Locales
# https://github.com/docker-library/postgres/blob/69bc540ecfffecce72d49fa7e4a46680350037f9/9.6/Dockerfile#L21-L24
# make the "en_US.UTF-8" locale so postgres will be utf-8 enabled by default
RUN apt-get update && apt-get install -y locales && rm -rf /var/lib/apt/lists/* \
  && localedef -i en_US -c -f UTF-8 -A /usr/share/locale/locale.alias en_US.UTF-8
ENV LANG en_US.utf8

## Docker
RUN set -x \
  && apt-get update && apt-get install -y ca-certificates curl && rm -rf /var/lib/apt/lists/*

# https://github.com/docker-library/docker/blob/56215ac49d9947e317154fad823410df1201089b/17.05-rc/Dockerfile#L8-L19
ENV DOCKER_BUCKET test.docker.com
ENV DOCKER_VERSION 17.05.0-ce-rc1
ENV DOCKER_SHA256 4561742c2174c01ffd0679621b66d29f8a504240d79aa714f6c58348979d02c6

RUN set -x \
  && curl -fSL "https://${DOCKER_BUCKET}/builds/Linux/x86_64/docker-${DOCKER_VERSION}.tgz" -o docker.tgz \
  && echo "${DOCKER_SHA256} *docker.tgz" | sha256sum -c - \
  && tar -xzvf docker.tgz \
  && mv docker/* /usr/local/bin/ \
  && rmdir docker \
  && rm docker.tgz \
  && docker -v

COPY docker-entrypoint.sh /usr/local/bin/
RUN chmod +x /usr/local/bin/docker-entrypoint.sh

## Tools
RUN set -x \
  && apt-get update && apt-get install -y git && rm -rf /var/lib/apt/lists/*

ENTRYPOINT ["docker-entrypoint.sh"]

CMD ["bash"]
