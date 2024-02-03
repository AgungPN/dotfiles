
# ==================================
# TMUX AUTOMATICALLY RUN
# ==================================
# function tmux_last_session(){
#     LAST_TMUX_SESSION=$(tmux list-sessions | awk -F ":" '{print$1}' | tail -n1);
#     tmux attach -t $LAST_TMUX_SESSION
# }

if [ "$TMUX" = "" ]; then tmux; fi

# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

ZSH_THEME="powerlevel10k/powerlevel10k"

# ==================================
# PLUGINS
# ==================================
plugins=(
	git
	yarn
	debian
	ubuntu
	laravel
	docker
	zsh-autosuggestions
	zsh-syntax-highlighting
)

# ==================================
# SOURCE ZSH FILES
# ==================================
source ~/.zshconfig/.zsh-aliases
source ~/.zshconfig/.zshenv
source ~/.zshconfig/.zshnvim
source $ZSH/oh-my-zsh.sh

# bindkey -v
# export KEYTIMEOUT=1
# bindkey -M menuselect '^h' vi-backward-char
# bindkey -M menuselect '^k' vi-up-line-or-history
# bindkey -M menuselect '^l' vi-forward-char
# bindkey -M menuselect '^j' vi-down-line-or-history

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"


[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# ==================================
# calling NVM
# ==================================
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh


export PATH=$PATH:/home/linux/.spicetify

# Change default version node by NVM
nvm use 16
clear
