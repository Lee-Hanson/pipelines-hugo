FROM jtilander/dev-debug
MAINTAINER Jim Tilander

USER root

ENV HUGO_VERSION=0.29
RUN apk add --no-cache --update wget ca-certificates && \
        cd /tmp/ && \
        wget https://github.com/spf13/hugo/releases/download/v${HUGO_VERSION}/hugo_${HUGO_VERSION}_Linux-64bit.tar.gz && \
        tar xzf hugo_${HUGO_VERSION}_Linux-64bit.tar.gz && \
        rm -r hugo_${HUGO_VERSION}_Linux-64bit.tar.gz && \
        mv hugo*/hugo* /usr/bin/hugo

RUN pip install --disable-pip-version-check --no-cache-dir pygments
