# Microservices E-Commerce EKS Project

This repository contains an example microservices-based e-commerce application built using multiple languages and frameworks, deployed on AWS Elastic Kubernetes Service (EKS) with infrastructure defined via Terraform. It demonstrates building, packaging, and deploying services using Docker, Helm, Terraform, and Jenkins pipelines.

## 🚀 Project Overview

- **Microservices**: Each service (e.g. `adservice`, `cartservice`, `checkoutservice`, etc.) is developed independently and may use a different language (Go, Node.js, Python, Java, .NET).
- **Infrastructure as Code**: Terraform configurations provision ECR repositories, EKS clusters, S3 buckets, IAM roles, networking and other required AWS resources.
- **CI/CD**: Jenkinsfiles are provided for each service under `jenkinsfiles/` which build images, push to ECR, and update Kubernetes manifests.
- **Kubernetes**: YAML definitions for deploying services are under `kubernetes-files/`.
- **Local Development**: Services can be run locally or in-cluster using minikube or kind (not covered here but typical).

## 📁 Repository Structure

```
README.md
├── ecr-terraform/          # Terraform code for AWS ECR
├── eks-terraform/          # Terraform code for provisioning EKS
├── jenkinsfiles/           # Jenkins pipeline definitions per service
├── kubernetes-files/       # Deployment manifests for each service
├── s3-buckets/             # Terraform modules for S3 resources
└── src/                    # Source code for each microservice
    ├── adservice/
    ├── cartservice/
    ├── checkoutservice/
    ├── ...
    └── shippingservice/
```

## ✅ Prerequisites

- **AWS Account** with sufficient IAM permissions
- **Terraform** 1.4+ installed and configured
- **Kubectl** 1.26+ installed
- **Docker** for building images
- **Jenkins** (optional) or any CI system if you plan to use the provided Jenkinsfiles
- **AWS CLI** configured with your credentials

> Ensure your AWS CLI default profile has access to ECR, EKS, IAM, S3, and other needed services.

## 🛠️ Deploying Infrastructure

1. Navigate to the appropriate Terraform folder and initialize:
   ```bash
   cd ecr-terraform ; terraform init
   cd ../eks-terraform ; terraform init
   ```
2. Provide any required variable values (via `terraform.tfvars` or environment variables).
3. Apply the configurations:
   ```bash
   terraform apply
   ```
4. After the EKS cluster is ready, retrieve the kubeconfig:
   ```bash
   aws eks update-kubeconfig --name <cluster-name> --region <region>
   ```

## 🐳 Building & Pushing Docker Images

Each service has a `Dockerfile` in its directory. The Jenkins pipelines illustrate building an image, tagging with the ECR repository URI, and pushing.

Example commands:
```bash
cd src/productcatalogservice
docker build -t <ecr-uri>/productcatalogservice:latest .
docker push <ecr-uri>/productcatalogservice:latest
```

## 📦 Kubernetes Deployment

After images are pushed, apply the manifests in `kubernetes-files/`:

```bash
kubectl apply -f kubernetes-files/
```

Services are configured to pull images from the ECR registry and expose appropriate ports.

## 🧩 Development Workflow

1. Make changes to a service under `src/<service>`.
2. Build/test locally using the language-specific tooling.
3. Update the Dockerfile or Kubernetes manifests as needed.
4. Use the corresponding Jenkinsfile or manual script to build and deploy.

## 📌 Notes

- The project uses multiple languages; pay attention to each service's `README.md` if present.
- Some services include `genproto.sh` scripts to generate gRPC stubs from `.proto` files.
- Kubernetes manifests may reference ConfigMaps, Secrets, and other resources; review them before deploying.

## 👥 Contributing

Contributions are welcome! Fork the repo, make changes, and submit a pull request. Ensure you update relevant documentation and tests.

## 📝 License

This project is provided as-is under the MIT License (adjust as appropriate).

---

*Generated on February 21, 2026.*

EOF
