#!/bin/bash

# install the binary via macports
sudo port install skhd

# setup launchd to run skhd
sudo cp com.koekeishiya.skhd.plist ~/Library/LaunchAgents/
defaults write "$HOME/Library/LaunchAgents/com.koekeishiya.skhd.plist" StandardOutPath "$HOME/Library/Logs/skhd.log"
defaults write "$HOME/Library/LaunchAgents/com.koekeishiya.skhd.plist" StandardErrorPath "$HOME/Library/Logs/skhd.log"
plutil -convert xml1 "$HOME/Library/LaunchAgents/com.koekeishiya.skhd.plist"

# move config file into place
mv skhdrc ~/.skhdrc

# load launchagent for skhd
launchctl bootstrap gui/$UID ~/Library/LaunchAgents/com.koekeishiya.skhd.plist

exit 0