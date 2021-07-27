FROM python:3.9.6-buster

LABEL version="1.0.0"
LABEL repository="https://github.com/totaldebug/sphinx-publish-action"
LABEL homepage="https://github.com/totaldebug/sphinx-publish-action"
LABEL maintainer="Steven Marks <marksie1988@github.com>"

# debug
RUN apt update -y
RUN apt upgrade -y
RUN apt install curl dh-autoreconf libcurl4-gnutls-dev libexpat1-dev gettext libz-dev libssl-dev install-info -y

RUN wget https://github.com/git/git/archive/refs/tags/v2.32.0.tar.gz
RUN tar -zxf v2.32.0.tar.gz
RUN make configure
RUN ./configure --prefix=/usr
RUN make install install-info

RUN pip install -U sphinx poetry
RUN sphinx-build --version

COPY LICENSE README.rst /

COPY entrypoint.sh /
RUN chmod +x /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
