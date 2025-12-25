# ~/.zshrc file for zsh interactive shells.
# see /usr/share/doc/zsh/examples/zshrc for examples


setopt autocd              # change directory just by typing its name
#setopt correct            # auto correct mistakes
setopt interactivecomments # allow comments in interactive mode
setopt magicequalsubst     # enable filename expansion for arguments of the form ‘anything=expression’
setopt nonomatch           # hide error message if there is no match for the pattern
setopt notify              # report the status of background jobs immediately
setopt numericglobsort     # sort filenames numerically when it makes sense
setopt promptsubst         # enable command substitution in prompt

WORDCHARS=${WORDCHARS//\/} # Don't consider certain characters part of the word

# hide EOL sign ('%')
PROMPT_EOL_MARK=""

# configure key keybindings
bindkey -e                                        # emacs key bindings
bindkey ' ' magic-space                           # do history expansion on space
bindkey '^U' backward-kill-line                   # ctrl + U
bindkey '^[[3;5~' kill-word                       # ctrl + Supr
bindkey '^[[3~' delete-char                       # delete
bindkey '^[[1;5C' forward-word                    # ctrl + ->
bindkey '^[[1;5D' backward-word                   # ctrl + <-
bindkey '^[[5~' beginning-of-buffer-or-history    # page up
bindkey '^[[6~' end-of-buffer-or-history          # page down
bindkey '^[[H' beginning-of-line                  # home
bindkey '^[[F' end-of-line                        # end
bindkey '^[[Z' undo                               # shift + tab undo last action

# enable completion features
autoload -Uz compinit
compinit -d ~/.cache/zcompdump
zstyle ':completion:*:*:*:*:*' menu select
zstyle ':completion:*' auto-description 'specify: %d'
zstyle ':completion:*' completer _expand _complete
zstyle ':completion:*' format 'Completing %d'
zstyle ':completion:*' group-name ''
zstyle ':completion:*' list-colors ''
zstyle ':completion:*' list-prompt %SAt %p: Hit TAB for more, or the character to insert%s
zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}'
zstyle ':completion:*' rehash true
zstyle ':completion:*' select-prompt %SScrolling active: current selection at %p%s
zstyle ':completion:*' use-compctl false
zstyle ':completion:*' verbose true
zstyle ':completion:*:kill:*' command 'ps -u $USER -o pid,%cpu,tty,cputime,cmd'

# History configurations
HISTFILE=~/.zsh_history
HISTSIZE=500000
SAVEHIST=500000

# Enhanced history settings
setopt HIST_IGNORE_DUPS       # Ignore duplicate commands in the history
setopt HIST_IGNORE_ALL_DUPS    # Remove all duplicates, keeping only the last occurrence
setopt HIST_IGNORE_SPACE       # Don't save commands that start with a space
setopt HIST_FIND_NO_DUPS       # Don't display duplicate history matches
setopt HIST_SAVE_NO_DUPS       # Don’t write duplicate commands to HISTFILE
setopt SHARE_HISTORY           # Share history across multiple zsh sessions
setopt INC_APPEND_HISTORY      # Append commands as they are entered, not at session end
setopt EXTENDED_HISTORY        # Store additional command timestamp data

setopt hist_expire_dups_first # delete duplicates first when HISTFILE size exceeds HISTSIZE
setopt hist_ignore_dups       # ignore duplicated commands history list
setopt hist_ignore_space      # ignore commands that start with space
setopt hist_verify            # show command with history expansion to user before running it

#setopt share_history         # share command history data

# force zsh to show the complete history
alias history="history 0"

# configure `time` format
TIMEFMT=$'\nreal\t%E\nuser\t%U\nsys\t%S\ncpu\t%P'

