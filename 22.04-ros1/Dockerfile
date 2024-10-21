# Docker file for ROS install

FROM osrf/ros:noetic-desktop-full

RUN apt-get update && \
	apt-get install -y git python3-pip x11-apps

ARG user=dfseifer
ARG home=/home/$user
RUN groupadd -g 1000 $user
RUN useradd -d $home -s /bin/bash -m $user -u 1000 -g 1000 \
        && echo $user:ubuntu | chpasswd \
        && adduser $user sudo
WORKDIR $home
USER $user
ENV HOME=$home

RUN mkdir -p ~/catkin_ws/src && \
	cd ~/catkin_ws/src && \
	git clone https://github.com/UNR-RoboticsResearchLab/hri_projects_2024.git && \
	git clone https://github.com/ros-naoqi/nao_robot.git && \
	cd ~/catkin_ws

#RUN echo "ALL Done"

#COPY /ros_entrypoint.sh ~
ENTRYPOINT ["/ros_entrypoint.sh"] 

CMD ["/usr/bin/xeyes"]
