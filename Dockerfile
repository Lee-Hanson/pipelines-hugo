FROM alpine:3.4

USER root

ENV HUGO_VERSION="0.41"
ENV HUGO_SHA256="e7f3b5f7552305020e426fa4a2bf1a1ca570886acc0f037b4d74e85a51fa175b"

RUN apk add --update --no-cache bash ca-certificates curl python py-pip wget openssh rsync \
    && pip install --upgrade pip \
    && pip install --no-cache-dir awscli pygments

RUN curl -Ls https://github.com/spf13/hugo/releases/download/v${HUGO_VERSION}/hugo_${HUGO_VERSION}_Linux-64bit.tar.gz \
       -o /tmp/hugo.tar.gz \
    && echo "${HUGO_SHA256}  /tmp/hugo.tar.gz" | sha256sum -c - \
    && tar xf /tmp/hugo.tar.gz -C /tmp/ \
    && mv /tmp/hugo /usr/bin/hugo \
    && rm -rf /tmp/hugo*

RUN hugo version
