# alertmanager_trigger_gitlab_pipeline_webhook

```bash
curl -XPOST -d "variables[APP_NAME]=<app-name>&token=<token>&ref=<branch>" https://gitlab.com/api/v4/projects/<project-id>/trigger/pipeline
trigger_payload="variables[APP_NAME]=<app-name>&token=<token>&ref=<branch>"
trigger_url="https://gitlab.com/api/v4/projects/<project-id>/trigger/pipeline"
curl -s -XPOST 'http://127.0.0.1:5000/api/trigger_gitlab_pipeline?trigger_payload_encoded=<base64(trigger_payload)>&trigger_url_encoded=<base64(trigger_url)'
```