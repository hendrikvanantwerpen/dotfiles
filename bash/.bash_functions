# .bash_functions - Useful BASH functions

function source_if_exists {
    if [ -f "$1" ]; then
        . "$1"
    fi
}
