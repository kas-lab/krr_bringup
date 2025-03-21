# krr_bringup
ROS Meta Package for the course project in the Knowledge Representation and Reasoning course of TU Delft Robotics Masters

## Get docker image

Build docker image:
```Bash
docker build -t krr_ws .
```

Or pull the latest docker image:
```Bash
docker pull ghcr.io/kas-lab/krr_bringup:main
```

## Run docker

Allow docker to use gui:
```Bash
xhost +
```

Start docker container:
```Bash
docker run -it --rm -e DISPLAY=$DISPLAY -v /tmp/.X11-unix:/tmp/.X11-unix:ro -v $HOME/krr_ws/src:/krr_ws/src krr_ws
```

<!-- Dev option:

```Bash
docker run -it --rm -e DISPLAY=$DISPLAY -v $HOME/navigation_ws/src:/krr_ws/src -v /tmp/.X11-unix:/tmp/.X11-unix:ro krr_ws
``` -->

## Run PDDL example for the MIRTE robot


In terminal 1:

```Bash
docker run -it --rm -e DISPLAY=$DISPLAY -v /tmp/.X11-unix:/tmp/.X11-unix:ro krr_ws
```

Then:
```Bash
ros2 launch mirte_gazebo gazebo_mirte_master_navigation.launch.py
```

In terminal 2:

```Bash
docker run -it --rm -e DISPLAY=$DISPLAY -v /tmp/.X11-unix:/tmp/.X11-unix:ro krr_ws
```

```Bash
ros2 launch krr_mirte_pddl krr_mirte_pddl_launch.py
```

OR:

Terminal 1:
```Bash
docker run -it --rm -e DISPLAY=$DISPLAY -v /tmp/.X11-unix:/tmp/.X11-unix:ro ghcr.io/kas-lab/krr_bringup:main ros2 launch mirte_gazebo gazebo_mirte_master_navigation.launch.py
```

Terminal 2:
```Bash
docker run -it --rm -e DISPLAY=$DISPLAY -v /tmp/.X11-unix:/tmp/.X11-unix:ro ghcr.io/kas-lab/krr_bringup:main ros2 launch krr_mirte_pddl krr_mirte_pddl_launch.py
```