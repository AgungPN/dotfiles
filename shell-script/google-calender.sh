#!/bin/bash


# CHROME VERSION
# google-chrome --force-device-scale-factor=1.5 --user-data-dir=.config/google-chrome-for-notion/ --app=https://calendar.google.com/calendar/u/0/r/week

# Create a separate profile directory for Notion if it doesn't exist
PROFILE_DIR="$HOME/Documents/programing/shell-script/.config/firefox-google-calender"
# mkdir -p "$PROFILE_DIR"

# Start Firefox with specified parameters
firefox --new-instance --profile "$PROFILE_DIR" --kiosk https://calendar.google.com/calendar/u/0/r/week
