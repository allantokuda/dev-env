alias g="git"
alias gcm="git commit -m"
alias gcam="git commit -am"
alias ga="git add --all"
alias gpff="git pull --ff-only"
alias gpr="git pull --rebase"
alias gpo="git fetch && git pull origin"
alias gf="git fetch"
alias gau="git add --update :/"
alias gs="git status --short"
alias gr="git reset"
alias gcane="git commit --amend --no-edit"
alias grbi="git rebase --interactive"
alias grbc="git rebase --continue"
alias grh="git reset --hard"
alias glA="gl --author=Allan"
alias gco="git checkout"
alias gfco="git fetch && git checkout"
alias gcb="git checkout -b"
alias gg='git grep'
alias gb="git branch"
alias gbd="git branch -d"
alias gbr="git branch --remote"
alias gd="git diff"
alias gdh="git diff HEAD"
alias gdc="git diff --cached"
alias gsski='git stash save --keep-index'

alias gl="git log --graph --abbrev-commit --pretty=format:'%Cred%h %Cgreen(%cr)%Creset %C(bold blue)<%an>%Creset -%C(yellow)%d%Creset %s'"
alias gli="git log --graph --abbrev-commit --pretty=format:'%Cred%h %C(bold blue)<%an>%Creset -%C(yellow)%d%Creset %s %Cgreen(%ci)%Creset'"
alias gla="git log --graph --abbrev-commit --pretty=format:'%Cred%h %C(bold blue)<%ae>%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr)%Creset' --all"
alias gl2="git log --graph --abbrev-commit --pretty=format:'%Cred%h %C(bold blue)<%an>%Creset %C(yellow)%d%Creset %C(cyan)%aD%C(reset) %Cgreen(%cr)%Creset %n      %s%n'"

alias gls="git log --abbrev-commit --pretty=format:'%s'"
alias glan="git log --abbrev-commit --pretty=format:'%an'"

# Time zone sensitive hack
function glm() {
  git log --merges --abbrev-commit --date=iso --pretty=format:'%Cred%h %Cgreen%cd %C(cyan)%cr%Creset %C(bold blue)%an%Creset -%C(yellow)%d%Creset %s' --grep='Merge pull request' $1 | sed 's/:[0-9]\{2\} -0[56]00//' | less
}

# common characters in glm are: - / .  _ : # ) ( ,
# so avoid using those as delimiters to `column`.

function glm2() {
  git log --merges --abbrev-commit --date=iso --pretty=format:'%C(red)%h|%C(green)%cd|%C(cyan)%cr|%C(bold blue)%an|%Creset%s %C(yellow)%d' --grep='Merge pull request' $1 | sed 's/:[0-9]\{2\} -0[56]00//' | head -n 1000 | column -t -s '|' | less
}

function glm2a() {
  git log --merges --abbrev-commit --date=iso --pretty=format:'%C(red)%h|%C(green)%cd|%C(cyan)%cr|%C(bold blue)%an|%Creset%s %C(yellow)%d' --grep='Merge pull request' $1 | sed 's/:[0-9]\{2\} -0[56]00//' | column -t -s '|' | less
}


function glm3() {
  git log --merges --abbrev-commit --date=iso --pretty=format:'%C(red)%h|%C(green)%cd|%C(cyan)%cr|%C(bold blue)%an|%Creset%s' --grep='Merge pull request' $1 | sed 's/:[0-9]\{2\} -0[56]00//' | head -n 1000 | column -t -s '|' | less
}


# source: https://gist.github.com/jasonrudolph/1810768
#alias gbdate="git for-each-ref --format='%(committerdate:short),%(authorname),%(refname:short)' --sort=committerdate refs/heads/ | tail -n 10 | awk -F ',' '{ printf \"%-12s %-24s %s\n\", \$1, \$2, \$3 }'"
alias gbdate="git for-each-ref --format='%(committerdate:short),%(authorname),%(refname:short)' --sort=committerdate refs/heads/ | tail -n 20 | column -t -s ','"

# Something I do all the time -- got sick of copy and pasting branch names :)
alias gother='gitbranch=`gb | grep "^*" | cut -d" " -f2`; gco `git reflog | grep "checkout: moving from" | grep -ve "from \(develop\|release\|master\|[0-9a-f]\{40\}\|$gitbranch\)" | cut -d " " -f6 | uniq | head -n 1`'

function gdmb() {
  git diff `git merge-base HEAD $1`
}

alias gupstream="git log --pretty=format:'%s' -i --grep='merge' -n 1 | awk '{print \$NF}'"
alias gdmb='git diff $(git merge-base HEAD $(gupstream))'

alias gdmb2="git diff \$(git merge-base HEAD \$(git log --pretty=format:'%s' -i --grep='merge' -n 1 | awk '{print \$NF}'))"

# Shows diffs in pull request form, hiding the destination branch's unrelated changes.
# Usage: gitchanges [[SOURCE] DESTINATION]
function gitchanges() {
  if [ -n "$1" ] && [ -n "$2" ]; then
    # With two arguments: changes by merge: ARG1 --> ARG2
    SOURCE=$1
    DEST=$2
  else
    if [ -n "$1" ]; then
      # With one argument: changes by merging current HEAD into the commit specified
      SOURCE=HEAD
      DEST=$1
    else
      # With zero arguments: changes by merging current HEAD into automatically-guessed upstream branch
      SOURCE=HEAD
      DEST=`git log --pretty=format:'%s' -i --grep='merge' -n 1 | awk '{print $NF}'`
    fi
  fi
  MERGEBASE=$(git merge-base $SOURCE $DEST)

  echo "Preview of changes when merging $SOURCE into $DEST"

  git diff $(git merge-base $SOURCE $DEST) $SOURCE
}

# Usage: dep [JavaClass]
# Does a git grep of the current directory, omitting the class provided and any tests.
function dep() {
  git grep -w $1 | grep -v "[tT]est" | grep -v $1.java | less
}

