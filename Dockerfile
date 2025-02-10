FROM ros:humble-ros-core-jammy

RUN apt update && apt install -y --no-install-recommends \
  git \
  vim \
  build-essential \
  python3-rosdep \
  python3-vcstool \
  python-is-python3 \
  python3-pip \
  python3-colcon-common-extensions \
  && rm -rf /var/lib/apt/lists/*

ENV DEBIAN_FRONTEND=noninteractive

RUN mkdir -p /krr_ws/src
COPY dependencies.rosinstall /krr_ws/dependencies.rosinstall

WORKDIR /krr_ws
RUN vcs import src < dependencies.rosinstall --recursive

RUN ["/bin/bash", "-c", "source /opt/ros/humble/setup.bash \
      && apt update \
      && rosdep init \
      && rosdep update \
      && rosdep install --from-paths src --ignore-src -r -y \
      && sudo rm -rf /var/lib/apt/lists/"]

RUN ["/bin/bash", "-c", "source /opt/ros/humble/setup.bash \
      && colcon build --symlink-install"]

COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
CMD ["bash"]
