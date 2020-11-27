#
#     ███████╗███████╗██╗  ██╗██████╗  ██████╗
#     ╚══███╔╝██╔════╝██║  ██║██╔══██╗██╔════╝
#       ███╔╝ ███████╗███████║██████╔╝██║
#      ███╔╝  ╚════██║██╔══██║██╔══██╗██║
#  ██╗███████╗███████║██║  ██║██║  ██║╚██████╗
#  ╚═╝╚══════╝╚══════╝╚═╝  ╚═╝╚═╝  ╚═╝ ╚═════╝
#


/bin/cat  ~/.cache/wal/sequences
# P10k instant prompt
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi


autoload -Uz compinit
compinit
zstyle ':completion:*' menu select
zmodload zsh/complist

# use the vi navigation keys in menu completion
bindkey -M menuselect 'h' vi-backward-char
bindkey -M menuselect 'k' vi-up-line-or-history
bindkey -M menuselect 'l' vi-forward-char
bindkey -M menuselect 'j' vi-down-line-or-history
setopt COMPLETE_ALIASES

#source ~/.zplug/init.zsh

function dot_commit() {
    yadm commit -m "$1"
}

export PATH=$HOME/go/bin:$HOME/.rbenv/bin:$HOME/.rvm/bin:$HOME/.pyenv/bin:$HOME/gems/bin:$HOME/.rvm/gems/ruby-2.7.0/bin:/home/linuxbrew/.linuxbrew/bin:$HOME/bin:/usr/local/bin:$HOME/.cargo/bin:$PATH
export GEM_HOME="$HOME/gems"
export UPDATE_ZSH_DAYS=1
#zmodload zsh/zpty

#Path to your oh-my-zsh installation.
export ZSH="/home/gh0st/.oh-my-zsh"

ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE="fg=#00afff"
ZSH_AUTOSUGGEST_STRATEGY=(history completion)
ZSH_THEME="powerlevel10k/powerlevel10k"

plugins=(command-not-found colored-man-pages emacs git sudo zsh-autosuggestions zsh-syntax-highlighting)

source $ZSH/oh-my-zsh.sh

# Aliases
alias de="/usr/bin/emacs --with-profile doom"
alias sudo='sudo '
alias ez="emacs ~/.zshrc"
alias sz="source ~/.zshrc"
alias cat="bat"
alias ls="exa -lah"
alias lw="exa -a"
alias fp="fontpreview"
#alias vim="e"
alias E="SUDO_EDITOR=\"eframe\" sudo -e"
alias ei3="emacs ~/.i3/config"
alias -g G="| grep"
alias gogh='bash -c  "$(wget -qO- https://git.io/vQgMr)"'
#alias emc="emacsclient -tty --alternate-editor=\"\""
alias emct="SUDO_EDITOR=\"emacsclient -c -n --alternate-editor=\" sudo -e"
#alias emc="emacsclient -c -t -s instance1"
alias dfs="yadm status"
alias dfa="yadm add -u :/"
alias dfc=dot_commit $*
alias dfp="yadm push"
alias dfac="yadm add -u :/ && dot_commit $*" # TODO: Make this a shellscript
alias dfacp="yadm add -u :/ && dot_commit $* && dfp && dfs" # TODO: Shellscript
alias paci="sudo pacman -S"
alias pacs="sudo pacman -Ss"
alias pacu="sudo pacman -Syyu"
alias pacr="sudo pacman -Rs"
alias hugostart="cd $HOME/github/www/myblog && hugo serve &"
alias piholes="ssh pi@192.168.254.100 \"pihole -t\""
alias cs="cht.sh --shell"
alias udb="sudo updatedb"
alias scs="sudo systemctl start"
alias scst="sudo systemctl stop"
alias sce="sudo systemctl enable"
alias scstat="sudo systemctl status"
alias scd="sudo systemctl disable"
alias scr="sudo systemctl restart"
alias vi="/usr/bin/vim"
alias fcu="sudo fc-cache -f -v"
alias fcl="sudo fc-list -v G"
eval "$(navi widget zsh)"
alias map="telnet mapscii.me"

[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

source /usr/share/nvm/init-nvm.sh
eval "$(navi widget zsh)"
eval "$(pyenv virtualenv-init -)"
eval "$(pyenv init -)"
eval "$(rbenv init -)"
#[[ -s /home/gh0st/.autojump/etc/profile.d/autojump.sh ]] && source /home/gh0st/.autojump/etc/profile.d/autojump.sh

#autoload -U compinit && compinit -u
