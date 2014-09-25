#!/bin/bash

# Check if DBUS is started and if not start it.
if which dbus-launch >/dev/null && test -z "$DBUS_SESSION_BUS_ADDRESS"; then
	eval "$(dbus-launch --sh-syntax --exit-with-session)"
fi

# Touchpad tweaks
synclient AreaTopEdge=5000

#~/.config/conky/scripts/start-conky.sh &
autostart_items=(
	'nitrogen --restore'
	'gnome-settings-daemon'
	# 'polkit-gnome-authentication-agent-1'
	# 'notification-daemon'
	'xcompmgr -C -n'
	'dropbox start'
	'skype'
	'nm-applet'
	'conky'
	'wmname LG3D'
	'thunar --daemon'
    # 'xchat --minimize=2'
	'hipchat'
	# 'make-notes.sh'
    'calibre --start-in-tray'
);

for item in "${autostart_items[@]}"
do
	$item & 
done

