#
#     ███████╗███████╗██╗  ██╗██████╗  ██████╗
#     ╚══███╔╝██╔════╝██║  ██║██╔══██╗██╔════╝
#       ███╔╝ ███████╗███████║██████╔╝██║
#      ███╔╝  ╚════██║██╔══██║██╔══██╗██║
#  ██╗███████╗███████║██║  ██║██║  ██║╚██████╗
#  ╚═╝╚══════╝╚══════╝╚═╝  ╚═╝╚═╝  ╚═╝ ╚═════╝
#

# P10k instant prompt
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

source ~/.zplug/init.zsh

function dot_commit() {
    yadm commit -m "$1"
}

export PATH=/home/gh0st/.rvm/gems/ruby-2.7.0/bin:/home/linuxbrew/.linuxbrew/bin:$HOME/bin:/usr/local/bin:/home/gh0st/.cargo/bin:$PATH

zmodload zsh/zpty

#Path to your oh-my-zsh installation.
export ZSH="/home/gh0st/.oh-my-zsh"

ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE="fg=#00afff"
ZSH_AUTOSUGGEST_STRATEGY=(history completion)
ZSH_THEME="powerlevel10k/powerlevel10k"

plugins=(git command-not-found colored-man-pages emacs sudo zsh-autosuggestions zsh-syntax-highlighting)


source $ZSH/oh-my-zsh.sh

# Aliases
alias sudo='sudo '
alias ez="emc ~/.zshrc"
alias sz="source ~/.zshrc"
alias cat="bat"
alias ls="exa -lah"
alias lw="exa -a"
alias fp="fontpreview"
alias vim="emc"
alias ei3="emc ~/.i3/config"
alias gogh='bash -c  "$(wget -qO- https://git.io/vQgMr)"'
alias emc="emacsclient -tty --alternate-editor=\"\""
alias emct="SUDO_EDITOR=\"emacsclient -c -n --alternate-editor=\" sudo -e"
#alias emc="emacsclient -c -t -s instance1"
alias dfs="yadm status"
alias dfa="yadm add -u :/"
alias dfc=dot_commit $*
alias dfp="yadm push"
alias dfac="yadm add -u :/ && dot_commit $*" # TODO: Make this a shellscript
alias dfacp="yadm add -u :/ && dot_commit $* && dfp && dfs" # TODO: Shellscript
alias inst="sudo pacman -S"
alias pacup="sudo pacman -Syyu"
alias hugostart="cd $HOME/code/www/myblog && hugo serve"
eval "$(navi widget zsh)"

[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

export PATH="$PATH:$HOME/.rvm/bin"
source /usr/share/nvm/init-nvm.sh
eval "$(navi widget zsh)"
export PATH="/home/gh0st/.pyenv/bin:$PATH"
eval "$(pyenv init -)"
eval "$(pyenv virtualenv-init -)"
export PATH="$HOME/.rbenv/bin:$PATH"
eval "$(rbenv init -)"
export GEM_HOME="$HOME/gems"
export PATH="$HOME/gems/bin:$PATH"
#(cat  ~/.cache/wal/sequences &)
