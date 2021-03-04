#!/usr/bin/env bash
#===============================================================================
# Environment variables
#===============================================================================
HERE=$(pwd)
REMOTE_IP='172.16.5.50'
export AIRFLOW_HOME=$HERE
export AIRFLOW__CORE__DAGS_FOLDER=/file_store/pisaacson/airflow/dags
export AIRFLOW__CORE__EXECUTOR=CeleryExecutor
export AIRFLOW__CORE__SQL_ALCHEMY_CONN="postgresql+psycopg2://airflow:airflow@$REMOTE_IP/airflow"
export AIRFLOW__CELERY__RESULT_BACKEND="db+postgresql://airflow:airflow@$REMOTE_IP/airflow"
export AIRFLOW__CELERY__BROKER_URL="redis://$REMOTE_IP:6379/0"
export AIRFLOW__CORE__FERNET_KEY=''
export AIRFLOW__CORE__DAGS_ARE_PAUSED_AT_CREATION='false'
export AIRFLOW__CORE__LOAD_EXAMPLES='false'

#===============================================================================
# Start python virtual environment
#===============================================================================
source $HERE/venv/bin/activate

#===============================================================================
# Start celery worker
#===============================================================================
airflow celery worker --daemon
