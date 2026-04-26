# 🚀 End-to-End DevOps Project (CI/CD + GitOps + Monitoring)

## 📌 Overview

This project demonstrates a **production-grade DevOps pipeline** using modern tools.

## 🧰 Tech Stack

* Jenkins (CI)
* Docker (Containerization)
* GitHub (Source of Truth)
* ArgoCD (GitOps CD)
* Kubernetes (GKE)
* Prometheus & Grafana (Monitoring)

## 🔄 Workflow

1. Developer pushes code
2. Jenkins builds Docker image
3. Image pushed to Docker Hub
4. Jenkins updates Kubernetes manifests in Git
5. ArgoCD detects change and deploys automatically
6. Prometheus collects metrics
7. Grafana visualizes system performance

## 🏗 Architecture

![Architecture](./screenshots/architecture.png)

## 📊 Monitoring Dashboard

![Grafana](./screenshots/grafana.png)

## ⚙️ Features

* Fully automated CI/CD pipeline
* GitOps-based deployment (ArgoCD)
* Multi-container app (Frontend + Backend + MongoDB)
* Observability with Prometheus + Grafana
* Kubernetes deployment with scaling support

## 🚀 How to Run

```bash
kubectl apply -f k8s/
```

## 📈 Future Improvements

* Alerts (Prometheus Alertmanager)
* Logging (ELK / Loki)
* Multi-environment setup (dev/staging/prod)
