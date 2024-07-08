#This file already containe tortoisebot (which contains basic pkg for starting gazebo)
FROM tianyaoh501679/tianyaoh-cp22:tortoisebot-ros1-gazebo

# Git clone the waypoint test into catkin_ws
WORKDIR /root/catkin_ws/src
RUN git clone https://github.com/tianyaohu/ros1_tortoisebot_rostest.git

#Catkin_make and source workspace
WORKDIR /root/catkin_ws
RUN source /opt/ros/noetic/setup.bash && \
    catkin_make && \
    echo "source /root/catkin_ws/devel/setup.bash" >> ~/.bashrc
