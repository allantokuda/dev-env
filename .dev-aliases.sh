alias vi=vim
#alias vim='mvim --servername VIM --remote'
alias ctags="`brew --prefix`/bin/ctags --exclude=node_modules"

alias ip="ifconfig en0 | grep -w inet | awk '{ print \$2 }'"
alias ipcopy="ifconfig en0 | grep -w inet | awk '{ print \$2 }' | pbcopy"

alias bx="bundle exec"
alias bxr="bundle exec rspec"
alias bxc="bundle exec cucumber"
alias zr='zeus rspec'
alias zc='zeus cucumber'
alias z='zeus'
alias t='zeus rspec `find ./spec -name "*spec.rb" -type f -exec stat -f "%m %N" {} \; | sort -n | tail -1 | cut -f2- -d" "`'
alias rdm="echo \"rake db:migrate db:test:prepare\"; rake db:migrate db:test:prepare"
alias rdr="echo \"rake db:rollback db:test:prepare\";rake db:rollback db:test:prepare"
alias rrg='zeus rake routes | grep'
alias guard='guard -c'

function md() {
  mkdir $1 && cd $1
}

function fn() {
	find $1 -name `echo $2 | sed 's/\./*/g'`
}

function vfn() {
  pattern=`echo $2 | sed 's/\./*/g'`
	vim `find $1 -name $pattern`
}

function A() {
  awk "{print \$$1}"
}

function checkdomain() {
  whois $1 | grep "No match"
}

function vimclass() {
  vim `find -E . -name "$1.*" | grep -v "\.class"`
}

# Pipe grep output into this to get the matching file names
alias filenames="cut -d: -f1 | sort | uniq"

alias add_quotes='sed -n "s/\(.*\)/\"\\1\"/p"'

export EDITOR=vim
export PAGER='less -S'
