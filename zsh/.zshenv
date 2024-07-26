# https://blog.patshead.com/2011/04/improve-your-oh-my-zsh-startup-time-maybe.html
skip_global_compinit=1

export PATH="$HOME/.local/bin:$HOME/bin:$PATH"
export WORDCHARS='*?_-.[]~=&;!#$%^(){}<>'

export XDG_CONFIG_HOME="$HOME/.config"
export XDG_DATA_HOME="$HOME/.local/share"
export XDG_CACHE_HOME="$HOME/.cache"

export ZDOTDIR="$XDG_CONFIG_HOME/zsh"
export ZDATADIR="$XDG_DATA_HOME/zsh"
export ZCACHEDIR="$XDG_CACHE_HOME/zsh"
export ZPLUGINDIR=${ZPLUGINDIR:-${ZDOTDIR:-$HOME/.config/zsh}/plugins}

export HISTFILE="$ZCACHEDIR/zhistory"     # History filepath
export HISTSIZE=10000                   # Maximum events for internal history
export SAVEHIST=10000                   # Maximum events in history file
export HISTORY_IGNORE="(ls|cd|pwd|zsh|exit|cd ..)"

export DOTFILES="$HOME/git/dotfiles"

if builtin command -v nvim > /dev/null 2>&1; then
    export EDITOR="nvim"
    export VISUAL="nvim"
else
    export EDITOR="vim"
    export VISUAL="vim"
fi

# FZF
export FZF_DEFAULT_COMMAND='rg --files --hidden --glob "!.git"'
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"

FZF_COLORS="bg+:#31353f,\
bg:#282c34,\
fg:#abb2bf,\
fg+:#abb2bf,\
border:#7e3992,\
spinner:#e5c07b,\
hl:#e55561,\
header:#e86671,\
info:#d19a66,\
pointer:#e5c07b,\
marker:#e5c07b,\
prompt:#d19a66,\
hl+:#e86671"

export FZF_DEFAULT_OPTS=" \
--height 50% \
--margin 4% \
--border rounded \
--color '$FZF_COLORS'"

export FZF_ALT_C_OPTS="--preview 'tree -C {} | head -n 10'"
export FZF_COMPLETION_DIR_COMMANDS="cd pushd rmdir tree ls"

export BAT_THEME="OneDark"
export TERMINAL="com.raggesilver.BlackBox"
export BROWSER="firefox"
export PAGER="less"
export TERM="xterm-256color"

export STARSHIP_CONFIG="$XDG_CONFIG_HOME/starship/starship.toml"
