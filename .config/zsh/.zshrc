source $ZDOTDIR/lib/alias.zsh
source $ZDOTDIR/lib/zfunc.zsh
source $ZDOTDIR/lib/keybinds.zsh
source $ZDOTDIR/lib/cursor.zsh
source $ZDOTDIR/lib/completions.zsh

# plugins
source $ZDOTDIR/plugins/fast-syntax-highlighting/fast-syntax-highlighting.plugin.zsh
source $ZDOTDIR/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
fpath=($ZDOTDIR/plugins/zsh-completions/src $fpath)

# navigation options
setopt AUTO_PUSHD           # Push the current directory visited on the stack.
setopt PUSHD_IGNORE_DUPS    # Do not store duplicates in the stack.
setopt PUSHD_SILENT         # Do not print the directory stack after pushd or popd.
setopt CORRECT              # Spelling correction
setopt CDABLE_VARS          # Change directory to a path stored in a variable.
setopt EXTENDED_GLOB        # Use extended globbing syntax.
setopt COMPLETEALIASES
#setopt auto_cd              # Auto changes to a directory without typing cd.
#setopt pushd_to_home        # Push to home directory when no argument is given.
#setopt auto_name_dirs       # Auto add variable-stored paths to ~ list.
#setopt multios              # Write to multiple descriptors.
#unsetopt clobber           # Do not overwrite existing files with > and >>
                            # Use >! and >>! to bypass.
#setopt clobber              # turn off warning "file exists" with > and >>

# history options
setopt EXTENDED_HISTORY          # Write the history file in the ':start:elapsed;command' format.
setopt SHARE_HISTORY             # Share history between all sessions.
setopt HIST_EXPIRE_DUPS_FIRST    # Expire a duplicate event first when trimming history.
setopt HIST_IGNORE_DUPS          # Do not record an event that was just recorded again.
setopt HIST_IGNORE_ALL_DUPS      # Delete an old recorded event if a new event is a duplicate.
setopt HIST_FIND_NO_DUPS         # Do not display a previously found event.
setopt HIST_IGNORE_SPACE         # Do not record an event starting with a space.
setopt HIST_SAVE_NO_DUPS         # Do not write a duplicate event to the history file.
setopt HIST_VERIFY               # Do not execute immediately upon history expansion.
setopt HIST_REDUCE_BLANKS        # Remove superfluous blanks from history items.

export FZF_DEFAULT_OPTS=" \
--color=bg+:#313244,bg:#1e1e2e,spinner:#f5e0dc,hl:#f38ba8 \
--color=fg:#cdd6f4,header:#f38ba8,info:#cba6f7,pointer:#f5e0dc \
--color=marker:#f5e0dc,fg+:#cdd6f4,prompt:#cba6f7,hl+:#f38ba8"

#$(fast-theme XDG:catppuccin-mocha)

eval $(dircolors "$XDG_CONFIG_HOME"/dircolors/dir_colors)
eval $(thefuck --alias fuck)
eval "$(starship init zsh)"
