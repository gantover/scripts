#!/bin/sh

folder=`ls -lt ~/documents/courses | sed -n "2p" | cut -d" " -f9`

cd $HOME/documents/courses/$folder
