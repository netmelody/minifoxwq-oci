FROM docker.io/ubuntu:jammy AS build

RUN apt-get update \
 && apt-get install --assume-yes wget unzip \
 && wget --no-verbose https://github.com/openfoxwq/openfoxwq.github.io/releases/download/v0.9/minifox-v0.9-linux.zip \
 && unzip -qq -d minifox minifox-v0.9-linux.zip

FROM docker.io/ubuntu:jammy

RUN apt-get update \
 && apt-get install -y ffmpeg libsm6 libxext6 sqlite3

COPY --from=build /minifox /opt/minifox
ENTRYPOINT ["/opt/minifox/minifox"]
