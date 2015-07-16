# docker-kcachegrind
Docker with kCacheGrind

## Supported tags

* `latest`

## Description

Looking for a way to open you xdebug profiling logs ? Looking for kCacheGrind but do not want to install all KDE dependencies ? This container is for you !

## How to run this image

### Default configuration

To make it work, you need at least the following arguments:

```
docker run --rm -e DISPLAY -v /tmp/.X11-unix:/tmp/.X11-unix quetzacoalt/kcachegrind
```

The env variable and the folder /tmp/.X11-unix are needed to share your X11 process with the container.
If you meet the following error when trying to launch it "*Error: cannot open display: :0*", use the following command: `xhost +`.

### Share your folder

Because your xdebug profiling files are more likely to be stored on the host, you have to mount a volume to make this folder available in the container:

```
docker run --rm -e DISPLAY -v /tmp/.X11-unix:/tmp/.X11-unix -v /your/xdebug/folder:/any/container/folder quetzacoalt/kcachegrind
```

### Credits
This container is based on the tutorial of Fábio Rehm: http://fabiorehm.com/blog/2014/09/11/running-gui-apps-with-docker/
