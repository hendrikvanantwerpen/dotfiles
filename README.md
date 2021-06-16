# dotfiles

## Usage

Install or update submodules:

   git submodule update --init --recursive

Install using GNU Stow

    cd gnu
    stow -t ~ .

## macOS

- Install Brew
- brew tap homebrew/cask-fonts
- brew install --cask amethyst firefox iterm2 evernote font-source-code-pro
- Install Todoist from app store
- Change default browser to Firefox
- Set start-up items Slack, Evernote, Todoist, Mail, Calendar
- brew install git stow bash coreutils grep ack emacs bash-completion
- Add /usr/local/bin/bash to /etc/shells
- Checkout git-aware-prompt
- Change shell chsh -s /usr/local/bin/bash
- Set iTerm2 prefs directory to dotfiles/macos/iterm2.prefs
  - [obsolete] Swap Command/Control/CapsLock in System preferences/Keyboard, and in iTerm2
  - [obsolete] Import key bindings in iTerm2
- Change spotlight shortcut from Cmd+Space to Ctrl+Space
- Disable smart quotes in SysPref/Keyboard;Text
- Disable sounds in SysPref/Sounds

- Automation scripts for Firefox & ITerm
