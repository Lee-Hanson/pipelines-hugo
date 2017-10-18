FROM alpine:3.4

USER root

ENV HUGO_VERSION=0.29
ENV HUGO_SHA256=80011b40b64781a5adfbf882fe3ab3b3c526e9ba8583fb532cd2331ffbe44a9e

RUN apk add --update --no-cache \
  bash \
  ca-certificates \
  curl \
  python \
  py-pip \
  wget \
  rsync

RUN pip install --upgrade pip \
    && pip install -U awscli \
    && pip install --disable-pip-version-check --no-cache-dir pygments

RUN apk add --no-cache --update wget ca-certificates

RUN curl -Ls https://github.com/spf13/hugo/releases/download/v${HUGO_VERSION}/hugo_${HUGO_VERSION}_Linux-64bit.tar.gz \
       -o /tmp/hugo.deb \
  && echo "${HUGO_SHA256}  /tmp/hugo.tar.gz" | sha256sum -c - \
  && tar xf /tmp/hugo.tar.gz -C /tmp \
  && ls -lah /tmp/hugo \
  && mv /tmp/hugo_${HUGO_VERSION}_linux_amd64/hugo_${HUGO_VERSION}_linux_amd64 /usr/bin/hugo \
  && rm -rf /tmp/hugo* \
