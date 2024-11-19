# syntax=docker/dockerfile:1

FROM ghcr.io/linuxserver/baseimage-alpine:3.20

# set version label
ARG BUILD_DATE
ARG VERSION
ARG JACKETT_RELEASE
LABEL build_version="Linuxserver.io version:- ${VERSION} Build-date:- ${BUILD_DATE}"
LABEL maintainer="thelamer"

# environment settings
ENV XDG_DATA_HOME="/config" \
  XDG_CONFIG_HOME="/config" \
  TMPDIR=/run/jackett-temp

RUN \
  echo "**** install packages ****" && \
  apk --no-cache add \
    icu-data-full \
    icu-libs && \
  echo "**** install jackett ****" && \
  mkdir -p \
    /app/

COPY ./Jackett /app/Jackett

# add local files
COPY root/ /

# ports and volumes
VOLUME /config

EXPOSE 9117
