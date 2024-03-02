# minifoxwq-oci

Creates a OCI (docker) image for running minifoxwq

```bash
docker run --rm -it \
--volume /tmp/.X11-unix:/tmp/.X11-unix \
--env DISPLAY=${DISPLAY} \
--hostname ${HOST} \
--volume ${HOME}/.Xauthority:/root/.Xauthority \
--device /dev/snd \
--env PULSE_SERVER=unix:${XDG_RUNTIME_DIR}/pulse/native \
--volume ${XDG_RUNTIME_DIR}/pulse/native:${XDG_RUNTIME_DIR}/pulse/native \
--volume ${HOME}/.config/pulse/cookie:/root/.config/pulse/cookie \
docker.io/netmelody/minifoxwq-oci 
```

or, on podman:
```bash
podman run --rm -it \
--volume /tmp/.X11-unix:/tmp/.X11-unix \
--env DISPLAY=${DISPLAY} \
--hostname ${HOST} \
--volume ${HOME}/.Xauthority:/root/.Xauthority \
--device /dev/snd \
--env PULSE_SERVER=unix:${XDG_RUNTIME_DIR}/pulse/native \
--volume ${XDG_RUNTIME_DIR}/pulse/native:${XDG_RUNTIME_DIR}/pulse/native \
--volume ${HOME}/.config/pulse/cookie:/root/.config/pulse/cookie \
--network slirp4netns:port_handler=slirp4netns \
docker.io/netmelody/minifoxwq-oci
```
