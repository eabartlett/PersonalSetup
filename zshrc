export WORKSPACE="$HOME/workspace"
export EDITOR=vim

# for FZF
if type rg &> /dev/null; then
  export FZF_DEFAULT_COMMAND='rg --files'
  export FZF_DEFAULT_OPTS='-m --height 50% --border'
fi

git_current_branch () {
  git rev-parse --abbrev-ref HEAD
}

git_push_new () {
  git push --set-upstream origin `git_current_branch`
}

gn () {
  git checkout -b $1 && git_push_new
}

gc () {
  git checkout $1
}

rt () {
  rake test TEST=$1
}

ip_addr() {
  dig +short myip.opendns.com @resolver1.opendns.com
}

delete_tickets () {
  for ticket in "$@"
  do
    b=`git branch | grep "$ticket" | xargs -n1 bash -c "git branch -D $1"`
  done
}

postpr () {
  current_branch=git_current_branch
  if [ "$current_branch" = "main" ]; then
    echo "Currently on main - don't post a pr on main"
  fi
  git_push_new
  gh pr create --fill
}

# personal aliases
alias cl="clear"
alias gitum="git checkout main && git pull"
alias gs="git status | lolcat"
alias gb="git branch | lolcat"
alias ff="fzf"
alias gitd="git branch -D"
alias gdbah="git diff @{upstream}"
