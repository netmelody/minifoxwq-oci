FROM docker.io/ubuntu:jammy AS build

ENV MINIFOX_VERSION=0.14
RUN apt-get update \
 && apt-get install --assume-yes wget unzip \
 && wget --no-verbose "https://github.com/openfoxwq/openfoxwq.github.io/releases/download/v${MINIFOX_VERSION}/minifox-v${MINIFOX_VERSION}-linux.zip" \
 && unzip -qq -d minifox "minifox-v${MINIFOX_VERSION}-linux.zip"

FROM docker.io/ubuntu:jammy

RUN apt-get update \
 && apt-get install --assume-yes --no-install-recommends ffmpeg libsm6 libxext6 libopengl0 sqlite3 ca-certificates \
 && apt-get clean \
 && rm -rf /var/lib/apt/lists/*

COPY --from=build /minifox /opt/minifox
WORKDIR /root
ENTRYPOINT ["/opt/minifox/minifox"]
