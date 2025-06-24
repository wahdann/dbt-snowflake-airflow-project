from airflow import DAG
# from airflow.providers.standard.operators.python import PythonOperator
from airflow.operators.python import PythonOperator
from datetime import datetime, timedelta

def print_hello():
    print("Hello, Airflow is running!")

default_args = {
    'owner': 'omar',
    'depends_on_past': False,
    'start_date': datetime(2025, 6, 19),
    'retries': 1,
    'retry_delay': timedelta(minutes=1),
}

with DAG(
    dag_id='the_daggest_of_all',
    default_args=default_args,
    schedule='@daily',  # runs once per day
    catchup=False,
    tags=['test'],
) as dag:

    task_hello = PythonOperator(
        task_id='print_hello_task',
        python_callable=print_hello,
    )
