# .profile - Interactive definitions

. "$HOME/.sh_functions"

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
if ! test -d $GITAWAREPROMPT; then
  echo "Warning: Missing $GITAWAREPROMPT"
else
  source_if_exists $GITAWAREPROMPT/main.sh
fi

# Set prompt
export PS1="\u@\h:\w\[$txtcyn\]\$git_branch\[$txtylw\]\$git_dirty\[$txtrst\]\$ "
export SUDO_PS1="\[$bakred\]\u@\h\[$txtrst\]:\w\$ "

# Dir handling
function cd {
    if (($# > 0)); then
        pushd "$@" > /dev/null
    else
        cd $HOME
    fi
}
alias dirs='dirs -v'

# editor
export EDITOR="emacsclient -t"
export ALTERNATE_EDITOR="vim"
export VISUAL="$EDITOR"
export GIT_EDITOR="$ALTERNATE_EDITOR"
alias edit="$EDITOR"

function emacsd {
    if (($# > 0)); then
        case "$1" in
            "--help")
                echo "Usage: emacsd COMMAND"
                echo "  --start/--daemon   Start Emacs daemon"
                echo "  --kill/--quit      Quit Emacs daemon"
                echo "  --help             Show this help"
                ;;
            "--start"|"--daemon")
                emacs --daemon
                ;;
            "--kill"|"--quit")
                emacsclient -e '(kill-emacs)'
                ;;
            *)
                echo "Unknown Emacs command: $1"
                ;;
        esac
    else
        emacs --daemon
    fi
}

# Common aliases
alias rm='rm -i'
alias cp='cp -i'
alias mv='mv -i'

alias l.='ls -d .* --color=tty'
alias ll='ls -l --color=tty'
alias ls='ls --color=tty'

alias timestamp='date +%Y%m%dT%H%M%S'

# Prevent Java tools from stealing focus
export JAVA_TOOL_OPTIONS="-Djava.awt.headless=true"

# Source local definitions
source_if_exists "$HOME/.profile.`hostname -s`"
