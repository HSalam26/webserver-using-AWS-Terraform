provider "aws" {
        region = "eu-west-2"
}
#creating security group, allow ssh and http

resource "aws_security_group" "Hello-terra-ssh-http" {
        name        = "Hello-terra-ssh-http"
        description = "allowing ssh and http traffic"

        ingress {
            from_port = 22
            to_port = 22
            protocol = "tcp"
            cidr_blocks = ["0.0.0.0/0"]
        }

        ingress {
            from_port = 80
            to_port = 80
            protocol = "tcp"
            cidr_blocks = ["0.0.0.0/0"]
        }
        
        egress {
            from_port        = 0
            to_port          = 0
            protocol         = "-1"
            cidr_blocks      = ["0.0.0.0/0"]
        }
}
#security group ends here

#creating EC2 instance


resource "aws_instance" "hello-terra"{
        ami = "ami-0f3497daebf127026"
        instance_type = "t2.micro"
        security_groups = ["${aws_security_group.Hello-terra-ssh-http.name}"]
        key_name = "key"
        user_data = <<-EOF
                #! /bin/bash
                sudo yum install httpd -y
                sudo systemctl start httpd
                sudo systemctl enable httpd
                echo "<h1>Sample Webserver created using terraform<br>Hamza Salam<h1>" >> /var/www/html/index.html
        EOF

       tags = {
            Name = "WebServer"
        }
}