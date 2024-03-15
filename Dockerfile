FROM docker.io/ubuntu:jammy AS build

RUN apt-get update \
 && apt-get install --assume-yes wget unzip \
 && wget --no-verbose https://github.com/openfoxwq/openfoxwq.github.io/releases/download/v0.14/minifox-v0.14-linux.zip \
 && unzip -qq -d minifox minifox-v0.14-linux.zip

FROM docker.io/ubuntu:jammy

RUN apt-get update \
 && apt-get install -y ffmpeg libsm6 libxext6 libopengl0 sqlite3 ca-certificates

COPY --from=build /minifox /opt/minifox
WORKDIR /root
ENTRYPOINT ["/opt/minifox/minifox"]

