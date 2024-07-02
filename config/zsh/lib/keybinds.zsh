#-----------------------------------------------------
# Set VIM mode
# e.g. https://dougblack.io/words/zsh-vi-mode.html
# Key code table: https://www.zsh.org/mla/users/2014/msg00266.html

# emacs keybindings
bindkey -e

bindkey '^?' backward-delete-char                 # backspace
bindkey '^h' backward-delete-char                 # ctrl-h
bindkey '^w' backward-kill-word                   # ctrl-w
bindkey '^H' backward-kill-word                   # ctrl-backspace
bindkey '^[[3;5~' kill-word                       # ctrl + Supr
bindkey '^U' backward-kill-line                   # ctrl + U
bindkey '^[[3~' delete-char                       # delete
bindkey '^[[Z' undo                               # shift + tab undo last action
bindkey "^K" kill-line                            # ctrl-k
bindkey "^D" delete-char                          # ctrl-d
bindkey "^L" clear-screen                         # ctrl-l
bindkey '^[[H' beginning-of-line                  # home
bindkey '^[[F' end-of-line                        # end
bindkey "^A" beginning-of-line                    # ctrl-a
bindkey "^E" end-of-line                          # ctrl-e
bindkey "^F" forward-word                         # ctrl-f
bindkey "^B" backward-word                        # ctrl-b
bindkey '^[[1;5C' forward-word                    # ctrl + ->
bindkey '^[[1;5D' backward-word                   # ctrl + <-

# search history
bindkey ' ' magic-space                           # do history expansion on space
bindkey '^r' history-incremental-pattern-search-backward
bindkey '^s' history-incremental-pattern-search-forward
bindkey '^P' up-history                           # ctrl-p
bindkey '^N' down-history                         # ctrl-n
bindkey '^[[5~' beginning-of-buffer-or-history    # page up
bindkey '^[[6~' end-of-buffer-or-history          # page down

#-----------------------------------------------------
# https://github.com/zsh-users/zsh-history-substring-search
bindkey '^[[A' history-substring-search-up
bindkey '^[[B' history-substring-search-down
bindkey "^R" history-incremental-search-backward  # ctrl-r
bindkey "[B" history-search-forward               # down arrow
bindkey "[A" history-search-backward              # up arrow

# vim mode keybindings
#bindkey -v

bindkey -M viins '^?' backward-delete-char
bindkey -M viins '^h' backward-delete-char
bindkey -M viins '^w' backward-kill-word
bindkey -M viins '^u' backward-kill-line
bindkey -M viins '^p' up-line-or-history
bindkey -M viins '^n' down-line-or-history
bindkey -M viins '^a' beginning-of-line
bindkey -M viins '^e' end-of-line
bindkey -M viins '^k' kill-line
bindkey -M viins '^y' yank
bindkey -M viins '^_' undo
bindkey -M viins '^x^r' redisplay
#bindkey -M viins '\eOH' beginning-of-line       # Home
#bindkey -M viins '\eOF' end-of-line             # End
#bindkey -M viins '\e[2~' overwrite-mode         # Insert
#bindkey -M viins '\ef' forward-word             # Alt-f
#bindkey -M viins '\eb' backward-word            # Alt-b
#bindkey -M viins '\ed' kill-word                # Alt-d
#bindkey -M vicmd '/' vi-history-search-forward
#bindkey -M vicmd '?' vi-history-search-backward
#bindkey -M vicmd '\e[5~' history-beginning-search-backward  # PageUp
#bindkey -M vicmd '\e[6~' history-beginning-search-forward   # PageDown