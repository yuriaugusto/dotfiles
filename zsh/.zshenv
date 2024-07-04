# https://blog.patshead.com/2011/04/improve-your-oh-my-zsh-startup-time-maybe.html
skip_global_compinit=1

export PATH="$HOME/.local/bin:$HOME/bin:$PATH"

export XDG_CONFIG_HOME="$HOME/.config"
export XDG_DATA_HOME="$HOME/.local/share"
export XDG_CACHE_HOME="$HOME/.cache"

export ZDOTDIR="$XDG_CONFIG_HOME/zsh"
export ZDATADIR="$XDG_DATA_HOME/zsh"
export ZCACHEDIR="$XDG_CACHE_HOME/zsh"
export ZPLUGINDIR=${ZPLUGINDIR:-${ZDOTDIR:-$HOME/.config/zsh}/plugins}

export DOTFILES="$HOME/git/dotfiles"

if builtin command -v nvim > /dev/null 2>&1; then
    export EDITOR="nvim"
else
    export EDITOR="vim"
fi

export BAT_THEME="OneDark"
export TERMINAL="alacritty"
export BROWSER="firefox"
export PAGER="less"
export TERM="xterm-256color"

export STARSHIP_CONFIG="$XDG_CONFIG_HOME/starship/starship.toml"
