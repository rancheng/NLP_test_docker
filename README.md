# Docker for NLP

|Platform | Version|
|---|---|
|Ubuntu|16.04|
|gcc|5.4.0|
|ldd|2.23|
|cmake|3.5.1|
|python|3.6.8|
|conda|4.10.1|

A dummy docker environment for several NLP tasks.

### Dependencies

Please install docker by following this official tutorial:

 - [Ubuntu](https://docs.docker.com/engine/install/ubuntu/)
 - [MacOS](https://docs.docker.com/docker-for-mac/install/)
 - [Windows](https://docs.docker.com/docker-for-windows/install/)

Since docker has GUI tools for `Mac` and `Windows` platform, they didn't offer a very detailed comandline tutorials. please go to `terminal` to build docker images and run the containers.

### Run

This package is shipped with a `Dockerfile` which `buil.sh` will find automatically and execute the instruction inside to build the docker image, simply run the following command:

```shell
git clone https://github.com/rancheng/NLP_test_docker
cd NLP_test_docker
./build.sh
```

Then the docker image will be built automatically, the next step is to run the `run.sh` file to execute the image and load as a running container:

```shell
./run.sh
```