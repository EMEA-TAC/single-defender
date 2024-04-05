# single-defender
Linux Defender
Terraform script designed to deploy and configure a Google Compute Instance with Ubuntu 18.04 LTS(you can customize the version to meet your needs), pre-configured with a Defender agent for enhanced security. The script utilizes an API token for authentication to download and install the Defender agent from a specified location.

Prerequisites
Before running this script, ensure you have the following:

Terraform installed on your machine.
Access to a Google Cloud project with the necessary permissions to create resources.
A service account key file for authentication with Google Cloud.
Configuration
Token: This is your authorization token for API access. It is required to download and install the Defender agent. Please ensure this token is kept secure.

Google Cloud Provider: The script is configured to deploy resources in the us-central1 region and us-central1-a zone(you can customize the version to meet your needs). You'll need to replace the project and credentials fields with your Google Cloud project ID and the path to your service account key file, respectively.

Usage
To use the Linux Defender script, follow these steps:

To run a Terraform configuration like main.tf with variables defined in a secrets.tfvars file, which typically contains sensitive information such as tokens, passwords, or secret keys, follow these steps. Ensure you handle secrets.tfvars with care to avoid exposing sensitive information.

Prepare Your Files: Ensure your main.tf Terraform configuration is ready, and you have a secrets.tfvars created with API token from your tenant.

Initialize Terraform:
Run terraform init in the directory containing your Terraform files to initialize Terraform with your configuration.

Plan the Deployment:
Plan Your Deployment with Secrets: To see what Terraform will do without making any changes to your resources, run the plan command with your secrets.tfvars file:

terraform plan -var-file="secrets.tfvars"

Apply the Configuration:
To apply your Terraform configuration and create the resources defined in main.tf using the secrets from secrets.tfvars, run:

terraform apply -var-file="secrets.tfvars"

Verify Installation:
Once the script has successfully executed, you should verify that the Defender agent is correctly installed and running on your Google Compute Instance and it is visible in the Prisma Cloud console

Important Notes
The token variable is marked as sensitive to prevent its value from being exposed in logs or console output.
Always ensure that your secrets.tfvars file is stored securely and never shared or committed to version control systems. 
Ensure the service account used has sufficient permissions to create and manage resources in Google Cloud.
The Defender installation script and controller host may need to be updated based on your Defender agent version or region.
