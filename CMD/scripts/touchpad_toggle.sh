#!/bin/zsh

STATE_FILE=~/.touchpad_state
DEVICE="elan1200:00-04f3:309f-touchpad"

# Check if state file exists and read it
if [ -f "$STATE_FILE" ] && [ "$(cat "$STATE_FILE")" = "disabled" ]; then
  # Enable touchpad
  hyprctl keyword "device[$DEVICE]:enabled" true
  echo "enabled" >"$STATE_FILE"
else
  # Disable touchpad
  hyprctl keyword "device[$DEVICE]:enabled" false
  echo "disabled" >"$STATE_FILE"
fi
