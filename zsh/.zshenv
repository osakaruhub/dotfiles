##################################################
## zshenv - file for environment variables for zsh
##################################################
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
export CARGO_HOME="$XDG_DATA_HOME"/cargo
export _JAVA_OPTIONS=-Djava.util.prefs.userRoot="$XDG_CONFIG_HOME"/java
export GRADLE_USER_HOME="$XDG_DATA_HOME"/gradle
export RUSTUP_HOME="$XDG_DATA_HOME"/rustup
export FCEUX_HOME="$XDG_CONFIG_HOME"/fceux
export GTK2_RC_FILES="$XDG_CONFIG_HOME"/gtk-2.0/gtkrc
export XCURSOR_PATH=/usr/share/icons:$XDG_DATA_HOME/icons
export W3M_DIR="$XDG_DATA_HOME"/w3m
export KDEHOME="$XDG_CONFIG_HOME"/kde
export GNUPGHOME="$XDG_DATA_HOME"/gnupg
export RENPY_PATH_TO_SAVES="$XDG_DATA_HOME"
export NUGET_PACKAGES="$XDG_CACHE_HOME"/NuGetPackages
export SSH_AUTH_SOCK=$(gpgconf --list-dirs agent-ssh-socket)

# fzf with hidden files
export FZF_DEFAULT_COMMAND="find -L"

# add programs
export PATH=$PATH:/usr/local/go/bin
export PATH=$PATH:/home/oskar/.local/bin

# personal variables
export EDITOR='nvim'
export STORAGE=/media/Stuff
