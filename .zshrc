## config file for zsh.
#
#
# export environment variables
if [[ -e $HOME/.zshenv ]]; then
  source $HOME/.zshenv
fi
# export zsh aliases
if [[ -e $HOME/.zsh_aliases ]]; then
  source $HOME/.zsh_aliases
fi

# Use powerline
USE_POWERLINE="true"
# Has weird character width
# Example:
#    is not a diamond
HAS_WIDECHARS="false"
# Source manjaro-zsh-configuration
if [[ -e /usr/share/zsh/manjaro-zsh-config ]]; then
  source /usr/share/zsh/manjaro-zsh-config
fi
# Use manjaro zsh prompt
if [[ -e /usr/share/zsh/manjaro-zsh-prompt ]]; then
  source /usr/share/zsh/manjaro-zsh-prompt
fi

# The following lines were added by compinstall
zstyle :compinstall filename '/home/oskar/.zshrc'

autoload -Uz compinit
compinit
# End of lines added by compinstall
