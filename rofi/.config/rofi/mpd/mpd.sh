#!/bin/bash

# Get the bar PID for Polybar updates
bar_pid=$(pgrep -a "polybar" | grep "cat-configs" | cut -d" " -f1)

# Player settings
players="spotify,%any,firefox,chromium,brave,mpd"
player_status=$(playerctl -p $players status)

# Function to update Polybar
update_hooks() {
  echo "$1" | while IFS= read -r id; do
    polybar-msg -p "$id" hook music-play-pause "$2" 1>/dev/null 2>&1
  done
}

# Get the currently playing title with a 36-character limit
current_title() {
    if [[ "$player_status" == "Playing" ]]; then
        full_title=$(playerctl -p $players metadata --format '{{ artist }} - {{ title }}')
        if [[ ${#full_title} -gt 36 ]]; then
            echo "${full_title:0:33}..."  # Truncate and add ellipsis if longer than 36 characters
        else
            echo "$full_title"
        fi
    else
        echo "No music playing"
    fi
}

# Rofi options
option_play_pause=""
option_next=""
option_prev=""

# Rofi command with the currently playing title
rofi_cmd() {
    local title=$(current_title)
    rofi -theme "$HOME/.config/rofi/mpd/mpd.rasi" -dmenu \
        -p "$title" \
        <<< "$option_play_pause
$option_prev
$option_next"
}

# Execute command based on Rofi choice
run_cmd() {
    case "$1" in
        "$option_play_pause")
            playerctl -p $players play-pause ;;
        "$option_next")
            playerctl -p $players next ;;
        "$option_prev")
            playerctl -p $players previous ;;
    esac
}

# Run Rofi and execute chosen command
chosen="$(rofi_cmd)"
run_cmd "$chosen"