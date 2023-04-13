# fzf
export FZF_DEFAULT_COMMAND='rg'

if type rg &> /dev/null; then
	export FZF_DEFAULT_COMMAND='rg --files --hidden --no-ignore'
	export FZF_DEFAULT_OPTS='-m --bind ctrl-u:preview-half-page-up,ctrl-d:preview-half-page-down'
fi
