# ~/.config/fish/config.fish

set fish_greeting ""

# Set environment / exports
set -Ux TERM xterm-256color
set -Ux EDITOR nvim

# General aliases
alias c clear
alias :q exit # because sometimes my fingers are stupid
# alias rmf 'rm -rf' # CAREFULL!!
alias mkdir 'mkdir -p'

# Eza
alias l 'eza -al --color=always --group-directories-first --git'
alias lt 'eza --tree --level=2 --long --icons --git'

# Zoxide
alias z __zoxide_z
alias zi __zoxide_zi
alias za 'zoxide add .'
alias ze 'zoxide edit'

# System
alias sf 'source ~/.config/fish/config.fish'
alias sp startplasma-wayland
alias hp Hyprland
alias sh 'echo $SHELL' # which shell in use

alias backup 'restic -r /media/restic/home/ --verbose backup /home/taz/ --exclude=".src"'

# Navigation
alias .1 'cd ..'
alias .2 'cd ../..'
alias .3 'cd ../../..'
alias .4 'cd ../../../..'
alias .5 'cd ../../../../..'

# App aliases
alias v nvim
alias vi nvim
alias y yazi
alias ff fastfetch
alias zed zeditor

# Github aliaseviations
alias lg lazygit
alias gl 'git log --graph --oneline'
alias gs 'git status'
alias gd 'git diff'
alias gf 'git fetch'
alias go 'git checkout'
alias gp 'git pull'
alias ga 'git add'
alias gb 'git branch'
alias gba 'git branch -a'
alias graph 'git log --all --decorate --oneline --graph'

# Path
alias path "echo $PATH | tr ':' '\n'"

# USB mnt
alias mms 'udisksctl mount -b /dev/sdb'
alias lms 'ln -sf /run/media/taz/transfer ~/Sony'
alias ums 'umount /dev/sdb && rm ~/Sony'

if status is-interactive
    zoxide init fish | source
    fzf --fish | source
    starship init fish | source
end


## EOF ##
