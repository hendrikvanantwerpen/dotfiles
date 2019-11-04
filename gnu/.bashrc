# .bashrc - Non-interactive definitions

. "$HOME/.sh_functions"

# Source global definitions
source_if_exists /etc/bashrc

source_if_exists "$HOME/.secrets"

# set PATH so it includes user's private bin if it exists
if [ -d "$HOME/.local/bin" ] ; then
    export PATH="$HOME/.local/bin:$PATH"
fi
if [ -d "$HOME/bin" ] ; then
    export PATH="$HOME/bin:$PATH"
fi

export VISUAL=vim

if [ -z "$XDG_CACHE_HOME" ]; then
    export XDG_CACHE_HOME="`mktemp -d -t cache.XXXX`"
fi   

# Give Maven more memory
export MAVEN_OPTS="-Xss64m -Xms1G -Xmx3G"

# OPAM configuration
source_if_exists "$HOME/.opam/opam-init/init.sh" >& /dev/null || true

# Source local definitions
source_if_exists "$HOME/.bashrc.`hostname -s`"
