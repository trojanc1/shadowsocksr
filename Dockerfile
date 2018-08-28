FROM alpine:3.7


RUN apk --no-cache add python \
    libsodium \
    wget

ARG BRANCH=manyuser
ARG WORK=opt


RUN apk --no-cache add python \
    libsodium \
    wget


RUN mkdir -p $WORK && \
    wget -qO- --no-check-certificate https://github.com/trojanc1/shadowsocksr/archive/$BRANCH.tar.gz | tar -xzf - -C $WORK

WORKDIR $WORK/shadowsocksr-$BRANCH/shadowsocks

CMD python server.py -c ../config.json

