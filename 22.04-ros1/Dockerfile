# Docker file for ROS install

FROM osrf/ros:noetic-desktop-full

RUN apt-get update && \
	apt-get install -y git python3-pip x11-apps vim nano


### change these to your local username/userid/groupid

ENV USERNAME=dfseifer
ENV UID=1000
ENV GID=1000
ARG home /home/$USERNAME

RUN useradd -m $USERNAME && \
        echo "$USERNAME:$USERNAME" | chpasswd && \
        usermod --shell /bin/bash $USERNAME && \
        usermod -aG sudo $USERNAME && \
        echo "$USERNAME ALL=(ALL) NOPASSWD:ALL" >> /etc/sudoers.d/$USERNAME && \
        chmod 0440 /etc/sudoers.d/$USERNAME && \
        usermod  --uid $UID $USERNAME && \
        groupmod --gid $GID $USERNAME

#ARG user=dfseifer
#RUN groupadd -g 1000 $user
#RUN useradd -d $home -s /bin/bash -m $user -u 1000 -g 1000 \
#        && echo $user:ubuntu | chpasswd \
#        && adduser $user sudo

WORKDIR $home
USER $USERNAME
ENV HOME=$home

#RUN mkdir -p ~/catkin_ws/src && \
#	cd ~/catkin_ws/src && \
#	git clone https://github.com/UNR-RoboticsResearchLab/hri_projects_2024.git && \
#	git clone https://github.com/ros-naoqi/nao_robot.git && \
#	cd ~/catkin_ws

#RUN echo "ALL Done"

#COPY /ros_entrypoint.sh ~
ENTRYPOINT ["/ros_entrypoint.sh"] 

CMD ["/bin/bash"]
