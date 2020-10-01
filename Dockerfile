FROM python:slim

WORKDIR /app

ADD requirements.txt .

RUN pip install -r requirements.txt

ADD alertmanager-trigger-gitlab-pipeline-webhook.py .

CMD python alertmanager-trigger-gitlab-pipeline-webhook.py
