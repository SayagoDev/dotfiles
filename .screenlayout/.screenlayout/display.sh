#!/bin/sh

if [[ $(xrandr -q | grep 'HDMI1 connected') ]]; then
    xrandr --output eDP1 --primary --mode 1366x768 --pos 0x0 --rotate normal --output HDMI1 --mode 1920x1080 --pos 1366x0 --rotate normal --rate 75 --right-of eDP1 --output VIRTUAL1 --off
else
    xrandr --output eDP1 --primary --mode 1366x768 --pos 0x0 --rotate normal
fi
