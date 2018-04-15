FROM macpaw/internship

ENV GOPATH /go
ENV GETIP_PORT 8080

RUN apt install -y vim curl wget tree grep sed zip \
                   build-essential logrotate golang

RUN rm /app/* /etc/logrotate.d/* /etc/nginx/conf.d/nginx.conf

COPY getip /go/src/getip

COPY src /app

COPY nginx.conf /etc/nginx/conf.d/nginx.conf

COPY logrotate.conf /etc/logrotate.conf

COPY entrypoint.sh /entrypoint.sh

RUN cd ${GOPATH}/src/getip && \
    go get ./... && go build && cd - && \
    logrotate -v --force /etc/logrotate.conf

EXPOSE 80
