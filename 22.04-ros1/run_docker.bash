## run this script to enabel GUI

xhost +local:docker
#xhost +SI:localuser:$(id -un)
#XAUTH=/tmp/.docker.xauth

docker run -ti -it --rm \
	-e DISPLAY=$DISPLAY \
	-e QT_X11_NO_MITSHM=1 \
	-v /tmp/.X11-unix:/tmp/.X11-unix:rw \
	dfseifer/ros-test



		#-e XDG_RUNTIME_DIR=/tmp \
	#-e WAYLAND_DISPLAY=$WAYLAND_DISPLAY \
	#-v $XDG_RUNTIME_DIR/$WAYLAND_DISPLAY:/tmp/$WAYLAND_DISPLAY \
	#--user=$(id -u):$(id -g) \

echo "Done."
