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

alias cpv="rsync -poghb --backup-dir=/tmp/rsync -e /dev/null --progress --"                   # Copy files with a progress bar

alias ls="exa -lah"                                                                           # Exa: List directory in long format
alias lw="exa -a"                                                                             # Exa: List directory in wide format
alias fp="fontpreview"                                                                        # Preview fonts from the command line
#alias vim="e"
alias E="SUDO_EDITOR=\"eframe\" sudo -e"
alias ei3="emacs ~/.i3/config"                                                                # Edit the i3wm config
alias -g G="| grep"                                                                           # G to grep
alias gogh='bash -c  "$(wget -qO- https://git.io/vQgMr)"'
#alias emc="emacsclient -tty --alternate-editor=\"\""
alias emct="SUDO_EDITOR=\"emacsclient -c -n --alternate-editor=\" sudo -e"
#alias emc="emacsclient -c -t -s instance1"
alias dfs="yadm status"                                                                       # Dotfiles: Check git status
#alias dfa="yadm add -u :/"                                                                   # Dotfiles: Stage ALL changed files
alias dfa="yadm add"                                                                          # Dotfiles: Stage individual file
alias dfc=dot_commit $*
alias dfp="yadm push"                                                                         # Dotfiles: Push to github
alias dfac="yadm add && dot_commit $*" # TODO: Make this a shellscript
alias dfacp="yadm add && dot_commit $* && dfp && dfs" # TODO: Shellscript
alias paci="sudo pacman -S"                                                                   # Pacman: Install a package
alias pacs="sudo pacman -Ss"                                                                  # Pacman: Search for a package
alias pacu="sudo pacman -Syyu"                                                                # Pacman: Update the system
alias pacr="sudo pacman -Rs"                                                                  # Pacman: Remove a package
alias hugostart="cd $HOME/github/hugo/myblog && hugo serve --disableFastRender"               # Start the Hugo web server for my blog
alias myip="dig +short myip.opendns.com @resolver1.opendns.com"                               # Display my current external IP address
alias piholes="ssh pi@192.168.254.100 \"pihole -t\""                                          # Raspberry Pi: Connect to my Pi
alias cs="cht.sh --shell"                                                                     # Cheatsheet: Launch the shell client
alias udb="sudo updatedb"                                                                     # Update the mlocate (search) database
alias scs="sudo systemctl start"                                                              # Systemctl: Start <service>
alias scst="sudo systemctl stop"                                                              # Systemctl: Stop <service>
alias sce="sudo systemctl enable"                                                             # Systemctl: Enable <service>
alias scstat="sudo systemctl status"                                                          # Systemctl: Get status of <service> 
alias scd="sudo systemctl disable"                                                            # Systemctl: Disable <service>
alias scr="sudo systemctl restart"                                                            # Systemctl: Restart <service>
alias vi="/usr/bin/vim"
alias fcu="sudo fc-cache -f -v"                                                               # Fonts: Update the font cache
alias fcl="sudo fc-list -v G"                                                                 # Fonts: List details of <fontname>
eval "$(navi widget zsh)"
alias map="telnet mapscii.me"                                                                 # Mapscii: Google maps for the terminal

# Setup grep to be a bit more nice
  # check if 'x' grep argument available
   grep-flag-available() {
         echo | grep $1 "" >/dev/null 2>&1
   }
 
   local GREP_OPTIONS=""
 
   # color grep results
   if grep-flag-available --color=auto; then
         GREP_OPTIONS+=" --color=auto"
   fi
 
   # ignore VCS folders (if the necessary grep flags are available)
   local VCS_FOLDERS="{.bzr,CVS,.git,.hg,.svn}"
 
   if grep-flag-available --exclude-dir=.cvs; then
         GREP_OPTIONS+=" --exclude-dir=$VCS_FOLDERS"
   elif grep-flag-available --exclude=.cvs; then
         GREP_OPTIONS+=" --exclude=$VCS_FOLDERS"
   fi
 
   # export grep settings
   alias grep="grep $GREP_OPTIONS"
 
   # clean up
   unfunction grep-flag-available

[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

source /usr/share/nvm/init-nvm.sh
eval "$(navi widget zsh)"
eval "$(pyenv virtualenv-init -)"
eval "$(pyenv init -)"
eval "$(rbenv init -)"
[[ -s /home/gh0st/.autojump/etc/profile.d/autojump.sh ]] && source /home/gh0st/.autojump/etc/profile.d/autojump.sh

#autoload -U compinit && compinit -u
