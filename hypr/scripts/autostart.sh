#!/bin/bash

exec /usr/local/bin/launch.sh &

swww query || swww init &
# pypr &
# exec ~/.config/hypr/scripts/suspend.sh &
# flatpak run com.nextcloud.desktopclient.nextcloud &
# flatpak run com.borgbase.Vorta &
# flatpak run com.core447.StreamController &
dunst &
/usr/libexec/polkit-gnome-autentication-agent-1 &
