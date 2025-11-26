#!/bin/sh

# start mako as a service
systemctl --user add-wants niri.service mako.service

# start waybar as a service
systemctl --user add-wants niri.service waybar.service

# setup swaybg
mkdir -p ~/Pictures/Wallpaper
cp ./Images/1.jpg ~/Pictures/Wallpaper/
cp ./Services/swaybg.service ~/.config/systemd/user/

# start swaybg as a service
systemctl --user daemon-reload
systemctl --user add-wants niri.service swaybg.service

#setup swayidle
cp ./Services/swayidle.service ~/.config/systemd/user/

systemctl --user daemon-reload
systemctl --user add-wants niri.service swayidle.service
