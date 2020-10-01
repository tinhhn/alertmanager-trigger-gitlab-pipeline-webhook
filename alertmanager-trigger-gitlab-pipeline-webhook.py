#!/usr/bin/python

from flask import Flask, request
import base64
import requests

app = Flask(__name__)

@app.route('/api/trigger_gitlab_pipeline', methods=['POST'])
def trigger_gitlab_pipeline():
    trigger_payload = base64.b64decode(request.args.get('trigger_payload_encoded'))
    trigger_url = base64.b64decode(request.args.get('trigger_url_encoded'))
    trigger_pipeline = requests.post(trigger_url, data=trigger_payload)
    return (trigger_pipeline.content, trigger_pipeline.status_code, None)

if __name__ == '__main__':
    app.run(host='0.0.0.0',port=5000,debug=True, use_reloader=True)
