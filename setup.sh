#!/bin/bash
# -*- Mode: sh; coding: utf-8; indent-tabs-mode: nil; tab-width: 4 -*-
#
# Authors:
#   Sam Hewitt <sam@snwh.org>
#   Mark Padgham <mark.padgham@email.com>
#   Andreas Petutschnig <andreas@petutschnig.de>
#
# Description:
#   A post-installation bash script for Manjaro Linux. Any new scripts must be
#   made executable with >chmod u+x
#
# Legal Preamble:
#
# This script is free software; you can redistribute it and/or modify it under
# the terms of the GNU General Public License as published by the Free Software
# Foundation; version >=3.
#
# This script is distributed in the hope that it will be useful, but WITHOUT
# ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS
# FOR A PARTICULAR PURPOSE.  See the GNU General Public License for more
# details: <https://www.gnu.org/licenses/gpl-3.0.txt>
#
# tab width
tabs 4
clear
# set -xv # for debugging

#----- Fancy Messages -----#
show_error(){
echo -e "\033[1;31m$@\033[m" 1>&2
}
show_info(){
echo -e "\033[1;32m$@\033[0m"
}
show_info_red(){
echo -e "\033[1;31m$@\033[0m"
}
show_warning(){
echo -e "\033[1;33m$@\033[0m"
}
show_question(){
echo -e "\033[1;34m$@\033[0m"
}
show_success(){
echo -e "\033[1;35m$@\033[0m"
}
show_header(){
echo -e "\033[1;36m$@\033[0m"
}
show_listitem(){
echo -e "\033[0;37m$@\033[0m"
}

#----- Import Functions -----#

DIR="$(dirname "$0")"

. $DIR/functions/variables

. $DIR/functions/configure
. $DIR/functions/doall
. $DIR/functions/packages
. $DIR/functions/aur
. $DIR/functions/ssh_key_setup

# Main
function main {
    MAIN=$(whiptail \
        --notags \
        --title "Manjaro System Setup" \
        --menu "\nWhat would you like to do?" \
        --cancel-button "Quit" \
        $LINES $COLUMNS $(( $LINES - 12 )) \
        doall         '1. Do all (non-interactive)' \
        packages      '2. Install pacman packages' \
        aurpackages   '3. Install AUR packages' \
        ssh-key-setup '4. Generate a new ssh key' \
        configure     '5. Configure system' \
        3>&1 1>&2 2>&3)

    exitstatus=$?
    if [ $exitstatus = 0 ]; then
        $MAIN
    else
        quit
    fi
}

# Quit
function quit {
    exit 99
}

#RUN
# check_dependencies
while :
do
  main
done

#END OF SCRIPT
