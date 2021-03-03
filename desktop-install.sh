#!/usr/bin/env bash

sudo pacman \
    --sync \
    --refresh \
    --needed \
    --noconfirm \
    xorg-xinit \
    xorg \
    i3 \
    rxvt-unicode \

