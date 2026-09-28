#!/bin/sh

dockutil --no-restart --remove all
dockutil --no-restart --add "/Applications/Firefox.app" --section apps
dockutil --no-restart --add "/Applications/Microsoft Outlook.app" --section apps
dockutil --no-restart --add "/Applications/Microsoft Teams.app" --section apps
dockutil --no-restart --add "/Applications/Slack.app" --section apps
dockutil --no-restart --add "/Applications/zoom.us.app" --section apps
dockutil --no-restart --add "/System/Applications/Utilities/Terminal.app" --section apps
dockutil --no-restart --add "/Applications/VSCodium" --section apps
dockutil --no-restart --add "/Applications/Bixal App Store" --section apps
dockutil --no-restart --add "/System/Applications/System Settings.app" --section apps
killall Dock
