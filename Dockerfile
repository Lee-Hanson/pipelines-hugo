FROM alpine:3.4

USER root

ENV HUGO_VERSION="0.49.2"

RUN apk add --update --no-cache bash ca-certificates curl git python py-pip wget openssh rsync \
    && pip install --upgrade pip \
    && pip install --no-cache-dir awscli pygments

RUN curl -Ls https://github.com/spf13/hugo/releases/download/v${HUGO_VERSION}/hugo_${HUGO_VERSION}_Linux-64bit.tar.gz \
    -o /tmp/hugo.tar.gz \
    && echo "`curl -sL https://github.com/gohugoio/hugo/releases/download/v${HUGO_VERSION}/hugo_${HUGO_VERSION}_checksums.txt | grep hugo_${HUGO_VERSION}_Linux-64bit.tar.gz | cut -c1-64`  /tmp/hugo.tar.gz" | sha256sum -c - \
    && tar xf /tmp/hugo.tar.gz -C /tmp/ \
    && mv /tmp/hugo /usr/bin/hugo \
    && rm -rf /tmp/hugo*

RUN hugo version
