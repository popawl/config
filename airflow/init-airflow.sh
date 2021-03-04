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
# Install Airflow
#===============================================================================
HOST=$(uname -r)
if [[ $HOST == *gcp* ]]; then #GCP (Ubuntu-based)
    alias python=python3
    sudo apt install -y python3-venv
fi
python -m venv $HERE/venv
source $HERE/venv/bin/activate
python -m pip install --upgrade pip
pip install wheel
pip install apache-airflow
pip install apache-airflow-providers-google[amazon]
pip install apache-airflow-providers-postgres
pip install apache-airflow-providers-ssh

#===============================================================================
# Install Postgres
#===============================================================================
if [[ $HOST == *arch* ]]; then 
    echo "Installing Postgres for Arch"
    sudo pacman --sync --refresh --needed --noconfirm postgresql
    sudo -u postgres initdb -D /var/lib/postgres/data
elif [[ $HOST == *gcp* ]]; then #GCP (Ubuntu-based)
    echo "Installing Postgres for Ubuntu"
    sudo apt install -y postgresql postgresql-contrib
fi
sudo systemctl start postgresql
sudo -u postgres psql -c"ALTER user postgres WITH PASSWORD 'postgres'"

#===============================================================================
# Init Airflow
#===============================================================================
mkdir $HERE/dags
airflow db init
airflow users create \
    --firstname airflow \
    --lastname airflow \
    --role Admin \
    --username airflow \
    --password airflow1234 \
    --email airflow@example.com
deactivate
