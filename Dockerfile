FROM python:3.10-slim-buster
USER root
# RUN pip install --upgrade pip setuptools
RUN mkdir /app
COPY . /app/
WORKDIR /app/
RUN pip install -r requirements.txt
ENV AIRFLOW_HOME="/app/airflow"
ENV AIRFLOW_CORE_DAGBAG_IMPORT_TIMEOUT=1000
ENV AIRFLOW_CORE_ENABLE_XCOM_PICKLING=True
RUN airflow db init
RUN airflow users create -e dataaaronsanchezbelber@gmail.com -f aaron -l sanchez -p admin -r Admin -u admin
RUN chmod 777 start.sh
RUN apt update -y
ENTRYPOINT [ "/bin/sh" ]
CMD ["start.sh"]