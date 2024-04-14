## zshenv - file for environment variables for zsh
#
# add environment variables using the "export" tag
# export VARIABLE=PATH
#
# long live XDG!
export XDG_DATA_HOME="$HOME"/.local/share
export XDG_CONFIG_HOME="$HOME"/.config
export XDG_STATE_HOME="$HOME"/.local/state
export XDG_CACHE_HOME="$HOME"/.cache

# xdg entries for (some) applications
export ANDROID_HOME="$XDG_DATA_HOME"/android
export HISTFILE="$XDG_STATE_HOME"/zsh/history
export CARGO_HOME="$XDG_DATA_HOME"/cargo
export LEIN_HOME="$XDG_DATA_HOME"/lein
export NODE_REPL_HISTORY="$XDG_DATA_HOME"/node_repl_history
export _JAVA_OPTIONS=-Djava.util.prefs.userRoot="$XDG_CONFIG_HOME"/java
export GRADLE_USER_HOME="$XDG_DATA_HOME"/gradle
export MYCLI_HISTFILE="$XDG_DATA_HOME/mycli/history"
export RUSTUP_HOME="$XDG_DATA_HOME"/rustup
export XINITRC="$XDG_CONFIG_HOME"/X11/xinitrc
export FCEUX_HOME="$XDG_CONFIG_HOME"/fceux
export GTK2_RC_FILES="$XDG_CONFIG_HOME"/gtk-2.0/gtkrc
export XCURSOR_PATH=/usr/share/icons:$XDG_DATA_HOME/icons
export W3M_DIR="$XDG_DATA_HOME"/w3m
export KDEHOME="$XDG_CONFIG_HOME"/kde
export GNUPGHOME="$XDG_DATA_HOME"/gnupg

compinit -d "$XDG_CACHE_HOME"/zsh/zcompdump-"$ZSH_VERSION"

# fzf with hidden files
export FZF_DEFAULT_COMMAND="find -L"

# delete duplicate entries
export HISTCONTROL=ignoredups:erasedups 
export HISTFILE="$XDG_STATE_HOME"/zsh/history

# add programs
export PATH=$PATH:/usr/local/go/bin

# personal variables
export EDITOR='nvim'
export wm='awesome'
export CODING="$HOME"/Coding
export STORAGE=/media/Stuff
export ROFI_TODOIST_ROOT_PATH=~/.local/bin/rofi-todoist
export ROFI_TODOIST_PATH=todoist-cli
