# .bash_profile - Interactive definitions

. "$HOME/.bash_functions"

# Source non-interactive definitions
source_if_exists "$HOME/.bashrc"

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if ! shopt -oq posix; then
   source_if_exists /etc/bash_completion
fi

# Git aware prompt
export GITAWAREPROMPT="$HOME/.bash/git-aware-prompt"
. $GITAWAREPROMPT/main.sh

# Set prompt
export PS1="\u@\h:\w\[$txtcyn\]\$git_branch\[$txtylw\]\$git_dirty\[$txtrst\]\$ "
export SUDO_PS1="\[$bakred\]\u@\h\[$txtrst\]:\w\$ "

# Dir handling
function cd {
    if (("$#" > 0)); then
        pushd "$@" > /dev/null
    else
        cd $HOME
    fi
}
alias dirs='dirs -v'

# Common aliases
alias rm='rm -i'
alias cp='cp -i'
alias mv='mv -i'
alias timestamp='date +%Y%m%dT%H%M%S'

# Prevent Java tools from stealing focus
export JAVA_TOOL_OPTIONS="-Djava.awt.headless=true"

# Source local definitions
source_if_exists "$HOME/.bash_profile.`hostname`"
