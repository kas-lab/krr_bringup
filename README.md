# krr_bringup
ROS Meta Package for the Knowledge Representation and Reasoning course of TU Delft Robotics Masters

## Build docker image

```bash
docker build -t krr_ws .
```

## Run docker

Allow docker to use gui:
```Bash
xhost +
```

Start docker container:
```Bash
docker run -it --rm -e DISPLAY=$DISPLAY -v /tmp/.X11-unix:/tmp/.X11-unix:ro krr_ws
```

<!-- Dev option:

```Bash
docker run -it --rm -e DISPLAY=$DISPLAY -v $HOME/navigation_ws/src:/krr_ws/src -v /tmp/.X11-unix:/tmp/.X11-unix:ro krr_ws
``` -->