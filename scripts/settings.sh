#!/bin/bash

chosen=$(echo -e "Wi-Fi Toggle\nBluetooth Toggle" | rofi -dmenu -p "Settings")

case "$chosen" in
    "Wi-Fi Toggle")
        if nmcli radio wifi | grep -q "enabled"; then
            nmcli radio wifi off
        else
            nmcli radio wifi on
        fi
        ;;
    "Bluetooth Toggle")
        if rfkill list bluetooth | grep -q "Soft blocked: yes"; then
            rfkill unblock bluetooth
        else
            rfkill block bluetooth
        fi
        ;;
esac
