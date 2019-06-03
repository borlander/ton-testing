FROM ubuntu:18.04

ARG ROOT=/ton
ARG LITECLIENT_TAR=ton-test-liteclient-full.tar.xz
ARG LITECLIENT=lite-client
ARG BUILD_ROOT=liteclient-build
ARG CONFIG_FILE=ton-lite-client-test1.config.json
ENV CONFIG_FILE=$CONFIG_FILE

RUN mkdir $ROOT

WORKDIR $ROOT

#RUN sudo apt-get install -y wget xz-utils make cmake g++ clang libssl-dev gperf ccache zlib1g-dev libreadline-dev
RUN apt-get update \
    && apt-get install -y wget \
    && apt-get install -y xz-utils \
    && apt-get install -y make cmake g++ clang \
    && apt-get install -y libssl-dev \
    && apt-get install -y gperf ccache zlib1g-dev libreadline-dev \
    && rm -rf /var/lib/apt/lists/*

#RUN wget https://test.ton.org/ton-test-liteclient-full.tar.xz && tar -xf ton-test-liteclient-full.tar.xz
RUN wget https://test.ton.org/$LITECLIENT_TAR \
    && tar -xf $LITECLIENT_TAR

RUN mkdir $BUILD_ROOT

WORKDIR $BUILD_ROOT

RUN cmake $ROOT/$LITECLIENT
RUN cmake --build . --target test-lite-client
RUN cmake --build . --target fift
RUN wget https://test.ton.org/$CONFIG_FILE

RUN echo "finished build"

CMD ./test-lite-client -C $CONFIG_FILE





