## zshenv - file for environment variables for zsh
#
# add environment variables using the "export" tag
# export VARIABLE=PATH
#
# long live XDG-specification
export XDG_DATA_HOME="$HOME"/.local/share
export XDG_CONFIG_HOME="$HOME"/.config
export XDG_STATE_HOME="$HOME"/.local/state
export XDG_CACHE_HOME="$HOME"/.cache

# xdg entries for (some) applications
export ANDROID_HOME="$XDG_DATA_HOME"/android
export HISTFILE="${XDG_STATE_HOME}"/zsh/history
export CARGO_HOME="$XDG_DATA_HOME"/cargo
export LEIN_HOME="$XDG_DATA_HOME"/lein
export NODE_REPL_HISTORY="$XDG_DATA_HOME"/node_repl_history
export _JAVA_OPTIONS=-Djava.util.prefs.userRoot="$XDG_CONFIG_HOME"/java
export RUSTUP_HOME="$XDG_DATA_HOME"/rustup
export WINEPREFIX="$XDG_DATA_HOME"/wine
export XINITRC="$XDG_CONFIG_HOME"/X11/xinitrc
export SQLITE_HISTORY="$XDG_CACHE_HOME"/sqlite_history
export FCEUX_HOME="$XDG_CONFIG_HOME"/fceux
export GTK2_RC_FILES="$XDG_CONFIG_HOME"/gtk-2.0/gtkrc
export XCURSOR_PATH=/usr/share/icons:$XDG_DATA_HOME/icons
export W3M_DIR="$XDG_DATA_HOME"/w3m
export WINEPREFIX="$XDG_DATA_HOME"/wine
export KDEHOME="$XDG_CONFIG_HOME"/kde
export GNUPGHOME="$XDG_DATA_HOME"/gnupg

# delete duplicate entries
export HISTCONTROL=ignoredups:erasedups 

# personal variables
export EDITOR='nvim'
export CODING="$HOME"/Coding
export STORAGE=/media/Stuff


