#!/bin/bash
# Start Waybar
# by Stephan Raabe (2023)
# -----------------------------------------------------

# Check if waybar-disabled file exists
if [ -f $HOME/.cache/waybar-disabled ]; then
  killall waybar
  pkill waybar
  exit 1
fi

# -----------------------------------------------------
# Quit all running waybar instances
# -----------------------------------------------------
killall waybar
pkill waybar
sleep 0.5

# -----------------------------------------------------
# Default theme: /THEMEFOLDER;/VARIATION
# -----------------------------------------------------
themestyle="/ml4w-blur;/ml4w-blur/white"

# -----------------------------------------------------
# Get current theme information from ~/.config/waybar/scripts/waybar-theme.sh
# -----------------------------------------------------
if [ -f ~/.config/waybar/scripts/waybar-theme.sh ]; then
  themestyle=$(cat ~/.config/waybar/scripts/waybar-theme.sh)
else
  touch ~/.config/waybar/scripts/waybar-theme.sh
  echo "$themestyle" >~/.config/waybar/scripts/waybar-theme.sh
fi

IFS=';' read -ra arrThemes <<<"$themestyle"
echo ":: Theme: ${arrThemes[0]}"

if [ ! -f ~/.config/waybar/themes${arrThemes[1]}/style.css ]; then
  themestyle="/ml4w;/ml4w/light"
fi

# -----------------------------------------------------
# Loading the configuration
# -----------------------------------------------------
config_file="config"
style_file="style.css"

# Standard files can be overwritten with an existing config-custom or style-custom.css
if [ -f ~/.config/waybar/themes${arrThemes[0]}/config-custom ]; then
  config_file="config-custom"
fi
if [ -f ~/.config/waybar/themes${arrThemes[1]}/style-custom.css ]; then
  style_file="style-custom.css"
fi

waybar -c ~/.config/waybar/themes${arrThemes[0]}/$config_file -s ~/.config/waybar/themes${arrThemes[1]}/$style_file &
