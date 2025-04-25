# main prompt
PROMPT='%(?:%{$fg_bold[green]%}➜ :%{$fg_bold[yellow]%}➜ ) %{$fg[cyan]%}%c%{$reset_color%} $(custom_git_prompt_info)'

# Git
ZSH_THEME_GIT_PROMPT_PREFIX="%{$fg[blue]%}\uE0A0(%{$fg[yellow]%}"
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$fg[blue]%})%{$reset_color%}"

function custom_git_prompt_info() {
  if git rev-parse --is-inside-work-tree &>/dev/null; then
    local branch=$(git symbolic-ref --short HEAD 2>/dev/null)
    local gstatus=""
    if [[ -n "$(git status --porcelain 2>/dev/null)" ]]; then
      gstatus="%{$fg_bold[red]%}✗%{$reset_color%}  "
    else
      gstatus="%{$fg_bold[green]%}✓%{$reset_color%}  "
    fi
    echo "%{$fg[blue]%}\uE0A0[%{$fg[yellow]%}$branch%{$fg[blue]%}] $gstatus%{$reset_color%}"
  else
    echo "%{$fg_bold[yellow]%}●%{$reset_color%}  " 
  fi
}


