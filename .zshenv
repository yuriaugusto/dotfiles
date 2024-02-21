export PATH="/home/yuri/.local/bin:/home/yuri/bin:/usr/local/bin:/usr/local/sbin:/usr/bin:/usr/sbin"

export XDG_CONFIG_HOME="$HOME/.config"
export XDG_DATA_HOME="$HOME/.local/share"
export XDG_CACHE_HOME="$HOME/.cache"

export ZDOTDIR="$XDG_CONFIG_HOME/zsh"
export ZDATADIR="$XDG_DATA_HOME/zsh"
export ZCACHEDIR="$XDG_CACHE_HOME/zsh"
export HISTFILE="$ZDOTDIR/zhistory"     # History filepath
export HISTSIZE=10000                   # Maximum events for internal history
export SAVEHIST=10000                   # Maximum events in history file

export DOTFILES="$HOME/git/dotfiles"

export EDITOR="nvim"
export TERMINAL="gnome-terminal"
export BROWSER="firefox"
export PAGER="less"
export TERM="xterm-256color"

export STARSHIP_CONFIG="$XDG_CONFIG_HOME/starship/starship.toml"