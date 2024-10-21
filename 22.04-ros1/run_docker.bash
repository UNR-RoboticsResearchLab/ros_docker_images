## run this script to enabel GUI

#xhost +local:docker

XSOCK=/tmp/.X11-unix
XAUTH=/tmp/.docker.xauth
touch $XAUTH
xauth nlist $DISPLAY | sed -e 's/^..../ffff/' | xauth -f $XAUTH nmerge -

#xhost +SI:localuser:$(id -un)
#XAUTH=/tmp/.docker.xauth

docker run -ti -it --rm \
	-e DISPLAY=$DISPLAY \
	-e QT_X11_NO_MITSHM=1 \
	-v $XSOCK:$XSOCK:rw \
	-v $XAUTH:$XAUTH:rw \
    -v /home/$USER:/home/$USER \
    --volume="/etc/group:/etc/group:ro" \
    --volume="/etc/passwd:/etc/passwd:ro" \
    --volume="/etc/shadow:/etc/shadow:ro" \
    --volume="/etc/sudoers.d:/etc/sudoers.d:ro" \
    --user="$USER" \
    dfseifer/ros-test


    #    --volume=$XAUTH:$XAUTH:rw \
    #    --env="XAUTHORITY=${XAUTH}" \
    #    --env="DISPLAY" \
    #    -user="myNewUserName" \
		#-e XDG_RUNTIME_DIR=/tmp \
	#-e WAYLAND_DISPLAY=$WAYLAND_DISPLAY \
	#-v $XDG_RUNTIME_DIR/$WAYLAND_DISPLAY:/tmp/$WAYLAND_DISPLAY \
	#--user=$(id -u):$(id -g) \

echo "Done."
