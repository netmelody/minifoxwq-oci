# minifoxwq-oci

Creates a OCI (docker) image for running minifoxwq

docker run --rm -it -v /tmp/.X11-unix:/tmp/.X11-unix -e DISPLAY=$DISPLAY -h $HOST -v $HOME/.Xauthority:/root/.Xauthority docker.io/netmelody/minifoxwq-oci 
