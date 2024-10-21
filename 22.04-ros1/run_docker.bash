## run this script to enabel GUI

xhost +local:docker
xhost +SI:localuser:$(id -un)
#XAUTH=/tmp/.docker.xauth

docker run -it \
	--env=DISPLAY=:0 \
	--env="QT_X11_NO_MITSHM=1" \
	--volume="/tmp/.X11-unix:/tmp/.X11-unix:rw" \
	--user=$(id -u):$(id -g) \
	ros_test bash



		#-e XDG_RUNTIME_DIR=/tmp \
	#-e WAYLAND_DISPLAY=$WAYLAND_DISPLAY \
	#-v $XDG_RUNTIME_DIR/$WAYLAND_DISPLAY:/tmp/$WAYLAND_DISPLAY \

echo "Done."
