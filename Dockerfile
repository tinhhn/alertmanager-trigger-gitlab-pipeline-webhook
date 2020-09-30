FROM python:slim

WORKDIR /app

ADD requirements.txt .

RUN pip install -r requirements.txt

ADD alertmanager_trigger_gitlab_pipeline.py .

CMD python alertmanager_trigger_gitlab_pipeline.py
