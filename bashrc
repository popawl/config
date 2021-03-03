#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto -lh'
PS1='[\u@\h \W]\$ '
alias veaf="source /home/pai/venv/airflow/bin/activate"
alias veaf2="source /home/pai/venv/airflow2/bin/activate"
alias vim=gvim
alias dk=docker
alias dc=docker-compose
alias af=airflow
alias cdaf="cd ~/venv/airflow/lib/python3.8/site-packages/airflow"
alias cdaf2="cd ~/venv/airflow2/lib/python3.8/site-packages/airflow"
alias gs="git status"
alias repo="https://code.savvysherpa.com/dataoperations"
GOOGLE_APPLICATION_CREDENTIALS=/home/pai/auth/paisvc.json
PATH=/home/pai/.local/bin:/home/pai/.local/bin:/usr/local/sbin:/usr/local/bin:/usr/bin:/usr/lib/jvm/default/bin:/usr/bin/site_perl:/usr/bin/vendor_perl:/usr/bin/core_perl
