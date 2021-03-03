#!/usr/bin/env bash

sudo pacman \
    --sync \
    --refresh \
    --needed \
    --noconfirm \
    ctags \
    docker \
    docker-compose \
    git \
    gvim \
    tmux \
    ttf-fira-code \

