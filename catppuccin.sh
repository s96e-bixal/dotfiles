#!/bin/sh

# choices are frappe, latte, macchiato, and mocha
CATPPUCCIN_FLAVOR="mocha"

# capitalize so profile name looks nice in Terminal.app settings
CAPITALIZED=$(printf '%s' "$CATPPUCCIN_FLAVOR" | awk '{print toupper(substr($0, 1, 1)) substr($0, 2)}')
TERMINAL="$CAPITALIZED.terminal"

# download profile and make default
curl -o $TERMINAL https://raw.githubusercontent.com/catppuccin/Terminal.app/refs/heads/main/themes/catppuccin-$CATPPUCCIN_FLAVOR.terminal >/dev/null 2>&1
open $TERMINAL
sleep 0.5
osascript -e 'tell application "Terminal" to close front window'
defaults write com.apple.Terminal "Default Window Settings" -string "$CAPITALIZED"
defaults write com.apple.Terminal "Startup Window Settings" -string "$CAPITALIZED"
rm $TERMINAL

# set up vscodium extension
curl -Lo extension.vsix https://github.com/catppuccin/vscode/releases/download/catppuccin-vsc-v3.19.0/catppuccin-vsc-3.19.0.vsix
/Applications/VSCodium/Contents/Resources/app/bin/codium --install-extension extension.vsix
rm extension.vsix

echo "\033[33mRestart Terminal.app to load new profile.\033[0m"
