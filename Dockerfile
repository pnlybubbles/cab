FROM ubuntu:16.04
ENV HOME /cab
ENV PATH /cab/bin:$PATH

## Init

RUN apt-get update

## Locales
# https://github.com/docker-library/postgres/blob/69bc540ecfffecce72d49fa7e4a46680350037f9/9.6/Dockerfile#L21-L24
# make the "en_US.UTF-8" locale so postgres will be utf-8 enabled by default
RUN set -x \
  && apt-get install -y locales \
  && localedef -i en_US -c -f UTF-8 -A /usr/share/locale/locale.alias en_US.UTF-8
ENV LANG en_US.utf8

## Docker
RUN set -x \
  && apt-get install -y ca-certificates curl

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

## Git
RUN set -x \
  && apt-get install -y git

## zsh
ENV ZPLUG_HOME /home/.zplug
ENV ZPLUG_CACHE_DIR $HOME/.zplug/.cache
ENV ZPLUG_REPOS $HOME/.zplug/repos
ENV ZPLUG_BIN $HOME/.zplug/bin
RUN set -x \
  && apt-get install -y zsh \
  && chsh -s `which zsh` \
  && git clone https://github.com/zplug/zplug $ZPLUG_HOME
RUN set -x \
  && curl -fsL https://raw.githubusercontent.com/git/git/master/contrib/completion/git-completion.zsh -O \
  && curl -fsL https://raw.githubusercontent.com/git/git/master/contrib/completion/git-completion.bash -O \
  && mkdir -p /home/.zsh/completion \
  && mv git-completion.zsh /home/.zsh/completion \
  && mv git-completion.bash /home/.zsh/completion

## vim
RUN set -x \
  && apt-get install -y software-properties-common \
  && add-apt-repository -y ppa:neovim-ppa/unstable \
  && apt-get update \
  && apt-get install neovim \
  && apt-get remove -y software-properties-common
RUN set -x \
  && curl https://raw.githubusercontent.com/Shougo/dein.vim/master/bin/installer.sh > installer.sh \
  && sh installer.sh /home/.dein \
  && rm installer.sh
RUN set -x \
  && apt-get install -y python3-dev python3-pip \
  && pip3 install --upgrade pip
RUN pip3 install neovim

## tmux
RUN set -x \
  && apt-get install -y build-essential automake pkg-config libevent-dev libncurses5-dev \
  && git clone --depth=1 -b 2.3 https://github.com/tmux/tmux.git \
  && cd tmux \
  && ./autogen.sh \
  && ./configure \
  && make \
  && make install \
  && apt-get remove -y build-essential automake pkg-config libevent-dev libncurses5-dev \
  && cd .. \
  && rm -rf tmux

## ag
RUn set -x \
  && apt-get install -y silversearcher-ag

## Clean
RUN rm -rf /cab/* \
  rm -rf /var/lib/apt/lists/*

## USER
RUN cat /etc/passwd | sed -e 's/\/root/\/cab/' > /etc/passwd

ENTRYPOINT ["docker-entrypoint.sh"]
