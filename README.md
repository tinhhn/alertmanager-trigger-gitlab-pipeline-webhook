# alertmanager-trigger-gitlab-pipeline-webhook

Alertmanager can not trigger gitlab pipeline directly, this webhook will help you out!

# Trigger gitlab pipeline with curl
```bash
curl -XPOST -d "variables[APP_NAME]=<app-name>&token=<token>&ref=<branch>" http://gitlab.example.net/api/v4/projects/<project-id>/trigger/pipeline
```

# We got trigger_payload
```bash
trigger_payload="variables[APP_NAME]=<app-name>&token=<token>&ref=<branch>"
```

# We got trigger_url
```bash
trigger_url="http://gitlab.example.net/api/v4/projects/<project-id>/trigger/pipeline"
```

# Trigger gitlab pipeline with webhook
```bash
curl -XPOST 'http://127.0.0.1:5000/api/trigger_gitlab_pipeline?trigger_payload_encoded=<base64(trigger_payload)>&trigger_url_encoded=<base64(trigger_url)'
```

# Example
```bash
curl -XPOST "http://alertmanager-trigger-gitlab-pipeline-webhook.example.net/api/trigger_gitlab_pipeline?trigger_payload_encoded=dmFyaWFibGVzW0FQUF9OQU1FXT1hYmMtYXBwJnRva2VuPWU4MWNiNTBhZjAzNWEyYjhjNiZyZWY9bWFzdGVy&trigger_url_encoded=aHR0cDovL2dpdGxhYi5mcHQubmV0L2FwaS92NC9wcm9qZWN0cy8xMjM0NTY3ODkvdHJpZ2dlci9waXBlbGluZQ=="
```

# Alertmanager receiver config
```yaml
  - name: do-something
    webhook_configs:
    - send_resolved: false
      url: "http://alertmanager-trigger-gitlab-pipeline-webhook.example.net/api/trigger_gitlab_pipeline?trigger_payload_encoded=dmFyaWFibGVzW0FQUF9OQU1FXT1hYmMtYXBwJnRva2VuPWU4MWNiNTBhZjAzNWEyYjhjNiZyZWY9bWFzdGVy&trigger_url_encoded=aHR0cDovL2dpdGxhYi5mcHQubmV0L2FwaS92NC9wcm9qZWN0cy8xMjM0NTY3ODkvdHJpZ2dlci9waXBlbGluZQ=="
```