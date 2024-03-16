# minifoxwq-oci

An OCI (docker) image for running [minifoxwq](https://openfoxwq.github.io/)

Built images are hosted on [Docker Hub](https://hub.docker.com/r/netmelody/minifoxwq-oci).

If you just want to play Go, you can just run the following command.
(Works on podman too: just substitute docker for podman).

```bash
docker run --rm -it \
--hostname "$(hostname)" \
--env "DISPLAY=${DISPLAY}" \
--env "PULSE_SERVER=unix:${XDG_RUNTIME_DIR}/pulse/native" \
--env 'MINIFOXWQ_DATA_DIR=/root/.minifoxdata' \
--device '/dev/snd' \
--volume '/tmp/.X11-unix:/tmp/.X11-unix' \
--volume "${HOME}/.Xauthority:/root/.Xauthority" \
--volume "${XDG_RUNTIME_DIR}/pulse/native:${XDG_RUNTIME_DIR}/pulse/native" \
--volume "${HOME}/.config/pulse/cookie:/root/.config/pulse/cookie" \
--volume "${HOME}/.minifoxdata:/root/.minifoxdata" \
--workdir '/root/.minifoxdata' \
--publish '3001:3001' \
docker.io/netmelody/minifoxwq-oci
```

# Motivation
minifoxwq is a closed source binary, which you might not trust. Running it in a container is safer.