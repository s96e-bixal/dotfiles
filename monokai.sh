#!/bin/sh

MONOKAI_VARIANT="Monokai_Pro"
PROFILE="$MONOKAI_VARIANT.terminal"

if [ ! -f "$PROFILE" ]; then
    ZIP=$(curl -sL -O  -w "%{filename_effective}" https://packages.monokai.pro/terminal/monokai-pro-terminal.zip)
    unzip $ZIP -d tmp
    rm $ZIP
    mv "tmp/$PROFILE" "$PROFILE"
    rm -r tmp
fi

open "$PROFILE"
sleep 0.5
osascript -e 'tell application "Terminal" to close front window'
defaults write com.apple.Terminal "Default Window Settings" -string "$MONOKAI_VARIANT"
defaults write com.apple.Terminal "Startup Window Settings" -string "$MONOKAI_VARIANT"

/Applications/VSCodium/Contents/Resources/app/bin/codium --install-extension monokai.theme-monokai-pro-vscode

echo "\033[33mRestart Terminal.app to load new profile.\033[0m"
