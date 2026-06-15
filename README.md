# 🛒 Cloud Native E-Commerce Platform — DevOps Project

![CI/CD](https://img.shields.io/badge/CI%2FCD-Jenkins-D24939?logo=jenkins&logoColor=white)
![Docker](https://img.shields.io/badge/Containerization-Docker-2496ED?logo=docker&logoColor=white)
![Kubernetes](https://img.shields.io/badge/Orchestration-K3s-326CE5?logo=kubernetes&logoColor=white)
![Terraform](https://img.shields.io/badge/IaC-Terraform-7B42BC?logo=terraform&logoColor=white)
![AWS](https://img.shields.io/badge/Cloud-AWS%20EC2-FF9900?logo=amazon-aws&logoColor=white)

An end-to-end **DevOps CI/CD pipeline** for deploying a cloud-native e-commerce application on **Kubernetes (K3s)**. This project automates application build, containerization, image publishing, infrastructure provisioning, and Kubernetes deployment using modern DevOps tooling.

---

## 📐 Architecture

```
GitHub
   │
   ▼
Jenkins CI/CD Pipeline
   │
   ▼
Docker Build (Frontend + Backend)
   │
   ▼
Docker Hub (Image Registry)
   │
   ▼
Terraform (Infrastructure Provisioning)
   │
   ▼
Kubernetes (K3s)
   │
   ▼
Frontend & Backend Deployment
```

---

## 🛠️ Tools & Technologies

| Tool | Purpose |
|------|---------|
| **GitHub** | Source Code Management |
| **Jenkins** | CI/CD Automation |
| **Docker** | Containerization |
| **Docker Hub** | Image Registry |
| **Terraform** | Infrastructure as Code |
| **Kubernetes (K3s)** | Container Orchestration |
| **AWS EC2** | Hosting Environment |
| **Linux (Ubuntu)** | Operating System |

---

## ✨ Features Implemented

### 🔄 CI/CD Pipeline
- Automated source code checkout from GitHub
- Backend Docker image build
- Frontend Docker image build
- Docker Hub authentication
- Automated image push to Docker Hub
- Kubernetes deployment automation

### 🏗️ Infrastructure Automation
- Terraform initialization (`terraform init`)
- Terraform validation (`terraform validate`)
- Terraform planning (`terraform plan`)
- Terraform apply (`terraform apply`)

### ☸️ Kubernetes Deployment
- Namespace isolation
- Backend deployment
- Frontend deployment
- Service exposure using NodePort
- Pod management and scaling

---

## 📦 Kubernetes Resources

**Namespace**
- `ecommerce`

**Deployments**
- Backend Deployment
- Frontend Deployment

**Services**
- Backend Service
- Frontend Service

---

## 📁 Project Structure

```
cloud-native-ecommerce-platform/
│
├── backend/                  # Backend application source code
├── frontend/                 # Frontend application source code
├── terraform/                # Infrastructure as Code (AWS provisioning)
│
├── k8s/                       # Kubernetes manifests
│   ├── namespace.yaml
│   ├── backend-deployment.yaml
│   ├── backend-service.yaml
│   ├── frontend-deployment.yaml
│   └── frontend-service.yaml
│
├── Jenkinsfile                # CI/CD pipeline definition
└── README.md
```

---

## ⚠️ Challenges Faced

### Resource Constraints
This project was developed on a small **AWS EC2 instance (2 GB RAM)**. Running the following services simultaneously:

- Jenkins
- Docker
- K3s Kubernetes
- Terraform
- Security scanning tools

...resulted in noticeable memory pressure and reduced system performance — a realistic constraint that shaped several pipeline design decisions.

### Security & Code Quality Tools

**SonarQube**
SonarQube integration was evaluated during pipeline development. Due to memory limitations of the development environment, continuous SonarQube execution was not included in the final pipeline.

**Trivy**
Trivy vulnerability scanning was tested successfully. However, image scanning significantly increased resource consumption on the 2 GB EC2 instance. The pipeline architecture supports **re-enabling Trivy scanning** on larger environments.

---

## 🚀 Future Enhancements

- [ ] Helm-based Kubernetes deployments
- [ ] Prometheus monitoring
- [ ] Grafana dashboards
- [ ] Kubernetes Ingress Controller
- [ ] Domain & SSL integration
- [ ] ArgoCD GitOps deployment
- [ ] Automated rollbacks
- [ ] Advanced security scanning (SonarQube + Trivy at scale)

---

## 📚 Key Learning Outcomes

- CI/CD pipeline design
- Docker containerization
- Infrastructure as Code using Terraform
- Kubernetes deployments
- Namespace management
- Service exposure (NodePort)
- DevOps troubleshooting
- Resource optimization on constrained environments
- Cloud infrastructure management on AWS

---

## 👤 Author

**Sapna Kumari**
*Cloud & DevOps Engineer*

[![GitHub](https://img.shields.io/badge/GitHub-sapnacloudengineer-181717?logo=github&logoColor=white)](https://github.com/sapnacloudengineer)
