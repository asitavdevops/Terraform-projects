# Terraform Lifecycle Flow
The lifecycle of Terraform describes the steps used to provision and manage infrastructure using Infrastructure as Code.
**Write → Init → Plan → Apply → Destroy**

Write Configuration --> Define Infrastructure(we write the infrastructure configuration in Terraform files (.tf))
        ↓
terraform init --> Initialization(terraform init)
        ↓
terraform plan --> Execution Plan(terraform plan)
        ↓
terraform apply -->Provision Infrastructure (terraform apply)
        ↓
Infrastructure Created 
        ↓
terraform destroy -->Remove Infrastructure(terraform destroy)

Write: Define infrastructure resources in .tf configuration files to describe what infrastructure should be created in Amazon Web Services or other clouds.
terraform init: Initializes the working directory and downloads required providers to connect Terraform with cloud platforms.
terraform plan: Generates an execution plan showing what resources will be created, modified, or destroyed before applying changes.
terraform apply: Executes the plan and provisions infrastructure by calling cloud provider APIs.
terraform destroy: Removes or deletes all infrastructure resources that were created by Terraform.

**Why to use Terraform**: Earlier each cloud provider had its own Infrastructure as Code tool like CloudFormation for AWS, ARM templates for Azure, and Heat for OpenStack. Terraform solves this problem by providing a single tool that can provision infrastructure across multiple cloud providers using the same configuration language. HashiCorp is the company that created Terraform.

Note: Terraform interacts with multiple cloud providers using APIs(is a set of rules that allows two applications to communicate with each other) example- Script / Application → API Request → Google → Response (Result)
Real Example Using API:
Suppose a developer writes a script like this --> curl https://api.example.com/users
Flow: Script → API Endpoint → Server → Response
The server returns data like: 
{
 "name": "John",
 "age": 25
}

****Start With TF**********
**Refr:** AWS terraform provide - google hashicorp terraform aws provider(https://registry.terraform.io/providers/hashicorp/aws/latest/docs)
How Terraform Works: **Terraform → Terraform Provider → Target API**
**Terraform:** You write infrastructure configuration Example: define servers, databases, networks, etc
**Terraform Provider**: A plugin that allows Terraform to talk to different platforms. xamples: Amazon Web Services, Google Cloud, Microsoft Azure, GitHub, Kubernetes.
**Target API :** The provider calls the platform's API to create or manage resources. Example: create VM, storage bucket, VPC
**Note:** So Terraform doesn't create resources directly.It talks to providers, which call the platform APIs.

**Install Terraform Using Package Managers(Avoid using curl command)** :
**refer link:** https://developer.hashicorp.com/terraform/tutorials/aws-get-started/install-cli

**Mac (using Homebrew)** 
brew tap hashicorp/tap
brew install hashicorp/tap/terraform
brew upgrade hashicorp/tap/terraform

**Linux Installation:**
sudo apt-get update && sudo apt-get install -y gnupg software-properties-common
Then add the HashiCorp repository and install Terraform.
wget -O- https://apt.releases.hashicorp.com/gpg | \
gpg --dearmor | \
sudo tee /usr/share/keyrings/hashicorp-archive-keyring.gpg

echo "deb [signed-by=/usr/share/keyrings/hashicorp-archive-keyring.gpg] \
https://apt.releases.hashicorp.com $(lsb_release -cs) main" | \
sudo tee /etc/apt/sources.list.d/hashicorp.list

sudo apt update
sudo apt install terraform

**Verify installation** -->terraform -version

**Prerequsite before creating TF infrastructure :** --> Setup AWS/AZURE/GCP CLI so that it can talk to provider(AWS/AZ/GCP) APIs.
For AWS CLI setup :
1. Download AWS CLI package manager (Linux/Windos/MAC) -> https://docs.aws.amazon.com/cli/latest/userguide/getting-started-install.html
   OR you can run from cmd(Windows) : msiexec.exe /i https://awscli.amazonaws.com/AWSCLIV2.msi
2. set up CLI from your local system then check if it installed -->connect CMD--> aws --version
3. **login to AWS account -->Account -->Security credentials -->Access keys -> Create the Access Keys**
   Now grab Access key : ******** Secret access key : ******
4. connect to CMD (AWS CLI installed)  -> aws configutation --> Do the Set up
5. Now it should be able to connect to AWS from CLI --> aws s3 ls

**Starting with Terraform Coading :**






