# dotfiles

## Usage

Setup by running:

    ./script/setup

Teardown by running:

    ./script/teardown

Updating is best done with a full teardown/setup cycle. This ensures no hanging
links to removed files.

When developing locally, run:

    ./script/teardown
    # local edits
    ./script/setup

When updating from remote, run:

    git fetch
    ./script/teardown
    git merge origin/master
    ./script/setup

## Issues & Ideas

- Allow fallback behavior, installing the first of host, os+arch, os, or unconditional symlink.

- Require sudo for linking into /usr/local/bin.

- Installing apps as login items was a bit finicky, as they were not yet allowed to be opened.

- Sometimes a read loop in `df_confirm` occurs, when `brew bundle` fails.

- Add script to detect/remove dangling references to dotfiles.
