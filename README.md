# RoboCup2019 Rescue Simulation Virtual Robot League

##  Installation   
You can install Ros(Kinetic), Gazebo 8, necessary packages by the following command using the ubuntu 16.04:  

    $ sudo sh -c 'echo "deb http://packages.ros.org/ros/ubuntu $(lsb_release -sc) main" > /etc/apt/sources.list.d/ros-latest.list'   
    $ sudo apt-key adv --keyserver hkp://pool.sks-keyservers.net --recv-key 0xB01FA116   
    $ sudo sh -c 'echo "deb http://packages.osrfoundation.org/gazebo/ubuntu `lsb_release -cs` main" > /etc/apt/sources.list.d/gazebo-latest.list'   
    $ wget http://packages.osrfoundation.org/gazebo.key -O - | sudo apt-key add -     
    $ sudo apt-get update   
    $ sudo apt-get install -y cmake g++ protobuf-compiler pavucontrol libignition-math3 libsdformat5 libignition-math3-dev libignition-msgs0-dev gazebo8-plugin-base libgazebo8 libgazebo8-dev ros-kinetic-desktop  ros-kinetic-ros-control ros-kinetic-ros-controllers ros-kinetic-image-view2 ros-kinetic-rqt ros-kinetic-rqt-common-plugins ros-kinetic-joy ros-kinetic-teleop-twist-keyboard ros-kinetic-message-to-tf ros-kinetic-tf2-geometry-msgs ros-kinetic-audio-common ros-kinetic-costmap-2d ros-kinetic-image-transport ros-kinetic-image-transport-plugins ros-kinetic-hector-mapping ros-kinetic-hector-geotiff
    $ sudo apt-get install ros-kinetic-hector-pose-estimation ros-kinetic-hector-sensors-description ros-kinetic-controller-manager ros-kinetic-gmapping ros-kinetic-move-base ros-kinetic-hector-mapping ros-kinetic-gazebo8*


##  Network Setup

check the network folder and setup your computer based on the corresponding files.  


## Server Setup
You have to do "catkin_make" 4 times for building WCS.  
WCS has a custom message type, the message type will be compling later than WCS source codes, even if their dependencies was defined.  
Thus, please do "catkin_make" 4 times, with ignoring errors about WCS package.  
After 4 times catkin_make, if you still encount some errors, please contact us.  

    $ git clone https://github.com/RoboCupRescueVirtualRobotLeague/RoboCup2019RVRL_Practice  
    $ cd ~/RoboCup2019RVRL_Practice/src  
    $ git clone -b Gazebo8 https://github.com/taherahmadi/WCS  
    $ cd ..  
    $ ./cleanup  
    $ catkin_make  
    $ catkin_make  
    $ catkin_make  
    $ catkin_make  

## Server Setup  
Select one launch file and spawn the server application.  
Then goto the next section "Run the robot controller".  

### Launch the gazebo server and robots 1: maze_3levels.launch   
This world has 3 levels and one pioneer3at robot.  
Each level dimension is 10m x 10m.  
The lowest level and the middle level is connected by a 30 degree slope.  
The 30 deglee slope dimension is 3m holizontal length and about 1.7m high.  
The middle level and the top level is connected by a 20 degree slope.  
The 20 deglee slope dimension is 3m holizontal length and about 1.1m high.  
The pioneer3at robot can climb the 30 degree slope, but pioneer2dx cannot.  
How about a crowler robot?  

    At terminal 1:  

    $ cd ~/RoboCup2019RVRL_Practice  
    $ . setup.bash  
    $ roslaunch rvrl_setup maze-3levels.launch  

### Launch the gazebo server and robots 2: pre_outdoor_1.launch   
This world includes the RoboCup WCS 2018 pre_outdoor_1 world and 5 type robots.  

    At terminal 1:  

    $ cd ~/RoboCup2019RVRL_Practice  
    $ . setup.bash  
    $ roslaunch rvrl_setup pre_outdoor_1.launch  

## Run the robot controller
### For wheel robots  

    At terminal 2:  

    $ rosrun teleop_twist_keyboard teleop_twist_keyboard.py cmd_vel:=/robot1/cmd_vel  

### For quadrotor robot  

    At terminal 2:  

    $ cd ~/RoboCup2019RVRL_Practice  
    $ . setup.bash  
    $ roslaunch hector_quadrotor_teleop logitech_gamepad.launch robot:=robot1  
    (Push button4, to start motors)  

### For crawler robot   

    At terminal 2:  

    $ cd ~/RoboCup2019RVRL_Practice  
    $ . setup.bash  
    $ roslaunch rvrl_setup sample_joy_and_teleop_crawler.launch gc_bsgp1601:=true robot_name:=robot1  
    (You can select your game controller from 4 types, details in the launch file.)  

### For centaur robot   

    At terminal 2:  

    $ cd ~/RoboCup2019RVRL_Practice  
    $ . setup.bash  
    $ roslaunch rvrl_setup sample_centaur_joint_trajectory.launch robot_name:=robot5  

    At terminal 3:  

    $ rosrun teleop_twist_keyboard teleop_twist_keyboard.py cmd_vel:=/robot5/cmd_vel  

### About WCS  
Please read the documents of [WCS](https://github.com/taherahmadi/WCS/blob/master/README.md) and [WCS sample package](https://github.com/taherahmadi/WCS/blob/master/sample_package/README.md).  

Edited: 14th June 2019
