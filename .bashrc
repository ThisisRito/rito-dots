# fzf
export FZF_DEFAULT_COMMAND='rg'

if type rg &> /dev/null; then
	export FZF_DEFAULT_COMMAND='rg --files --hidden --ignore-file ~/.ignore'
	export FZF_DEFAULT_OPTS='-m'
fi
