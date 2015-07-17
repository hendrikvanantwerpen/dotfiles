# .bashrc - Non-interactive definitions

. ~/.bash_functions

# Source global definitions
source_if_exists /etc/bashrc

source_if_exists ~/.secrets

# set PATH so it includes user's private bin if it exists
if [ -d "$HOME/bin" ] ; then
    export PATH="$HOME/bin:$PATH"
fi

export VISUAL=vim

if [ -z "$XDG_CACHE_HOME" ]; then
    export XDG_CACHE_HOME="`mktemp -d -t cache.XXXX`"
fi   

# Give Maven more memory
export MAVEN_OPTS="-Xss16m -Xms512m -Xmx2048m -XX:MaxPermSize=512m"

# OPAM configuration
source_if_exists ~/.opam/opam-init/init.sh >& /dev/null || true

# Source local definitions
source_if_exists "~/.bashrc.`hostname`"
