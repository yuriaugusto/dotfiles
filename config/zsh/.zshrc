source $ZDOTDIR/lib/alias.zsh
source $ZDOTDIR/lib/keybinds.zsh
source $ZDOTDIR/lib/expansions.zsh
source $ZDOTDIR/lib/cursor.zsh
source $ZDOTDIR/lib/completions.zsh
source $ZDOTDIR/lib/history.zsh

# plugins
source $ZDOTDIR/plugins/zsh-history-substring-search/zsh-history-substring-search.zsh
source $ZDOTDIR/plugins/fast-syntax-highlighting/fast-syntax-highlighting.plugin.zsh
source $ZDOTDIR/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
fpath=($ZDOTDIR/plugins/zsh-completions/src $ZDOTDIR/lib/functions $fpath)
autoload -U $ZDOTDIR/lib/functions/*(:t)

declare -U path                             # prevent duplicate entries in path

# navigation options
setopt AUTO_PUSHD           # Push the current directory visited on the stack.
setopt PUSHD_IGNORE_DUPS    # Do not store duplicates in the stack.
setopt PUSHD_SILENT         # Do not print the directory stack after pushd or popd.
setopt CORRECT              # Spelling correction
setopt CDABLE_VARS          # Change directory to a path stored in a variable.
setopt EXTENDED_GLOB        # Use extended globbing syntax.
setopt COMPLETEALIASES
#setopt auto_cd              # Auto changes to a directory without typing cd.
setopt PUSHD_TO_HOME        # Push to home directory when no argument is given.
setopt AUTO_NAME_DIRS       # Auto add variable-stored paths to ~ list.
setopt MULTIOS              # Write to multiple descriptors.
setopt CLOBBER              # turn off warning "file exists" with > and >>
setopt LOCAL_OPTIONS # allow functions to have local options
setopt LOCAL_TRAPS # allow functions to have local traps

export FZF_DEFAULT_OPTS=" \
--color=bg+:#313244,bg:#1e1e2e,spinner:#f5e0dc,hl:#f38ba8 \
--color=fg:#cdd6f4,header:#f38ba8,info:#cba6f7,pointer:#f5e0dc \
--color=marker:#f5e0dc,fg+:#cdd6f4,prompt:#cba6f7,hl+:#f38ba8"

#$(fast-theme XDG:catppuccin-mocha)

eval $(dircolors "$XDG_CONFIG_HOME"/dircolors/dir_colors)
eval $(thefuck --alias fuck)
eval "$(starship init zsh)"
