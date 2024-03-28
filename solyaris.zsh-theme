local ret_status="%(?:%B%F{green}‡%b%f:%B%F{red}‡%b%f)"
PROMPT='%B%F{magenta}%~%b%f $(git_prompt_info)
${ret_status} '

ZSH_THEME_GIT_PROMPT_PREFIX="%B%F{blue}(%b"
ZSH_THEME_GIT_PROMPT_SUFFIX="%f "
ZSH_THEME_GIT_PROMPT_DIRTY="%B%F{blue})%f %F{yellow}⛛%f%b"
ZSH_THEME_GIT_PROMPT_CLEAN="%B%F{blue})%b%f"
