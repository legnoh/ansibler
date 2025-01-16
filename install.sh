#!/usr/bin/env zsh

# install homebrew with noninteractive
# https://github.com/Homebrew/install/?tab=readme-ov-file#install-homebrew-on-macos-or-linux
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

# check homebrew_prefix
if [[ $(/usr/bin/uname) == "Linux" ]]; then
  export HOMEBREW_PREFIX="/home/linuxbrew/.linuxbrew"
elif [[ $(/usr/bin/uname -m) == "arm64" ]]; then
  export HOMEBREW_PREFIX="/opt/homebrew"
else
  export HOMEBREW_PREFIX="/usr/local"
fi

# set brew path to .zprofile
echo "eval \"\$(${HOMEBREW_PREFIX}/bin/brew shellenv)\"" > ${HOME}/.zprofile
eval "$(${HOMEBREW_PREFIX}/bin/brew shellenv)"

# install ansible with homebrew
brew install ansible

# complete!
echo "--------------------------------------"
echo "🎉 Ansible was successfully installed!"
