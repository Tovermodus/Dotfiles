export _JAVA_AWT_WM_NONREPARENTING=1 
export AWT_TOOLKIT=MToolkit 
wmname LG3D


#!/bin/sh

userresources=$HOME/.Xresources
usermodmap=$HOME/.Xmodmap
sysresources=/etc/X11/xinit/.Xresources
sysmodmap=/etc/X11/xinit/.Xmodmap

# merge in defaults and keymaps

if [ -f $sysresources ]; then

    xrdb -merge $sysresources

fi

if [ -f $sysmodmap ]; then
    xmodmap $sysmodmap
fi

if [ -f "$userresources" ]; then

    xrdb -merge "$userresources"

fi

if [ -f "$usermodmap" ]; then
    xmodmap "$usermodmap"
fi

# start some nice programs

if [ -d /etc/X11/xinit/xinitrc.d ] ; then
 for f in /etc/X11/xinit/xinitrc.d/?*.sh ; do
  [ -x "$f" ] && . "$f"
 done
 unset f
fi
export PATH=$PATH:/opt/apache-spark/bin

dbus-update-activation-environment --systemd DBUS_SESSION_BUS_ADDRESS DISPLAY XAUTHORITY
#export $(dbus-launch --sh-syntax --exit-with-session)
#exec gnome-session
#exec emacs
#exec dwm
exec i3 -d all --shmlog-size=26214400 > log.txt #gnome-shell GGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGG
#export XDG_SESSION_TYPE=x11
#export GDK_BACKEND=x11
#exec gnome-session
#exec dbus-launch --exit-with-session i3
