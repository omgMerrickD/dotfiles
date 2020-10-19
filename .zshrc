# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

source ~/.zplug/init.zsh

function dot_commit() {
    yadm commit -m "$1"
}

# If you come from bash you might have to change your $PATH.
export PATH=/home/gh0st/.rvm/gems/ruby-2.7.0/bin:/home/linuxbrew/.linuxbrew/bin:$HOME/bin:/usr/local/bin:/home/gh0st/.cargo/bin:$PATH

zmodload zsh/zpty

#Path to your oh-my-zsh installation.
export ZSH="/home/gh0st/.oh-my-zsh"

ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE="fg=#00afff"
ZSH_AUTOSUGGEST_STRATEGY=(history completion)

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="powerlevel10k/powerlevel10k"

plugins=(git colored-man-pages zsh-autosuggestions zsh-syntax-highlighting)


source $ZSH/oh-my-zsh.sh

# Example aliases
# alias ohmyzsh="mate ~/.oh-my-zsh"
alias ez="vim ~/.zshrc"
alias sz="source ~/.zshrc"
alias cat="bat"
alias ls="exa -lah"
alias lw="exa -a"
alias fp="fontpreview"
alias ei3="vim ~/.i3/config"
alias gogh='bash -c  "$(wget -qO- https://git.io/vQgMr)"'
alias emc="emacsclient -nc -s instance1"
alias dfs="yadm status"
alias dfa="yadm add -u :/"
alias dfc=dot_commit $*
alias dfp="yadm push"
alias dfac="yadm add -u :/ && dot_commit $*"
alias dfacp="yadm add -u :/ && dot_commit $* && dfp && dfs"
eval "$(navi widget zsh)"

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# Add RVM to PATH for scripting. Make sure this is the last PATH variable change.
export PATH="$PATH:$HOME/.rvm/bin"
