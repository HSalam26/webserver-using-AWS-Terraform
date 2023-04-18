# Creating a Webserver on AWS using Terraform

This repository contains a Terraform file that creates an AWS instance running a webserver, allowing you to host a website or web application. The following instructions explain how to use this repository to create and manage an AWS instance running a webserver.

## Prerequisites
Before using this repository, you must have the following installed on your local machine:

[Terraform](https://developer.hashicorp.com/terraform/downloads)

[AWS CLI](https://aws.amazon.com/cli/)

You must also have an AWS account and an IAM user with sufficient permissions to create and manage EC2 instances.

## Instructions
1. Clone this repository to your local machine.
2. Navigate to the cloned repository directory in your terminal or command prompt.
3. Open the first-server.tf file and edit the following variables to customize your AWS instance:

    - region: The AWS region in which to create the instance.

    - ami: The ID of the Amazon Machine Image to use for the instance.

    - instance_type: The instance type to use for the instance.

    - key_name: The name of the key pair to use for SSH access to the instance.
4. Run terraform init to initialize the Terraform working directory and download the required provider plugins.
5. Run terraform apply to create the AWS resources specified in the first-server.tf file.
6. Once Terraform has finished creating the resources, check to make sure that the instance has been created in the AWS console.
7. Connect to the instance using SSH. The command to connect will be output by Terraform after the instance has been created. For example, ssh -i my_key.pem ec2-user@<public_ip>.
8. Once connected to the instance, check to see if the webserver is working by opening a web browser and navigating to the instance's public IP address. You should see your user-data if everything is working correctly.
9. When you are finished using the AWS instance, run terraform destroy to remove all of the resources created by Terraform.

## Conclusion
This repository provides an easy and convenient way to create and manage an AWS instance running a webserver using Terraform. By following the instructions provided in this README, you can quickly create an AWS instance and deploy your website or web application.

## Note
You can check the Images folder to see how the interface should look like for every step
