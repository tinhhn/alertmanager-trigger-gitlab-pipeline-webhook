FROM python:slim

WORKDIR /app

ADD requirements.txt .

RUN pip install -r requirements.txt

ADD alertmanager-trigger-gitlab-pipeline-webhook.py .

CMD gunicorn -w 2 -b 0.0.0.0:5000 --access-logfile - alertmanager-trigger-gitlab-pipeline-webhook:app
