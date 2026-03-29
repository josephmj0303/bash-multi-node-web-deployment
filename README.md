# 🚀 Bash Multi-Node Web Deployment Automation
![Bash](https://img.shields.io/badge/Scripting-Bash-121011?style=for-the-badge&logo=gnu-bash&logoColor=white)
![Apache](https://img.shields.io/badge/WebServer-Apache-D22128?style=for-the-badge&logo=apache&logoColor=white)
![Amazon EC2](https://img.shields.io/badge/Cloud-Amazon%20EC2-FF9900?style=for-the-badge&logo=amazon-aws&logoColor=white)
![Amazon Linux](https://img.shields.io/badge/OS-Amazon%20Linux%202023-232F3E?style=for-the-badge&logo=amazonaws&logoColor=white)
![Ubuntu](https://img.shields.io/badge/OS-Ubuntu%2024.04-E95420?style=for-the-badge&logo=ubuntu&logoColor=white)
![Infrastructure](https://img.shields.io/badge/Infrastructure-Multi--Node-blue?style=for-the-badge)


This project demonstrates **real-world DevOps automation using Bash scripting** to deploy a web application across multiple Linux servers using **SSH key-based authentication and non-interactive privilege escalation**.

The solution works across **heterogeneous Linux distributions** (Amazon Linux 2023 and Ubuntu 24.04) and mirrors how CI/CD tools execute remote tasks.

---

## 🔧 Technologies Used

- Bash scripting
- SSH & SCP
- Passwordless sudo
- Amazon Linux 2023
- Ubuntu 24.04
- AWS EC2 (Free Tier)

---

## 🧩 Architecture Overview

- **Control Node**: `web01`
- **Target Nodes**: `web02`, `web03`
- **User**: `devops`
- **Authentication**: SSH key-based
- **Privilege Escalation**: `sudo` (NOPASSWD)
```
web01 (Control Node)
|
|-- SSH + SCP
|
web02 (Amazon Linux)
web03 (Ubuntu)
```

---

## 📂 Project Components

### 1️⃣ `webdeploy.sh`
- Reads remote hosts from inventory
- Copies deployment script to remote servers
- Executes script with elevated privileges
- Cleans up temporary files

### 2️⃣ `multios_websetup.sh`
- Detects Linux distribution
- Installs web server packages
- Deploys website content
- Starts and enables services

### 3️⃣ `remhosts`
- Inventory file containing target server hostnames

---

## 🚀 How Deployment Works

1. SSH keys authenticate the `devops` user
2. Script is copied using `scp`
3. Script executes remotely using `sudo`
4. Website is deployed on all target nodes
5. Script is removed after execution

No passwords, no manual intervention.

---

## ▶️ Usage

### Step 1: Clone Repository
```
git clone https://github.com/josephmj0303/bash-multi-node-web-deployment.git
cd bash-multi-node-web-deployment
```
Step 2: Update Inventory

Edit:
```
inventory/remhosts
```
Example:
```
web02
web03
```
Step 3: Run Deployment
```
chmod +x scripts/webdeploy.sh
./scripts/webdeploy.sh
```
---
## 🔐 Security Model

* Root SSH login disabled
* Password authentication disabled
* Non-root user (devops) used for automation
* Passwordless sudo limited to automation tasks
* This aligns with production security best practices.
---
## 🧠 DevOps Concepts Demonstrated

* Non-interactive automation
* Privilege escalation handling
* Cross-OS compatibility
* Infrastructure consistency
* Idempotent deployment logic
* CI/CD-style execution model
---
## 📈 Improvements Roadmap

* Convert to Ansible playbook
* Parallel execution
* Logging and rollback support
* Load balancer integration
* CI pipeline integration
---
## 📌 Why This Project Matters

This project replicates how real deployment pipelines work using foundational tools before introducing configuration management platforms.

It demonstrates:

* Strong Linux fundamentals
* Bash automation skills
* SSH and sudo mastery
* Production-oriented thinking
