# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.config/zsh/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

################################
## zshrc - config file for zsh.
################################

# The following lines were added by compinstall
zstyle :compinstall filename '/home/oskar/.zshrc'

autoload -Uz compinit
compinit
# End of lines added by compinstall
#
# Source manjaro-zsh-configuration
if [[ -e /usr/share/zsh/manjaro-zsh-config ]]; then
  source /usr/share/zsh/manjaro-zsh-config
fi
# Use manjaro zsh prompt
if [[ -e /usr/share/zsh/manjaro-zsh-prompt ]]; then
  source /usr/share/zsh/manjaro-zsh-prompt
fi

# run commands on startup
# # export environment variables
# if [[ -e $ZDOTDIR/.zshenv ]]; then
#   source $ZDOTDIR/.zshenv
# fi
# export zsh aliases
if [[ -e $ZDOTDIR/.zsh-aliases ]]; then
  source $ZDOTDIR/.zsh-aliases
fi

# export zsh functions
if [[ -e $ZDOTDIR/.funcs ]]; then
  source $ZDOTDIR/.funcs
fi

# Use powerline
USE_POWERLINE="true"
# Has weird character width
# Example:
#    is not a diamond
HAS_WIDECHARS="false"

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
