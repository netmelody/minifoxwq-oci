# minifoxwq-oci

Creates a OCI (docker) image for running minifoxwq

```bash
docker run --rm -it -v /tmp/.X11-unix:/tmp/.X11-unix -e DISPLAY=$DISPLAY -h $HOST -v $HOME/.Xauthority:/root/.Xauthority --device /dev/snd docker.io/netmelody/minifoxwq-oci 
```
