#!/bin/sh -eu

podman pull docker.io/netmelody/minifoxwq-oci

CONFIG_DIR="${HOME}/.config/minifoxwq"
DOWNLOADS_DIR="${HOME}/Downloads/minifoxwq"

mkdir -p "${CONFIG_DIR}/data"
mkdir -p "${DOWNLOADS_DIR}"
touch "${CONFIG_DIR}/imgui.ini"

podman run --rm -it \
--hostname "$(hostname)" \
--env "DISPLAY=${DISPLAY}" \
--env "PULSE_SERVER=unix:${XDG_RUNTIME_DIR}/pulse/native" \
--env 'MINIFOXWQ_DATA_DIR=/root/.minifoxdata' \
--device '/dev/snd' \
--volume '/tmp/.X11-unix:/tmp/.X11-unix' \
--volume "${HOME}/.Xauthority:/root/.Xauthority" \
--volume "${XDG_RUNTIME_DIR}/pulse/native:${XDG_RUNTIME_DIR}/pulse/native" \
--volume "${HOME}/.config/pulse/cookie:/root/.config/pulse/cookie" \
--volume "${CONFIG_DIR}/data:/root/.minifoxdata" \
--volume "${CONFIG_DIR}/imgui.ini:/root/imgui.ini" \
--volume "${DOWNLOADS_DIR}:/root/downloads" \
--workdir '/root' \
--publish '3001:3001' \
docker.io/netmelody/minifoxwq-oci
