# Secrets Management Implementation Patterns

In a Senior DevOps environment, secrets should **NEVER** be stored in plain text in a repository. This project demonstrates several ways to handle sensitive data like API keys, database passwords, and certificates.

## 1. SOPS (Secrets OPerationS) Pattern
Using Mozilla SOPS to encrypt files within the repository using KMS (AWS/GCP), PGP, or Age.

### How it works:
1.  Developer encrypts `secrets.yaml` locally.
2.  Encrypted file is committed to Git.
3.  CI/CD pipeline (GitHub Actions) decodes the file using a service account key.

### Example Encrypted File Structure:
```yaml
db_password: ENC[AES256_GCM,data:...,iv:...,tag:...,type:str]
api_key: ENC[AES256_GCM,data:...,iv:...,tag:...,type:str]
sops:
    kms: []
    gcp_kms: []
    azure_kv: []
    hc_vault: []
    age: []
    lastmodified: "2026-02-04T08:58:12Z"
    mac: ENC[AES256_GCM,data:...,iv:...,tag:...,type:str]
    pgp: []
    unencrypted_suffix: _unencrypted
    version: 3.7.3
```

## 2. External Secrets Operator (Kubernetes)
For production Kubernetes clusters, we use the **External Secrets Operator** to pull secrets from HashiCorp Vault or AWS Secrets Manager into K8s Secrets.

### Example Manifest:
```yaml
apiVersion: external-secrets.io/v1beta1
kind: ExternalSecret
metadata:
  name: flask-app-secrets
spec:
  refreshInterval: 1h
  secretStoreRef:
    name: vault-backend
    kind: SecretStore
  target:
    name: flask-prod-secrets
  data:
  - secretKey: DATABASE_URL
    remoteRef:
      key: secret/data/flask-app
      property: db_url
```

## 3. GitHub Actions Secrets
In our current pipeline, we use GitHub Actions Secrets for:
- Docker Hub credentials
- Kubernetes config
- Terraform state backend keys
