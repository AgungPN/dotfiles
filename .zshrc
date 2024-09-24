source ~/powerlevel10k/powerlevel10k.zsh-theme

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
	docker
	laravel 
	pip
	yarn
	zsh-autosuggestions
	zsh-syntax-highlighting
)

HISTDUP=erase # delete duplicate history

# ==================================
# SOURCE ZSH FILES
# ==================================
# source $ZSH/oh-my-zsh.sh
source ~/.oh-my-zsh/oh-my-zsh.sh
source ~/.zshconfig/.zsh-aliases
source ~/.zshconfig/.zshenv
source ~/.zshconfig/.zshnvim

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
#   export EDITOR='nvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ==================================
# FZF Section
# ==================================
# export FZF_CTRL_T_OPTS="--preview 'bat -n --color=always --line-range :500 {}'"
# export FZF_ALT_C_OPTS="--preview 'eza --tree --color=always {} | head -200'"

export FZF_DEFAULT_COMMAND='rg --files --no-ignore --hidden --follow --glob "!.git/*"'
export FZF_DEFAULT_OPTS="--height 50% -1 --layout=reverse-list --multi --preview='[[ \$(file --mime {}) =~ binary ]] && echo {} is a binary file || (bat --style=numbers --color=always {} || cat {}) 2> /dev/null | head -300'"
[ -f /usr/share/fzf/shell/key-bindings.zsh ] && source /usr/share/fzf/shell/key-bindings.zsh
# Mengganti pencarian default Zsh dengan fzf
bindkey '^R' fzf-history-widget

# Bat Config
export BAT_THEME=tokyonight_night

# ==================================
# calling NVM
# ==================================
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh


# export PATH=$PATH:/home/linux/.spicetify

# Change default version node by NVM
# nvm use 20
# clear

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/home/linux/miniconda3/bin/conda' 'shell.bash' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/home/linux/miniconda3/etc/profile.d/conda.sh" ]; then
        . "/home/linux/miniconda3/etc/profile.d/conda.sh"
    else
        export PATH="/home/linux/miniconda3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<



clear


# ================================
# CLOUD RUN REPOSITORY CONFIG
# ================================
eval 'set +o history' 2>/dev/null || setopt HIST_IGNORE_SPACE 2>/dev/null
 touch ~/.gitcookies
 chmod 0600 ~/.gitcookies

 git config --global http.cookiefile ~/.gitcookies

 tr , \\t <<\__END__ >>~/.gitcookies
source.developers.google.com,FALSE,/,TRUE,2147483647,o,git-672021077.student.uksw.edu=1//0gjqzuiYVnC1SCgYIARAAGBASNwF-L9IrGrBhdKF0plilxNu9of7IXKJITuEZBF6FNoK1UIbvzPVgGCyeumqL4O2qM70aywsCa6g
__END__
eval 'set -o history' 2>/dev/null || unsetopt HIST_IGNORE_SPACE 2>/dev/null


# The next line updates PATH for the Google Cloud SDK.
if [ -f '/home/linux/Downloads/google-cloud-sdk/path.zsh.inc' ]; then . '/home/linux/Downloads/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/home/linux/Downloads/google-cloud-sdk/completion.zsh.inc' ]; then . '/home/linux/Downloads/google-cloud-sdk/completion.zsh.inc'; fi

# add Pulumi to the PATH
export PATH=$PATH:/home/linux/.pulumi/bin

export WASMTIME_HOME="$HOME/.wasmtime"

export PATH="$WASMTIME_HOME/bin:$PATH"
