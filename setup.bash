source devel/setup.bash
export GAZEBO_MODEL_PATH=`pwd`/models_robots_victims:`pwd`/models_others:${GAZEBO_MODEL_PATH}
export GAZEBO_PLUGIN_PATH=`pwd`/devel/lib:/opt/ros/kinetic/lib:${GAZEBO_PLUGIN_PATH}
#export GAZEBO_RESOURCE_PATH=`pwd`:${GAZEBO_RESOURCE_PATH}

