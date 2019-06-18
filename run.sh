xhost +local:
docker run -it --name discord \
       -v /tmp/.X11-unix:/tmp/.X11-unix \
       -e PULSE_SERVER=unix:${XDG_RUNTIME_DIR}/pulse/native \
       -e DISPLAY=unix$DISPLAY \
       --device /dev/snd \
       --device=/dev/dri:/dev/dri \
       -v /etc/localtime:/etc/localtime:ro \
       -v /run/user/1000/pulse:/run/user/1000/pulse \
       -v ~/.config/pulse/cookie:/root/.config/pulse/cookie \
       spicyisland/discord bash
