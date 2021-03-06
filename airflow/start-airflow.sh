#!/usr/bin/env bash
#===============================================================================
# Environment variables
#===============================================================================
HERE=$(pwd)
export AIRFLOW_HOME=$HERE
export AIRFLOW__CORE__EXECUTOR=LocalExecutor
export AIRFLOW__CORE__SQL_ALCHEMY_CONN=postgresql+psycopg2://postgres:postgres@localhost/postgres
export AIRFLOW__CORE__FERNET_KEY=''
export AIRFLOW__CORE__DAGS_ARE_PAUSED_AT_CREATION='false'
export AIRFLOW__CORE__LOAD_EXAMPLES='false'

#===============================================================================
# Start python virtual environment
#===============================================================================
source $HERE/venv/bin/activate

#===============================================================================
# Start postgres
#===============================================================================
sudo systemctl start postgresql

#===============================================================================
# Start scheduler
#===============================================================================
airflow scheduler --daemon

#===============================================================================
# Start webserver
#===============================================================================
airflow webserver --daemon

