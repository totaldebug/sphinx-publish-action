FROM python:3.9.6-alpine

LABEL version="1.0.0"
LABEL repository="https://github.com/totaldebug/sphinx-publish-action"
LABEL homepage="https://github.com/totaldebug/sphinx-publish-action"
LABEL maintainer="Steven Marks <marksie1988@github.com>"

# debug
RUN apk add --no-cache git build-base
RUN apk add --update curl

RUN pip install -U sphinx
RUN sphinx-build --version

COPY LICENSE README.rst /

COPY entrypoint.sh /
RUN chmod +x /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