NEWLINE=$'\n'
PROMPT="${NEWLINE}%K{#2E3440}%F{#E5E9F0}$(date +%_I:%M%P) %K{#3b4252}%F{#ECEFF4} %n %K{#4c566a} %~ %f%k ❯ " # nord theme
		echo -e "${NEWLINE}\033[48;2;46;52;64;38;2;216;222;233m $0 \033[0m\033[48;2;59;66;82;38;2;216;222;233m $(uptime -p | cut -c 4-) \033[0m\033[48;2;76;86;106;38;2;216;222;233m $(uname -r) \033[0m" # nord theme
		# make less more friendly for non-text input files, see lesspipe(1)
		#[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

	# enable syntax-highlighting
	if [ -f /usr/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh ]; then
			. /usr/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
			ZSH_HIGHLIGHT_HIGHLIGHTERS=(main brackets pattern)
			ZSH_HIGHLIGHT_STYLES[default]=none
			ZSH_HIGHLIGHT_STYLES[unknown-token]=underline
			ZSH_HIGHLIGHT_STYLES[reserved-word]=fg=cyan,bold
			ZSH_HIGHLIGHT_STYLES[suffix-alias]=fg=green,underline
			ZSH_HIGHLIGHT_STYLES[global-alias]=fg=green,bold
			ZSH_HIGHLIGHT_STYLES[precommand]=fg=green,underline
			ZSH_HIGHLIGHT_STYLES[commandseparator]=fg=blue,bold
			ZSH_HIGHLIGHT_STYLES[autodirectory]=fg=green,underline
			ZSH_HIGHLIGHT_STYLES[path]=bold
			ZSH_HIGHLIGHT_STYLES[path_pathseparator]=
			ZSH_HIGHLIGHT_STYLES[path_prefix_pathseparator]=
			ZSH_HIGHLIGHT_STYLES[globbing]=fg=blue,bold
			ZSH_HIGHLIGHT_STYLES[history-expansion]=fg=blue,bold
			ZSH_HIGHLIGHT_STYLES[command-substitution]=none
			ZSH_HIGHLIGHT_STYLES[command-substitution-delimiter]=fg=magenta,bold
			ZSH_HIGHLIGHT_STYLES[process-substitution]=none
			ZSH_HIGHLIGHT_STYLES[process-substitution-delimiter]=fg=magenta,bold
			ZSH_HIGHLIGHT_STYLES[single-hyphen-option]=fg=green
			ZSH_HIGHLIGHT_STYLES[double-hyphen-option]=fg=green
			ZSH_HIGHLIGHT_STYLES[back-quoted-argument]=none
			ZSH_HIGHLIGHT_STYLES[back-quoted-argument-delimiter]=fg=blue,bold
			ZSH_HIGHLIGHT_STYLES[single-quoted-argument]=fg=yellow
			ZSH_HIGHLIGHT_STYLES[double-quoted-argument]=fg=yellow
			ZSH_HIGHLIGHT_STYLES[dollar-quoted-argument]=fg=yellow
			ZSH_HIGHLIGHT_STYLES[rc-quote]=fg=magenta
			ZSH_HIGHLIGHT_STYLES[dollar-double-quoted-argument]=fg=magenta,bold
			ZSH_HIGHLIGHT_STYLES[back-double-quoted-argument]=fg=magenta,bold
			ZSH_HIGHLIGHT_STYLES[back-dollar-quoted-argument]=fg=magenta,bold
			ZSH_HIGHLIGHT_STYLES[assign]=none
			ZSH_HIGHLIGHT_STYLES[redirection]=fg=blue,bold
			ZSH_HIGHLIGHT_STYLES[comment]=fg=black,bold
			ZSH_HIGHLIGHT_STYLES[named-fd]=none
			ZSH_HIGHLIGHT_STYLES[numeric-fd]=none
			ZSH_HIGHLIGHT_STYLES[arg0]=fg=cyan
			ZSH_HIGHLIGHT_STYLES[bracket-error]=fg=red,bold
			ZSH_HIGHLIGHT_STYLES[bracket-level-1]=fg=blue,bold
			ZSH_HIGHLIGHT_STYLES[bracket-level-2]=fg=green,bold
			ZSH_HIGHLIGHT_STYLES[bracket-level-3]=fg=magenta,bold
			ZSH_HIGHLIGHT_STYLES[bracket-level-4]=fg=yellow,bold
			ZSH_HIGHLIGHT_STYLES[bracket-level-5]=fg=cyan,bold
			ZSH_HIGHLIGHT_STYLES[cursor-matchingbracket]=standout
	fi
	# enable color support of ls, less and man, and also add handy aliases
	if [ -x /usr/bin/dircolors ]; then
			test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
			export LS_COLORS="$LS_COLORS:ow=30;44:" # fix ls color for folders with 777 permissions

			export LESS_TERMCAP_mb=$'\E[1;31m'     # begin blink
			export LESS_TERMCAP_md=$'\E[1;36m'     # begin bold
			export LESS_TERMCAP_me=$'\E[0m'        # reset bold/blink
			export LESS_TERMCAP_so=$'\E[01;33m'    # begin reverse video
			export LESS_TERMCAP_se=$'\E[0m'        # reset reverse video
			export LESS_TERMCAP_us=$'\E[1;32m'     # begin underline
			export LESS_TERMCAP_ue=$'\E[0m'        # reset underline

	# Take advantage of $LS_COLORS for completion as well
	zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"
	zstyle ':completion:*:*:kill:*:processes' list-colors '=(#b) #([0-9]#)*=0=01;31'
	fi

