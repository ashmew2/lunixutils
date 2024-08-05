#!/usr/bin/env bash

# chmod +x toggle-touchpad.sh
# Use the Keyboard shortcuts manager in MX Linux
# to set the XF86TouchpadToggle button (by pressing Fn + F6 on some machines)
# And this script will correctly handle toggling the state of the touchpad

devid="$(xinput list | grep -i touchpad | grep -Eo 'id=[0-9]*' | sed 's#id=##')"
state="$(xinput list-props "$devid" | grep 'Device Enabled' | awk '{print $NF}')"

nstate=0
if [ "$state" == "0" ]; then
    nstate=1
fi

xinput set-prop "$devid" "Device Enabled" "$nstate"

