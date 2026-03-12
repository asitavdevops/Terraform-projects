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
***sudo apt-get update && sudo apt-get install -y gnupg software-properties-common***

**Then add the HashiCorp repository and install Terraform.**

***wget -O- https://apt.releases.hashicorp.com/gpg | \
gpg --dearmor | \
sudo tee /usr/share/keyrings/hashicorp-archive-keyring.gpg***

**Add the official HashiCorp repository to your system.**
***echo "deb [signed-by=/usr/share/keyrings/hashicorp-archive-keyring.gpg] \
https://apt.releases.hashicorp.com $(lsb_release -cs) main" | \
sudo tee /etc/apt/sources.list.d/hashicorp.list***

**sudo apt update**

**sudo apt install terraform**

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
1. Once the terraform file created (aws/local_state/main.tf)
        Run -> **terraform init** 
        op -> Terraform has been successfully initialized!
2. terraform plan 
        op --> Plan: 2 to add, 0 to change, 0 to destroy.
3. terraform apply 
        op --> Do you want to perform these actions? Enter a value: Yes
                Apply complete! Resources: 2 added, 0 changed, 0 destroyed.
4. terraform destory

**terraform.tfstate** : Teraform state file : Very Imp as keeps the track of infracture .(Any modify,delete,update with infra)
When we do terraform inti -> plan ->apply then along with infra a tfstate file also got created . Which keeps the track of all your 
infracture created by terraform.
-> **Usually we should not(never) keep the tfstate file in git because it carries sensitive info like kns keys , vps details etc
   instead we should keep tfstate file in centralized locaion like S3 and locking mechanizim by remote back end like Dynamo DB .**
-> We should never store the tfstate file in local system .
-> Never manipulate tfstate in local system because Terraform might corrupted . So the tfstate should given read permissions only .

**Ideal Terraform SET UP.**
User --> Jenkins --> Terraform uploaded to GIT --> AWS
                                |
                        Amazon S3(tfstate file) --> Dynamo DB(Locking Solution) 

In Ideal world Devops will write Terraform Scripts and they will store the Terraform files in GIT repo (like main.tf), as users in my 
organization not allowed to create AWS infra ,so we have to create the Jemkins pipeline which will watch for the Terraform resources in the GitHub and executed the task in AWS based on TF file .
The tfstate files should be stored in the S3 which is called **remote backend** , in order to avoide parallal executing the 
terraform scripts by mutiple user  we need to intigrate remote backend with Dynamo DB in order to locking the tfstate file. SO 
that Multiple user can not run the same tfstate file in same time .

**Remote Back End setup :**









