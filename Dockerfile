FROM osrf/ros:noetic-desktop-full

RUN sudo sh -c 'echo "deb http://packages.ros.org/ros/ubuntu $(lsb_release -sc) main" > /etc/apt/sources.list.d/ros-latest.list'

RUN apt-get update && \
    apt-get install -y --no-install-recommends \
    gdb \
    apt-utils \
    python3-rosdep \
    python3-pip \
    python3-vcstool \
    python3-pymodbus \
    build-essential \
    ros-noetic-catkin \
    python-catkin-tools \
    ros-noetic-ros-controllers \
    nano \
    ros-noetic-soem \
    libvlccore-dev \
    libvlc-dev \
    git 

# Make the prompt a little nicer
RUN echo "PS1='${debian_chroot:+($debian_chroot)}\u@:\w\$ '" >> /etc/bash.bashrc 

#RUN /bin/bash -c '. /opt/ros/$ROS_DISTRO/setup.bash; cd teaching_ws; catkin build'

#RUN echo "source /opt/ros/$ROS_DISTRO/setup.bash" >> /etc/bash.bashrc
#RUN echo "source /teaching_ws/devel/setup.bash" >> /etc/bash.bashrc

#WORKDIR /teaching_ws
#COPY /teaching_ws/src /teaching_ws/src
#RUN rosdep update
#RUN rosdep install --from-paths src --ignore-src -r -y

RUN echo "source /opt/ros/$ROS_DISTRO/setup.bash" >> /etc/bash.bashrc

ENTRYPOINT ["./ros_entrypoint.sh"]
CMD [ "bash" ]



