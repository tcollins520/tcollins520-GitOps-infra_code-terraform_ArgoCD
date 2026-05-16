# 🚀 End-to-End GitOps Platform on AWS EKS

## 📌 Project Overview

This project demonstrates a full production-style GitOps deployment platform built on AWS using:

* Terraform Infrastructure as Code (IaC)
* AWS EKS (Elastic Kubernetes Service)
* GitHub Actions CI/CD
* Amazon ECR
* Helm Charts
* ArgoCD GitOps
* AWS Load Balancer Controller
* Route53 DNS
* AWS ACM HTTPS Certificates
* EBS CSI Driver for Persistent Storage

The platform automatically builds, pushes, and deploys a Java application to Kubernetes using GitOps workflows.

---

# 🏗️ Architecture

```text
Developer Push
       ↓
GitHub Actions CI Pipeline
       ↓
Docker Image Build
       ↓
Push Image to Amazon ECR
       ↓
Update Helm values.yaml
       ↓
ArgoCD Detects Git Change
       ↓
Helm Deployment to AWS EKS
       ↓
AWS ALB Ingress + Route53 + ACM HTTPS
       ↓
Live Kubernetes Application
```

---

# ⚙️ Technologies Used

| Category           | Technologies                 |
| ------------------ | ---------------------------- |
| Cloud              | AWS                          |
| Infrastructure     | Terraform                    |
| Kubernetes         | AWS EKS                      |
| CI/CD              | GitHub Actions               |
| GitOps             | ArgoCD                       |
| Packaging          | Helm                         |
| Containerization   | Docker                       |
| Registry           | Amazon ECR                   |
| Ingress            | AWS Load Balancer Controller |
| DNS                | Route53                      |
| SSL/TLS            | AWS ACM                      |
| Persistent Storage | EBS CSI Driver               |
| Application        | Java                         |

---

# ☁️ Infrastructure Provisioned with Terraform

The Terraform configuration provisions:

* VPC
* Public Subnets
* Internet Gateway
* Route Tables
* EKS Cluster
* EKS Node Group
* IAM Roles & Policies
* OIDC Provider for IRSA
* EKS Access Entries
* Security Groups
* EBS CSI Driver IAM Role

---

# 🔐 Security Features

* IAM Roles for Service Accounts (IRSA)
* HTTPS secured using AWS ACM certificates
* Route53 custom DNS records
* Kubernetes Secrets
* GitHub Secrets for CI/CD authentication

---

# 🔄 CI/CD Workflow

GitHub Actions pipeline performs:

1. Checkout application source code
2. Build Java application with Maven
3. Run SonarQube code analysis
4. Build Docker image
5. Push Docker image to Amazon ECR
6. Update Helm values.yaml image tag
7. Push changes to Helm GitOps repository
8. ArgoCD automatically syncs deployment to Kubernetes

---

# 📦 GitOps Workflow

ArgoCD continuously monitors the Helm GitOps repository.

Whenever GitHub Actions updates the image tag:

* ArgoCD detects the Git commit
* Automatically syncs Kubernetes manifests
* Deploys the latest application version to EKS

---

# 🌐 Ingress & HTTPS

The application is exposed publicly using:

* AWS Application Load Balancer (ALB)
* Kubernetes Ingress
* Route53 DNS
* AWS ACM SSL Certificates

Example:

```text
https://vproappgitopsargocd.tcapp.xyz
```

---

# 💾 Persistent Storage

MySQL database persistence is configured using:

* Kubernetes PersistentVolumeClaim (PVC)
* AWS EBS volumes
* EBS CSI Driver

---

# 📁 Repository Structure

## Infrastructure Repository

```text
GitOps-infracode-terraform_github-actions/
├── main.tf
├── variables.tf
├── outputs.tf
├── provider.tf
├── eks.tf
├── iam.tf
└── networking.tf
```

## Application Repository

```text
GitOps-appcode_github-actions/
├── .github/workflows/
├── Dockerfile
├── pom.xml
└── src/
```

## Helm GitOps Repository

```text
GitOps-helm-ArgoCD/
├── helm/
│   └── vproappchartsArgo/
│       ├── Chart.yaml
│       ├── values.yaml
│       └── templates/
```

---

# 🚀 Deployment Steps

## 1. Provision Infrastructure

```bash
terraform init
terraform plan
terraform apply
```

## 2. Configure kubectl

```bash
aws eks update-kubeconfig --name vprofile-eks-cluster --region us-east-1
```

## 3. Install ArgoCD

```bash
kubectl create namespace argocd
kubectl apply -n argocd -f https://raw.githubusercontent.com/argoproj/argo-cd/stable/manifests/install.yaml
```

## 4. Install AWS Load Balancer Controller

```bash
helm install aws-load-balancer-controller eks/aws-load-balancer-controller \
  -n kube-system
```

## 5. Deploy Application via ArgoCD

```bash
argocd app create vprofile
argocd app sync vprofile
```

---

# 🛠️ Troubleshooting Performed

During implementation, several production-style issues were identified and resolved:

* ArgoCD gRPC/Ingress connectivity issues
* Helm templating errors
* YAML indentation issues
* Missing apiVersion values
* PVC binding failures
* EKS RBAC authorization problems
* Route53 DNS propagation issues
* ALB ingress configuration problems
* GitHub Actions authentication issues
* EBS CSI dynamic provisioning issues

---

# 📸 Suggested Screenshots

Add screenshots for:

* ArgoCD Healthy/Synced dashboard
* GitHub Actions successful pipeline
* Terraform apply success
* kubectl get pods
* Live application in browser
* Route53 DNS records
* AWS Load Balancer

---

# 🎯 Key Skills Demonstrated

* Kubernetes Administration
* AWS Cloud Engineering
* Terraform IaC
* GitOps Implementation
* CI/CD Automation
* Helm Chart Development
* Kubernetes Ingress & Networking
* Persistent Storage Management
* IAM & IRSA Configuration
* Troubleshooting Production Issues

---

# 📈 Future Improvements

Potential enhancements:

* Prometheus & Grafana Monitoring
* Centralized Logging (Loki / ELK)
* Horizontal Pod Autoscaler (HPA)
* Argo Rollouts
* External Secrets Operator
* Terraform Remote Backend
* Karpenter Autoscaling
* Multi-environment GitOps
* Service Mesh (Istio)

---

# 👩‍💻 Author

Tina Collins

DevOps Engineer | AWS | Kubernetes | Terraform | GitOps | CI/CD
