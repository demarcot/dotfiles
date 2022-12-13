export USER=tcd
export ZSH=$HOME/.oh-my-zsh

# TODO(Tom): organize os specific path stuff
export PATH=$HOME/Documents/programs/nvim-macos/bin:$PATH
export PATH=/usr/local/sbin:${_HOMEBREW_PREFIX}/sbin:$PATH
export PATH=$HOME/bin:/usr/local/bin:$PATH

ZSH_THEME="gruvbox"
SOLARIZED_THEME="dark"

HYPHEN_INSENSITIVE="true" # TODO(Tom): why do I have this?

COMPLETION_WAITING_DOTS="%F{yellow}waiting...%f"

# HIST_STAMPS="mm/dd/yyyy"
HIST_STAMPS="%m/%d/%y %T "

plugins=(git)

if [[ $OS != Windows* ]]; then
 pb-kill-line () {
   zle kill-line
   echo -n $CUTBUFFER | pbcopy
 }

 zle -N pb-kill-line

 bindkey '^K' pb-kill-line
fi

source $ZSH/oh-my-zsh.sh

# User configuration
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='vim'
else
  export EDITOR='nvim'
fi

# Custom aliases 
alias e='nvim ~/.config/nvim/init.vim'
alias ze='nvim ~/.zshrc'
alias .z='source ~/.zshrc'
alias ll='ls -la'
alias gh-create-pr='gh pr create --title $(git branch --show-current)'
alias cdg='cd "$(git rev-parse --show-toplevel)"'

# Pull in local file (Useful for not pushing work stuff)
if [ -f ~/local_alias ]; then
    source ~/local_alias
else
    print "local alias file not found"
fi

# Show timestamps before and after commands
preexec() { date +%X.%N }
precmd() { date +%X.%N }
