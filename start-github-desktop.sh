#!/bin/sh
export TMPDIR=$XDG_RUNTIME_DIR/app/$FLATPAK_ID
export FLATPAK_HOST=1 
export ELECTRON_TRASH=gio
exec zypak-wrapper /app/github-desktop/github-desktop "$@"