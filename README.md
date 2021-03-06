# RoboCup2019 Rescue Simulation Virtual Robot League
This repository includes a robot model and field models used in RoboCup World Champion Ship 2019 Rescue Simulation Virtual Robot League(RC2019RVRL).  
You can find other records of the RC2019RVRL game in [wiki page of this repository](https://github.com/RoboCupRescueVirtualRobotLeague/RoboCup2019RVRL_Demo/wiki).
And you can find important information like the latest rule in [the rescue virtual robot league wiki page](https://rescuesim.robocup.org/).  

##  INSTALLATION BASICS   
You can install Ros(Melodic), Gazebo 9, necessary packages by the following command using the ubuntu 18.04:  

    $ sudo sh -c 'echo "deb http://packages.ros.org/ros/ubuntu $(lsb_release -sc) main" > /etc/apt/sources.list.d/ros-latest.list'   
    $ sudo apt-key adv --keyserver hkp://pool.sks-keyservers.net --recv-key 0xB01FA116   
    $ sudo sh -c 'echo "deb http://packages.osrfoundation.org/gazebo/ubuntu `lsb_release -cs` main" > /etc/apt/sources.list.d/gazebo-latest.list'   
    $ wget http://packages.osrfoundation.org/gazebo.key -O - | sudo apt-key add -     
    $ sudo apt-get update   
    $ sudo apt-get install -y cmake g++ protobuf-compiler pavucontrol gazebo9-plugin-base libgazebo9 libgazebo9-dev ros-melodic-desktop  ros-melodic-ros-control ros-melodic-ros-controllers ros-melodic-image-view2 ros-melodic-rqt ros-melodic-rqt-common-plugins ros-melodic-joy ros-melodic-teleop-twist-keyboard ros-melodic-message-to-tf ros-melodic-tf2-geometry-msgs ros-melodic-audio-common ros-melodic-costmap-2d ros-melodic-image-transport ros-melodic-image-transport-plugins ros-melodic-hector-mapping ros-melodic-hector-geotiff 
    $ sudo apt-get install ros-melodic-hector-sensors-description ros-melodic-controller-manager ros-melodic-gmapping ros-melodic-move-base ros-melodic-hector-mapping ros-melodic-gazebo9*


## SETUP THE NETWORK CONFIGURATION  
Check the network folder and setup your computer based on the corresponding files.  

## SETUP THE SERVER PROGRAM  
Download this repo. and some additional hector packages.  

    $ git clone https://github.com/RoboCupRescueVirtualRobotLeague/RoboCup2019RVRL_Demo  
    $ cd ~/RoboCup2019RVRL_Demo/src  
    $ rosinstall src /opt/ros/melodic  

Remove a conflicting package.  

    $ yes | \rm -r src/hector_gazebo/hector_gazebo_thermal_camera

Finally, compile them.

    $ catkin_make  

## RUN THE SERVER PROGRAM  
Launch the gazebo server and robots.  
Select one launch file from following descriptions.  
And do next sequence with your selected launch file.  
Then goto the next section "CHECK THE INSTALLATION".  

    At terminal 1:  

    $ cd ~/RoboCup2019RVRL_Demo  
    $ . setup.bash  
    $ roslaunch rvrl_setup YOU_SELECTED_ONE.launch  

### Pre liminary 1 (Day 1)
* pre1-1_{ atr | eslam | mrl }.launch  
Three launch files are same except robot names.  
Those robot names are changed for the each team programs.  

### Pre liminary 2 (Day 1)
* pre1-2_{ atr | eslam | mrl }.launch  
Three launch files are same except robot names.  
Those robot names are changed for the each team programs.  

### Pre liminary 3 (Day 2)
* pre2-1_{ atr | eslam | mrl }.launch  
Three launch files are same except robot names.  
Those robot names are changed for the each team programs.  

### Pre liminary 4 (Day 2)
* pre2-2_{ atr | eslam | mrl }.launch  
Three launch files are same except robot names.  
Those robot names are changed for the each team programs.  

### Semi Final 1 (Day 3)
* semi-1-{ atr | eslam | mrl }.launch  
Three launch files are same except robot names.  
Those robot names are changed for the each team programs.  

* two-levels.launch   
This is a practice field for the slope.  

### Semi Final 2 (Day 3)
* semi-2-{ atr | eslam | mrl }.launch  
Three launch files are same except robot names.  
Those robot names are changed for the each team programs.  

### Final (Day 4)
* final-1-{ atr | eslam | mrl }.launch  
Three launch files are same except robot names.  
Those robot names are changed for the each team programs.  

## CHECK THE INSTALLATION
Run the sample robot controller.  
Before tring below, you should check the robot name by using 'rostopic list'.

### For wheel robots  

    At terminal 2:  

    $ rosrun teleop_twist_keyboard teleop_twist_keyboard.py cmd_vel:=/robot1/cmd_vel  

### For quadrotor robot  

    At terminal 2:  

    $ cd ~/RoboCup2019RVRL_Demo  
    $ . setup.bash  
    $ roslaunch hector_quadrotor_teleop logitech_gamepad.launch robot:=robot1  
    (Push button4, to start motors)  

### For crawler robot   

    At terminal 2:  

    $ cd ~/RoboCup2019RVRL_Demo  
    $ . setup.bash  
    $ roslaunch rvrl_setup sample_joy_and_teleop_crawler.launch gc_bsgp1601:=true robot_name:=robot1  
    (You can select your game controller from 4 types, details in the launch file.)  

### For centaur robot   

    At terminal 2:  

    $ cd ~/RoboCup2019RVRL_Demo  
    $ . setup.bash  
    $ roslaunch rvrl_setup sample_centaur_joint_trajectory.launch robot_name:=robot5  

    At terminal 3:  

    $ rosrun teleop_twist_keyboard teleop_twist_keyboard.py cmd_vel:=/robot5/cmd_vel  

### About WCS  
Please read the documents of [WCS](https://github.com/taherahmadi/WCS/blob/master/README.md) and [WCS sample package](https://github.com/taherahmadi/WCS/blob/master/sample_package/README.md).  

### For finding robots in a huge field  
Waiting for finishing spawning all robots, run the next script.  
You can see each robot name in large font size. 

    At another terminal:  

    $ cd ~/RoboCup2019RVRL_Demo  
    $ . robot_marker_on  

Edited: 6th July 2019  