# some more ls aliases
alias ll='ls -l'
alias la='ls -A'
alias l='ls -CF'
alias ls='ls --color=auto'

# enable auto-suggestions based on the history
if [ -f /usr/share/zsh-autosuggestions/zsh-autosuggestions.zsh ]; then
		. /usr/share/zsh-autosuggestions/zsh-autosuggestions.zsh
		# change suggestion color
		ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=#999'
fi

# enable command-not-found if installed
if [ -f /etc/zsh_command_not_found ]; then
		. /etc/zsh_command_not_found
fi

LF_ICONS=$(sed ~/.config/lf/diricons \
            -e '/^[ \t]*#/d'       \
            -e '/^[ \t]*$/d'       \
            -e 's/[ \t]\+/=/g'     \
            -e 's/$/ /')
LF_ICONS=${LF_ICONS//$'\n'/:}
export LF_ICONS

[ -f "$HOME/.dotfiles/aliases" ] && source "$HOME/.dotfiles/aliases"
[ -f "$HOME/.dotfiles/vars" ] && source "$HOME/.dotfiles/vars"
source /usr/share/zsh/site-functions/zsh-syntax-highlighting.zsh
source /usr/share/zsh/site-functions/zsh-autosuggestions.zsh
export PATH=$PATH:/bin:$HOME/.local/bin:$HOME/Scripts:$HOME/go/bin
VIMRUNTIME=/usr/share/nvim/runtime
GTK_IM_MODULE=ibus
QT_IM_MODULE=ibus
XMODIFIERS=@im=ibus
XDG_RUNTIME_DIR=/run/user/$(id -u)

export XCURSOR_THEME="Adwaita"
export XCURSOR_SIZE=24
export SYNC_ENDPOINT=https://bankaitab.space/ankisync
export SYNC_ENDPOINT_MEDIA=https://bankaitab.space/ankisync
export SYNC_HOST=::
export SYNC_PORT=9090
export SYNC_USER1=Gentoo:Alohomora#ANKI
export GOROOT=/usr/lib/go
export GOPATH=/usr/local/gopath
export GOPROXY=https://proxy.golang.org,direct
export GOSUMDB=sum.golang.org
export GOBIN=/usr/local/bin
export PATH=$PATH:$GOROOT/bin:$GOPATH/bin:$HOME/.nix-profile/bin
# export XKB_DEFAULT_LAYOUT=us
# export XKB_DEFAULT_VARIANT=colemak_dh
# export XKB_DEFAULT_OPTIONS=ctrl:nocaps
