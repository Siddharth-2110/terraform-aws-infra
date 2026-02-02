# Terraform AWS Infrastructure as Code (IaC)

## 📌 Project Overview

This project demonstrates **Infrastructure as Code (IaC)** using **Terraform** to provision and manage AWS infrastructure in a secure, repeatable, and production-aligned manner.

The infrastructure is created using Terraform and executed from an AWS EC2 instance with **IAM role–based authentication**, following real-world DevOps best practices.

---

## 🏗️ Infrastructure Components

The project provisions the following AWS resources:

* Custom **VPC**
* **Public Subnet**
* **Internet Gateway (IGW)**
* **Route Table** with default internet route
* **Route Table Association** to subnet
* **Security Group** (SSH & HTTP access)
* **EC2 Instance** (Free Tier eligible)

---

## 🧠 Architecture Flow

```
User / Laptop
     ↓ SSH
Dev EC2 (Terraform Runner)
     ↓ AWS API (IAM Role)
AWS Infrastructure
  ├── VPC
  ├── Public Subnet
  │     └── EC2 Instance
  ├── Internet Gateway
  └── Route Table + Association
```

---

## 🔐 Authentication & Security

* Terraform is executed from a **Dev EC2 instance**
* AWS authentication is handled via an **IAM Role attached to the EC2**
* No AWS access keys are stored or hardcoded

**IAM Role Permissions:**

* AmazonEC2FullAccess
* AmazonVPCFullAccess

---

## 📁 Project Structure

```
terraform-aws-infra/
│
├── provider.tf              # AWS provider configuration
├── variables.tf             # Input variables
├── vpc.tf                   # VPC, Subnet, IGW, Route Table
├── ec2.tf                   # EC2 instance & AMI data source
├── outputs.tf               # Output values
├── terraform.tfvars.example # Example variable file
├── .gitignore               # Git ignore rules
└── README.md                # Project documentation
```

---

## ⚙️ Terraform Workflow

```bash
terraform init      # Initialize Terraform & providers
terraform validate  # Validate configuration files
terraform plan      # Preview infrastructure changes
terraform apply     # Create infrastructure
terraform destroy   # Destroy infrastructure
```

---

## 🧪 Issues Faced & Solutions

### ❌ SSH Connection Timeout

**Problem:**

* Unable to SSH into EC2 instance after creation

**Root Cause:**

* Public subnet had no Internet Gateway or route table

**Solution:**

* Added Internet Gateway
* Created route table with `0.0.0.0/0` route
* Associated route table with public subnet

**Result:**

* SSH connectivity restored

---

## 📦 AMI Selection Strategy

* Used Terraform **data source** to dynamically fetch the latest Amazon Linux AMI
* Avoided hardcoding AMI IDs for better maintainability

---

## 💰 Cost Management

* Used Free Tier–eligible instance type (`t3.micro`)
* Avoided NAT Gateway and paid services
* Infrastructure destroyed after testing to prevent cost leakage

---

## 🚀 Key DevOps Skills Demonstrated

* Infrastructure as Code (Terraform)
* AWS Networking (VPC, Subnet, IGW, Routing)
* IAM Roles & secure authentication
* Cloud debugging & root cause analysis
* Version-controlled infrastructure (Git)
* Cost-aware cloud design

---

## 📌 Resume-Ready Summary

> Provisioned AWS VPC, networking, security groups, and EC2 infrastructure using Terraform with IAM role–based authentication and production-grade networking design.

---

## 📈 Future Enhancements

* Remote Terraform state using S3 + DynamoDB locking
* Modular Terraform structure
* Jenkins CI/CD integration for Terraform

---

## 👤 Author

**Siddharth Basu**
DevOps / Cloud Engineer

