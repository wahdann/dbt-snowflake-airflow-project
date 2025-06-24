# End-to-End Data Engineering Project: dbt, Snowflake & Apache Airflow  


## Overview  
This project is a **complete data engineering pipeline** using **dbt (Data Build Tool), Snowflake (Data Warehouse), and Apache Airflow (Orchestration Tool)**. It covers **data ingestion, transformation, and scheduling** in a structured and scalable manner.  

## Tech Stack  
- **dbt Core** – For data transformation and modeling  
- **Snowflake** – Cloud-based data warehouse  
- **Apache Airflow** – Workflow automation and orchestration  
- **Python** – Scripting and automation  
- **Git** – Version control  


## Project Structure  
```bash
 snowflake_data_project/
│──  models/                 # dbt models (staging, marts)
│──  dags/                   # Airflow DAGs (for scheduling)
│──  Data/                   # Project datasets
│──  tests/                  # dbt project tests
│──  assets/                 # dags and data lineage
│──  dbt_project.yml         # dbt project config file
│──  README.md               # Project documentation
│──  requirements.txt        # Project needed libraries (docker image)
│──  docker-compose.yaml     # Docker config file
│──  Dockerfile              # Dockerfile 
```
## Data Lineage
![Dbtlinage](<assets/dbt-dag.png>)

## Airflow Orchestration Dag
![airflowdag](<assets/airflow.png>)

## Setup & Installation  

### Clone the Repository  
```sh
git clone https://github.com/wahdann/dbt-snowflake-airflow-project.git
cd your-repo-name
```

Set Up a Virtual Environment
```sh
python -m venv venv
source venv/bin/activate  # Mac/Linux
venv\Scripts\activate     # Windows

```

Configure dbt Connection to Snowflake (for mac)
Update the profiles.yml file located in ~/.dbt/ :

Configure dbt Connection to Snowflake (for Windows)
Update the profiles.yml file located in %UserProfile% in .dbt folder with your Snowflake credentials:
```sh
snowflake_project:
  outputs:
    dev:
      account: your_snowflake_account
      database: finance_db
      user: dbt_user
      password: your_password
      warehouse: finance_wh
      role: ACCOUNTADMIN
      schema: raw
      type: snowflake
  target: dev
```
Run dbt Models (for mac)
```sh
dbt run
dbt test  # To validate data integrity
```

Start Apache Airflow (for mac)
```sh
airflow standalone  # Starts the UI & Scheduler
```

Start the whole project using docker container
```sh
docker compose up airflow-init  # building the container  
docker compose up               # start the airflow docker container   
```


