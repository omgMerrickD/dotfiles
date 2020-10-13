if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

export PATH=/home/vexed/.rvm/gems/ruby-2.7.0/bin:/home/linuxbrew/.linuxbrew/bin:$HOME/bin:/usr/local/bin:/home/vexed/.cargo/bin:$PATH

export RST_SRC_PATH=/usr/local/src/rust/src

zmodload zsh/zpty

export ZSH="/home/vexed/.oh-my-zsh"

ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE="fg=#00afff"
ZSH_AUTOSUGGEST_STRATEGY=(history completion)
ZSH_THEME="powerlevel10k/powerlevel10k"
plugins=(git colored-man-pages zsh-autosuggestions zsh-syntax-highlighting)

source $ZSH/oh-my-zsh.sh

alias vim='nvim'
alias ez="vim ~/.zshrc"
alias sz="source ~/.zshrc"
alias cat="bat"
alias ls="exa -lah"
alias lw="exa -a"
alias fp="fontpreview"
alias ei3="vim ~/.i3/config"
alias gogh='bash -c  "$(wget -qO- https://git.io/vQgMr)"'
eval "$(navi widget zsh)"

[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

export PATH="$PATH:$HOME/.rvm/bin"
