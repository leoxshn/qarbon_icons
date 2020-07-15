#!/bin/bash

INSTALL_PATH=/home/$USER/.local/share/icons/

rm -r ${INSTALL_PATH}qarbonIcons
cp -r out/qarbonIcons $INSTALL_PATH
