FROM python:2-alpine
MAINTAINER "EEA: IDM2 A-Team" <eea-edw-a-team-alerts@googlegroups.com>

ENV FLAKE8_VERSION=3.9.1

RUN apk add --no-cache --virtual .run-deps git \
&& pip install flake8==$FLAKE8_VERSION \
&& mkdir -p /code

COPY docker-entrypoint.sh /docker-entrypoint.sh
RUN chmod 777 /docker-entrypoint.sh

ENTRYPOINT ["/docker-entrypoint.sh"]
CMD ["flake8"]
