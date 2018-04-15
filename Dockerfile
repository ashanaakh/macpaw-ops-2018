FROM macpaw/internship

ENV GOPATH /go
ENV GETIP_PORT 8080

RUN apt install -y vim curl wget zip logrotate golang

RUN rm /app/* /etc/logrotate.d/* /etc/nginx/conf.d/*

COPY getip /go/src/getip

COPY src /app

COPY cfg/nginx.conf /etc/nginx/conf.d/nginx.conf

COPY cfg/logrotate.conf /etc/logrotate.conf

COPY scripts/* /

RUN cd ${GOPATH}/src/getip && \
    go get ./... && go build && cd - && \
    logrotate -v --force /etc/logrotate.conf

EXPOSE 80
