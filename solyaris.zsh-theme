local ret_status="%(?:%{$fg_bold[green]%}‡:%{$fg_bold[red]%}‡)"
PROMPT='%{$fg_bold[magenta]%}%~$reset_color $(git_prompt_info)
${ret_status} $reset_color'

ZSH_THEME_GIT_PROMPT_PREFIX="%{$fg_bold[blue]%}($reset_color$fg[blue]"
ZSH_THEME_GIT_PROMPT_SUFFIX="$reset_color "
ZSH_THEME_GIT_PROMPT_DIRTY="%{$fg_bold[blue])%}%{$fg_bold[yellow]%} ⛛$reset_color"
ZSH_THEME_GIT_PROMPT_CLEAN="%{$fg_bold[blue])%}"
