FROM alpine:3.4

USER root

ENV HUGO_VERSION=0.40.3
ENV HUGO_SHA256=a3913a5aca407b8badaba30dec764c2615fc59dd0e73129ddaf5cca0e75a475f

RUN apk add --update --no-cache bash ca-certificates curl python py-pip wget openssh rsync pip awscli pygments

RUN curl -Ls https://github.com/spf13/hugo/releases/download/v${HUGO_VERSION}/hugo_${HUGO_VERSION}_Linux-64bit.tar.gz \
       -o /tmp/hugo.tar.gz \
    && echo "${HUGO_SHA256}  /tmp/hugo.tar.gz" | sha256sum -c - \
    && tar xf /tmp/hugo.tar.gz -C /tmp/ \
    && mv /tmp/hugo /usr/bin/hugo \
    && rm -rf /tmp/hugo*

RUN hugo version