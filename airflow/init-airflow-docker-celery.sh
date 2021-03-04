mkdir ./dags ./logs ./plugins
echo -e "AIRFLOW_UID=$(id -u)\nAIRFLOW_GID=0" > .env

docker-compose -f docker-compose-airflow-celeryexecutor.yaml up airflow-init
docker-compose -f docker-compose-airflow-celeryexecutor.yaml up

