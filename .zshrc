# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=10000
SAVEHIST=10000
PS1='%n@%m %~$ '
setopt autocd beep extendedglob nomatch notify
bindkey -e
bindkey "^[[3~" delete-char
# bindkey "^[[1;5D" backward-word
# bindkey "^[[1;5C" forward-word
bindkey "^[[1;3D" beginning-of-line
bindkey "^[[1;3C" end-of-line
# bindkey "^[[3;5~" delete-word
# bindkey "^H" backward-delete-word
# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
zstyle :compinstall filename '/home/tovermodus/.zshrc'

autoload -Uz compinit
compinit
# End of lines added by compinstall

source /home/tovermodus/.config/broot/launcher/bash/br

function ca {
    cd $1 && ls
}

function cb {
    cd $1 && ls -l
}
alias ls='ls --color=auto'
