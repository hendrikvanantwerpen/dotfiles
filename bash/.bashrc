# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if [ -f /etc/bash_completion ] && ! shopt -oq posix; then
   . /etc/bash_completion
fi

# Source our shell agnostic variables
if [ -f "$HOME/.shrc" ]; then
    . "$HOME/.shrc"
fi

case "$-" in
    *i*) # set interactive things
        # Git aware prompt
        export GITAWAREPROMPT=~/.bash/git-aware-prompt
        . $GITAWAREPROMPT/main.sh
        export PS1="\u@\h:\w\[$txtcyn\]\$git_branch\[$txtylw\]\$git_dirty\[$txtrst\]\$ "
        export SUDO_PS1="\[$bakred\]\u@\h\[$txtrst\]:\w\$ "
        ;;
    *) # ignore non-interactive
        ;;
esac

# Dir handling
function cd {
    if (("$#" > 0)); then
        pushd "$@" > /dev/null
    else
        cd $HOME
    fi
}
alias dirs='dirs -v'

alias rm='rm -i'
alias cp='cp -i'
alias mv='mv -i'

alias l.='ls -d .* --color=tty'
alias ll='ls -l --color=tty'
alias ls='ls --color=tty'

alias timestamp='date +%Y%m%dT%H%M%S'

# OPAM configuration
. /home/hendrik/.opam/opam-init/init.sh > /dev/null 2> /dev/null || true
