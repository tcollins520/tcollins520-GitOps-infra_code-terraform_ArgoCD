The infrastructure supports:

AWS EKS Kubernetes cluster
GitOps deployments with ArgoCD
Helm-based application deployments
AWS ALB Ingress Controller
HTTPS with AWS ACM
Persistent storage using EBS CSI Driver
Route53 DNS integration

This infrastructure repository works together with:

Application CI/CD repository
Helm GitOps repository
ArgoCD continuous deployment

* Terraform
    ↓
* AWS Infrastructure
    ↓
* VPC + Networking
    ↓
* AWS EKS Cluster
    ↓
* Managed Node Groups
    ↓
* OIDC / IRSA
    ↓
* EBS CSI Driver
    ↓
* AWS Load Balancer Controller
    ↓
* ArgoCD + Helm GitOps

⚙️ Technologies Used
Category	Technologies
Cloud Provider	AWS
Infrastructure as Code	Terraform
Container Orchestration	Kubernetes
Managed Kubernetes	AWS EKS
Networking	VPC, Subnets, Route Tables
Storage	AWS EBS CSI Driver
IAM	IRSA / OIDC
GitOps	ArgoCD
Ingress	AWS Load Balancer Controller
DNS	Route53
SSL/TLS	AWS ACM
☁️ Infrastructure Provisioned

Terraform provisions:

Networking
VPC
Public Subnets
Internet Gateway
Route Tables
Route Table Associations
Kubernetes Platform
AWS EKS Cluster
Managed Node Group
Kubernetes Access Configuration
IAM & Security
IAM Roles
IAM Policies
OIDC Provider
IRSA Configuration
EKS Access Entries
Storage
EBS CSI Driver IAM Role
Persistent Storage Support
Load Balancing
AWS Load Balancer Controller support
Public ALB ingress support
🔐 Security Features
IAM Roles for Service Accounts (IRSA)
OIDC federation
HTTPS using ACM certificates
Kubernetes RBAC integration
Terraform-managed access entries
Least privilege IAM policies
📁 Repository Structure
GitOps-infra_code-terraform_ArgoCD/
├── main.tf
├── variables.tf
├── outputs.tf
├── provider.tf
├── terraform.tfvars
├── vpc.tf
├── eks.tf
├── iam.tf
├── nodegroup.tf
└── backend.tf
🚀 Deployment Steps
1. Clone Repository
git clone https://github.com/tcollins520/GitOps-infra_code-terraform_ArgoCD.git
cd GitOps-infra_code-terraform_ArgoCD
2. Initialize Terraform
terraform init
3. Review Terraform Plan
terraform plan
4. Provision Infrastructure
terraform apply

Type:

yes

when prompted.

5. Configure kubectl
aws eks update-kubeconfig \
--name vprofile-eks-cluster \
--region us-east-1
6. Verify EKS Cluster
kubectl get nodes
🔄 GitOps Integration

This infrastructure repository integrates with:

Repository	Purpose
GitOps-appcode_github-actions	CI/CD Pipeline
GitOps-helm-ArgoCD	Helm GitOps Deployments

ArgoCD continuously monitors the Helm repository and deploys updates automatically to the EKS cluster.

💾 Persistent Storage

Persistent storage is configured using:

AWS EBS volumes
EBS CSI Driver
Kubernetes PersistentVolumeClaims

Example StorageClass:

gp2
gp3 (optional)
🌐 Ingress & DNS

The platform supports:

AWS ALB Ingress Controller
Route53 custom domains
HTTPS with AWS ACM certificates

Example:

https://vproappgitopsargocd.tcapp.xyz
🛠️ Troubleshooting Performed

During implementation, several real-world infrastructure issues were resolved:

EKS RBAC authorization failures
IRSA configuration issues
OIDC provider integration
EBS CSI driver setup
PVC provisioning failures
ALB ingress issues
Route53 propagation delays
ArgoCD gRPC ingress issues
Helm templating problems
Kubernetes YAML validation issues

GitHub Actions pipeline
🎯 Key Skills Demonstrated
Terraform Infrastructure as Code
AWS EKS Administration
Kubernetes Networking
IAM & IRSA Configuration
GitOps Architecture
CI/CD Integration
Kubernetes Storage Management
AWS Load Balancing
DNS & HTTPS Configuration
Kubernetes Troubleshooting
📈 Future Improvements

Potential enhancements:

Terraform remote backend (S3 + DynamoDB)
Multi-environment deployments
Karpenter autoscaling
Prometheus & Grafana monitoring
Centralized logging
External Secrets Operator
Argo Rollouts
Multi-cluster GitOps
👩‍💻 Author

Tina Collins

DevOps Engineer | AWS | Kubernetes | Terraform | GitOps | CI/CD
