export TERM="xterm-color"
alias ls="ls -G"
alias egrep="egrep --colour"
alias grep="egrep --colour"
export PATH=$PATH:$HOME/usr/local/bin
export GEM_HOME='/usr/local/Cellar/gems/1.8'
export RUNNING_MODE='local'

if [ -f `brew --prefix`/etc/bash_completion ]; then
. `brew --prefix`/etc/bash_completion
fi


# MacPorts Installer addition on 2010-03-31_at_14:54:38: adding an appropriate PATH variable for use with MacPorts.
export PATH=/opt/local/bin:/opt/local/sbin:/usr/local/sbin:/usr/local/Cellar:/usr/local/bin:$PATH
# Finished adapting your PATH environment variable for use with MacPorts.

if [ -f ~/.profile ]; then
	source ~/.profile
fi

export WORKON_HOME=$HOME/virtual
export CATALINA_BASE=/usr/local/Cellar/tomcat/6.0.26/libexec/
export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8
export PATH=/usr/local/mysql/bin:$PATH

# Make bash check its window size after a process completes
shopt -s checkwinsize

# LS COLORS
export CLICOLOR=1
export LSCOLORS=ExFxCxDxBxegedabagacad

# ENVIRONMENT

# GREP
export GREP_OPTIONS='--color=auto'
export GREP_COLOR='1;37'
alias grep='grep --color=auto' # Always highlight grep search term

parse_git_branch() {
  git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/\1/'
}

parse_git_branch_with_brackets() {
  typeset current_branch=$(parse_git_branch)
  if [ "$current_branch" != "" ]
  then
echo "($current_branch)"
  fi
}

parse_git_branch_without_bracket(){
    typeset current_branch=$(parse_git_branch)
    if [ "$current_branch" != "" ]
    then
        echo "$current_branch"
    fi
}

parse_current_rvm() {
  typeset current_rvm=`rvm current i v`
  if [ "$current_rvm" != "system" ]
  then
echo "($current_rvm) "
  fi
}

#virtualenv wrapper
export WORKON_HOME=$HOME/.virtualenvs

source /usr/local/bin/virtualenvwrapper.sh

# 30m - Black
# 31m - Red
# 32m - Green
# 33m - Yellow
# 34m - Blue
# 35m - Purple
# 36m - Cyan
# 37m - White
# Everything else is green...
# 0 - Normal
# 1 - Bold
# 2 -

# homebrew python 2.7
export PATH="/usr/local/share/python:${PATH}"

function prompt {
	test
    local BLACK="\[\033[0;30m\]"
    local RED="\[\033[0;31m\]"
    local GREEN="\[\033[0;32m\]"
    local YELLOW="\[\033[0;33m\]"
    local BLUE="\[\033[0;34m\]"
    local PURPLE="\[\033[0;35m\]"
    local CYAN="\[\033[0;36m\]"
    local WHITE="\[\033[0;37m\]"
    local WHITEBOLD="\[\033[1;37m\]"
    export PS1="${GREEN}\$(parse_current_rvm)${WHITEBOLD}\u${RED} at ${WHITEBOLD}\h ${RED}in ${GREEN}\w ${PURPLE}\$(parse_git_branch_with_brackets)${WHITE}
${YELLOW}$ \[\e[m\]\[\e[m\]"
}
prompt

export PYTHONPATH="/usr/local/lib/python2.7/site-packages/:$PYTHONPATH"

alias ll="ls -l"
alias gcko="git checkout"
alias gco="git commit -am"
alias gpsm="git push origin master"
alias gplm="git pull origin master"
alias gpl="git pull origin "
alias gps="git push origin "
alias gst="git status"
alias gpsc="gpscurrent"
alias start-redis-server='redis-server /usr/local/etc/redis.conf'
alias use_gset='rvm gemset use'
alias install_puppet='fab homolog_puppet deploy_puppet restart_puppet -p puppet'
alias start_mongo_db='mongod run --config /usr/local/Cellar/mongodb/1.6.3-x86_64/mongod.conf'
alias stop_mongo_db='mongod stop'
alias gpscurrent='git push origin $(parse_git_branch_without_bracket)'
alias gplcurrent='git pull origin $(parse_git_branch_without_bracket)'
alias gplc='gplcurrent'
alias rvm_participe='rvm use ree@participacoes'
alias rvm_colabore='rvm use ree@colaboracoes'
alias test_env='RAILS_ENV=test'
alias qa1_env='RAILS_ENV=qa1 CADUN_ENV=qa1'
alias runserver_django='./manage.py runserver 0.0.0.0:8000 '
alias heroku_push='git push heroku master'
alias vim='/usr/local/Cellar/macvim/7.3-64/MacVim.app/Contents/MacOS/Vim'


if [[ -s $HOME/.rvm/scripts/rvm ]] ; then
        source $HOME/.rvm/scripts/rvm
fi


source ~/git-completion.bash
complete -W "$(rake -T | awk 'NR != 1 {print $2}')" rake

alias gco='git co'
alias gci='git ci'
alias grb='git rb'
alias cd..='cd ..'
alias go-ontologia-g1='cd ~/projects/g1/ontologia-g1'

function go_redeglobo {
  cd ~/projects/redeglobo
  workon redeglobo
  gplcurrent
}

function go_cobertura {
  cd ~/projects/cobertura-de-eventos
  workon cobertura
  gplcurrent
}

function go_g1 {
  cd ~/projects/g1/g1
  workon g1-4.3
  gplcurrent
}

function bom_dia {
  cd ~/projects/$@
  make integracao
}

function bom_dia_redeglobo {
    cd ~/projects/redeglobo/redeglobo
    workon redeglobo2.7
    gplcurrent
    make integracao
}

function rails {
  if [ -e script/rails ]; then
    script/rails $@
  else
    `which rails` $@
  fi
}

function rake {
  if [ -e Gemfile ]; then
    bundle exec rake $@
  else
    `which rake` $@
  fi
}

function heroku {
  if [ -e Gemfile ]; then
    bundle exec heroku $@
  else
    `which heroku` $@
  fi
}

function rspec {
  if [ -e Gemfile ]; then
    bundle exec rspec $@
  else
    `which rspec` $@
  fi
}

function up_deps_g1 {
    mysql.server start
    (cd projects/barramento; make run)
    (cd /Users/andre.fonseca/projects/busca-nova-plataforma; make run)
    (cd projects/barramento; make run)
}


