FROM alpine:3.4

USER root

ENV HUGO_VERSION=0.38.2
ENV HUGO_SHA256=9e5b7cd79e4732c4fdf82210450e39cc588935fdc8ecf4a590219d7b4b2a389a

RUN apk add --update --no-cache bash ca-certificates curl python py-pip wget openssh rsync \
    && pip install --upgrade pip \
    && pip install -U awscli \
    && pip install --disable-pip-version-check --no-cache-dir pygments

RUN curl -Ls https://github.com/spf13/hugo/releases/download/v${HUGO_VERSION}/hugo_${HUGO_VERSION}_Linux-64bit.tar.gz \
       -o /tmp/hugo.tar.gz \
    && echo "${HUGO_SHA256}  /tmp/hugo.tar.gz" | sha256sum -c - \
    && tar xf /tmp/hugo.tar.gz -C /tmp/ \
    && mv /tmp/hugo /usr/bin/hugo \
    && rm -rf /tmp/hugo*

RUN hugo version