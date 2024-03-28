# vim:ft=zsh

local ret_status="%(?:%B%F{green}‡%b%f:%B%F{red}‡%b%f)"
PROMPT='%B%F{magenta}%~%b%f $(git_prompt_info)$(git_prompt_status)
${ret_status} '

ZSH_THEME_GIT_PROMPT_PREFIX="%B%F{blue}(%b"
ZSH_THEME_GIT_PROMPT_SUFFIX="%f "
ZSH_THEME_GIT_PROMPT_DIRTY="%B%F{blue})%f %F{yellow}⛛%f%b"
ZSH_THEME_GIT_PROMPT_CLEAN="%B%F{blue})%b%f"

# ZSH_THEME_GIT_PROMPT_ADDED="added"
# ZSH_THEME_GIT_PROMPT_MODIFIED="modified"
# ZSH_THEME_GIT_PROMPT_DELETED="deleted"
# ZSH_THEME_GIT_PROMPT_RENAMED="renamed"
# ZSH_THEME_GIT_PROMPT_UNMERGED="unmerged"
# ZSH_THEME_GIT_PROMPT_UNTRACKED="untracked"
