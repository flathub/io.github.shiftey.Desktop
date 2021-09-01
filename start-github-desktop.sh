#!/bin/sh

export TMPDIR=$XDG_RUNTIME_DIR/app/$FLATPAK_ID
export FLATPAK_HOST=1 
gpg-agent --homedir ~/.gnupg --daemon --pinentry-program=/app/bin/pinentry
exec zypak-wrapper /app/github-desktop/github-desktop "$@"
pkill -TERM gpg-agent