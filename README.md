# DevOps Portfolio Project 🚀

A comprehensive demonstration of modern DevOps practices, tools, and methodologies. This repository contains a full-stack implementation of a containerized application with Infrastructure as Code, CI/CD, Orchestration, and Observability.

## 🛠️ Tech Stack

| Domain | Tool | Description |
| :--- | :--- | :--- |
| **Application** | Python / Flask | RESTful Microservice |
| **Containerization** | Docker | Multi-stage Dockerfile optimized for size |
| **Orchestration** | Kubernetes | Deployment, Service, and Ingress manifests |
| **IaC** | Terraform | Infrastructure provisioning (Docker provider) |
| **CI/CD** | GitHub Actions | Automated Linting, Testing, and Building |
| **Monitoring** | Prometheus | Metric Scraping and Aggregation |
| **Visualization** | Grafana | Dashboards for application metrics |
| **Packaging** | Helm | Helm Chart for scalable deployment |

## 📂 Project Structure

```bash
├── .github/workflows   # CI/CD Pipeline (GitHub Actions)
├── app/                # Flask Application & Dockerfile
├── helm/               # Helm Chart for Kubernetes
├── k8s/                # Kubernetes Manifests (YAML)
├── monitoring/         # Prometheus Config
├── terraform/          # Terraform Infrastructure Code
└── docker-compose.yml  # Local Development Environment
```

## 🚀 Getting Started

### Prerequisites
- Docker & Docker Compose
- Git

### Quick Start (Local)

1.  **Clone the repository**
    ```bash
    git clone https://github.com/dawiay/DevOps-Portfolio-latest.git
    cd DevOps-Portfolio-latest
    ```

2.  **Run the Stack**
    ```bash
    docker-compose up -d --build
    ```

3.  **Access Services**
    - **Web App**: [http://localhost:5000](http://localhost:5000)
    - **Prometheus**: [http://localhost:9090](http://localhost:9090)
    - **Grafana**: [http://localhost:3000](http://localhost:3000) (Login: `admin` / `admin`)

## 📊 Features

### 1. CI/CD Pipeline
Every push to `main` triggers a GitHub Actions workflow that:
- Lints the Python code with `flake8`.
- Builds the Docker image to ensure reproducibility.

### 2. Infrastructure as Code (Terraform)
The `terraform/` directory contains configuration to manage the Docker resources using HCL (HashiCorp Configuration Language).

### 3. Observability
The application is instrumented with `prometheus_flask_exporter`. Real-time metrics are scraped by Prometheus and visualized in Grafana.

### 4. Kubernetes & Helm
Standard Kubernetes manifests are provided in `k8s/`, and a production-ready Helm chart is available in `helm/devops-portfolio`.
