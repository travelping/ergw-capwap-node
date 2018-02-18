# -- build-environment --
# see https://docs.docker.com/engine/userguide/eng-image/multistage-build/

FROM    alpine:3.7 AS build-env

ARG     BUILD_PROFILE=prod+native
WORKDIR /build
RUN     apk update && apk --no-cache upgrade && \
        apk --no-cache add \
            erlang \
                erlang-asn1 erlang-compiler erlang-crypto erlang-dev \
                erlang-diameter erlang-eunit erlang-hipe erlang-inets \
                erlang-kernel erlang-parsetools erlang-public-key \
                erlang-runtime-tools erlang-sasl erlang-ssl erlang-stdlib \
                erlang-syntax-tools \
            gcc \
            git \
            libc-dev libc-utils \
            libgcc \
            linux-headers \
            make \
            musl-dev musl-utils \
            pcre2 \
            pkgconf \
            scanelf \
            wget \
            zlib

RUN     wget -O /usr/local/bin/rebar3 https://s3.amazonaws.com/rebar3/rebar3 && \
        chmod a+x /usr/local/bin/rebar3

ADD     . /build
RUN     export BUILD_PROFILE=$(echo $BUILD_PROFILE | sed 's/+/,/g') && \
        echo "build as $BUILD_PROFILE" && \
        rebar3 as $BUILD_PROFILE get-deps && \
        rebar3 as $BUILD_PROFILE release

# -- runtime image --

FROM    alpine:3.7

ARG     BUILD_PROFILE=prod+native
WORKDIR /
RUN     apk update && \
        apk --no-cache upgrade && \
        apk --no-cache add ncurses-libs libcrypto1.0
COPY    docker/docker-entrypoint.sh /
COPY    config/ergw-capwap-node.config /etc/ergw-capwap-node/

RUN     mkdir -p /var/lib/ergw/ && \
        touch /var/lib/ergw/ergw.state

COPY    --from=build-env /build/_build/${BUILD_PROFILE}/rel/ /opt/

ENTRYPOINT ["/docker-entrypoint.sh"]
CMD     ["/opt/ergw-capwap-node/bin/ergw-capwap-node", "foreground"]
