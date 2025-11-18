#!/bin/sh
export $(dbus-launch)

VPN=$(nmcli con show --active | grep -i wireguard)

IFS='  ' read -ra info <<< "$VPN"

if (( ${#info[@]} != 0 )); then
	if [[ ${info[0]} != "thbk002-thbk001" ]]; then
		sudo wg-quick down ${info[0]}
		sudo wg-quick up thbk002-thbk001
		sudo -u solvr DISPLAY=:0 DBUS_SESSION_BUS_ADDRESS=unix:path=/run/user/1000/bus notify-send -t 4000 "You've swapped VPN to: thbk002-thbk001" 
	elif [[ ${info[0]} == "thbk002-thbk001" ]]; then
		sudo wg-quick down ${info[0]}
		sudo wg-quick up idjp002-jpos004
		sudo -u solvr DISPLAY=:0 DBUS_SESSION_BUS_ADDRESS=unix:path=/run/user/1000/bus notify-send -t 4000 "You've swapped VPN to: idjp002-jpos004"
	fi
else 
	sudo wg-quick up idjp002-jpos004
	sudo -u solvr DISPLAY=:0 DBUS_SESSION_BUS_ADDRESS=unix:path=/run/user/1000/bus notify-send -t 4000 "You've swapped VPN to: idjp002-jpos004"
fi

