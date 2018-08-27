FROM alpine:3.7

ENV SERVER_ADDR     0.0.0.0
ENV SERVER_PORT     5585
ENV PASSWORD        yfyfy516
ENV METHOD          chacha20
ENV PROTOCOL        auth_chain_a
ENV PROTOCOLPARAM   32
ENV OBFS            plain
ENV TIMEOUT         300
ENV DNS_ADDR        8.8.8.8
ENV DNS_ADDR_2      8.8.4.4

ARG BRANCH=manyuser
ARG WORK=~


RUN apk --no-cache add python \
    libsodium \
    wget


RUN mkdir -p $WORK && \
    wget -qO- --no-check-certificate https://github.com/trojanc1/shadowsocksr/archive/$BRANCH.tar.gz | tar -xzf - -C $WORK


WORKDIR $WORK/shadowsocksr-$BRANCH/shadowsocks


EXPOSE $SERVER_PORT
CMD python server.py -p $SERVER_PORT -k $PASSWORD -m $METHOD -O $PROTOCOL -o $OBFS -G $PROTOCOLPARAM
