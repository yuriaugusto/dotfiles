#-----------------------------------------------------
# Set VIM mode
# e.g. https://dougblack.io/words/zsh-vi-mode.html
# Key code table: https://www.zsh.org/mla/users/2014/msg00266.html

zmodload zsh/complist

typeset -gA keys=(
    Up                   '^[[A'
    Down                 '^[[B'
    Right                '^[[C'
    Left                 '^[[D'
    Home                 '^[[H'
    End                  '^[[F'
    Insert               '^[[2~'
    Delete               '^[[3~'
    PageUp               '^[[5~'
    PageDown             '^[[6~'
    Backspace            '^?'

    Shift+Up             '^[[1;2A'
    Shift+Down           '^[[1;2B'
    Shift+Right          '^[[1;2C'
    Shift+Left           '^[[1;2D'
    Shift+End            '^[[1;2F'
    Shift+Home           '^[[1;2H'
    Shift+Insert         '^[[2;2~'
    Shift+Delete         '^[[3;2~'
    Shift+PageUp         '^[[5;2~'
    Shift+PageDown       '^[[6;2~'
    Shift+Backspace      '^?'
    Shift+Tab            '^[[Z'

    Alt+Up               '^[[1;3A'
    Alt+Down             '^[[1;3B'
    Alt+Right            '^[[1;3C'
    Alt+Left             '^[[1;3D'
    Alt+End              '^[[1;3F'
    Alt+Home             '^[[1;3H'
    Alt+Insert           '^[[2;3~'
    Alt+Delete           '^[[3;3~'
    Alt+PageUp           '^[[5;3~'
    Alt+PageDown         '^[[6;3~'
    Alt+Backspace        '^[^?'

    Alt+Shift+Up         '^[[1;4A'
    Alt+Shift+Down       '^[[1;4B'
    Alt+Shift+Right      '^[[1;4C'
    Alt+Shift+Left       '^[[1;4D'
    Alt+Shift+End        '^[[1;4F'
    Alt+Shift+Home       '^[[1;4H'
    Alt+Shift+Insert     '^[[2;4~'
    Alt+Shift+Delete     '^[[3;4~'
    Alt+Shift+PageUp     '^[[5;4~'
    Alt+Shift+PageDown   '^[[6;4~'
    Alt+Shift+Backspace  '^[^H'

    Ctrl+Up              '^[[1;5A'
    Ctrl+Down            '^[[1;5B'
    Ctrl+Right           '^[[1;5C'
    Ctrl+Left            '^[[1;5D'
    Ctrl+Home            '^[[1;5H'
    Ctrl+End             '^[[1;5F'
    Ctrl+Insert          '^[[2;5~'
    Ctrl+Delete          '^[[3;5~'
    Ctrl+PageUp          '^[[5;5~'
    Ctrl+PageDown        '^[[6;5~'
    Ctrl+Backspace       '^H'

    Ctrl+Shift+Up        '^[[1;6A'
    Ctrl+Shift+Down      '^[[1;6B'
    Ctrl+Shift+Right     '^[[1;6C'
    Ctrl+Shift+Left      '^[[1;6D'
    Ctrl+Shift+Home      '^[[1;6H'
    Ctrl+Shift+End       '^[[1;6F'
    Ctrl+Shift+Insert    '^[[2;6~'
    Ctrl+Shift+Delete    '^[[3;6~'
    Ctrl+Shift+PageUp    '^[[5;6~'
    Ctrl+Shift+PageDown  '^[[6;6~'
    Ctrl+Shift+Backspace '^?'

    Ctrl+Alt+Up          '^[[1;7A'
    Ctrl+Alt+Down        '^[[1;7B'
    Ctrl+Alt+Right       '^[[1;7C'
    Ctrl+Alt+Left        '^[[1;7D'
    Ctrl+Alt+Home        '^[[1;7H'
    Ctrl+Alt+End         '^[[1;7F'
    Ctrl+Alt+Insert      '^[[2;7~'
    Ctrl+Alt+Delete      '^[[3;7~'
    Ctrl+Alt+PageUp      '^[[5;7~'
    Ctrl+Alt+PageDown    '^[[6;7~'
    Ctrl+Alt+Backspace   '^[^H'

    Ctrl+Alt+Shift+Up        '^[[1;8A'
    Ctrl+Alt+Shift+Down      '^[[1;8B'
    Ctrl+Alt+Shift+Right     '^[[1;8C'
    Ctrl+Alt+Shift+Left      '^[[1;8D'
    Ctrl+Alt+Shift+Home      '^[[1;8H'
    Ctrl+Alt+Shift+End       '^[[1;8F'
    Ctrl+Alt+Shift+Insert    '^[[2;8~'
    Ctrl+Alt+Shift+Delete    '^[[3;8~'
    Ctrl+Alt+Shift+PageUp    '^[[5;8~'
    Ctrl+Alt+Shift+PageDown  '^[[6;8~'
    Ctrl+Alt+Shift+Backspace '^?'
  )

# emacs keybindings
bindkey -e

bindkey -- "${keys[Backspace]}"  backward-delete-char
bindkey -- "${keys[Ctrl+Backspace]}"  backward-kill-word
bindkey -- "${keys[Ctrl+Delete]}"  kill-word
bindkey -- "${keys[Delete]}"  delete-char
bindkey -- "${keys[Shift+Tab]}"  undo
bindkey -- "${keys[End]}"  end-of-line
bindkey -- "${keys[Ctrl+Right]}"  forward-word
bindkey -- "${keys[Ctrl+Left]}"  backward-word
             
bindkey '^w' backward-kill-word                                   # ctrl-w
bindkey '^U'  backward-kill-line                                  # ctrl-U
bindkey "^K" kill-line                                            # ctrl-k
bindkey "^D" delete-char                                          # ctrl-d
bindkey "^L" clear-screen                                         # ctrl-l
bindkey "^A" beginning-of-line                                    # ctrl-a
bindkey "^E" end-of-line                                          # ctrl-e
bindkey "^F" forward-word                                         # ctrl-f
bindkey "^B" backward-word                                        # ctrl-b


# search history
bindkey '^r' history-incremental-pattern-search-backward
bindkey '^s' history-incremental-pattern-search-forward
bindkey '^P' up-history                           # ctrl-p
bindkey '^N' down-history                         # ctrl-n
bindkey -- "${keys[PageUp]}" beginning-of-buffer-or-history     # page up
bindkey -- "${keys[PageDown]}" end-of-buffer-or-history         # page down

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