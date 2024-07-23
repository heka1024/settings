# Install bash
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"


# Install brewfile
brew bundle

defaults write -g ApplePressAndHoldEnabled -bool false

