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

*************************************************#######################***************************************************

