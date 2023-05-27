#!/bin/bash

# Author: Isiaq (a.k.a Easy$)
# Date: 5/27/2023
# Description: Jenkins Installation Package

echo "Jenkins installation process has been automated, please wait for a moment as this will take some minutes..."


## Jenkins is a Java application, so the first step is to install Java. 
yum install java-11-openjdk-devel -y

## Add the Jenkins repositories so that we can install the latest version of Jenkins. 
curl --silent --location http://pkg.jenkins-ci.org/redhat-stable/jenkins.repo | sudo tee /etc/yum.repos.d/jenkins.repo
sudo rpm --import https://jenkins-ci.org/redhat/jenkins-ci.org.key
sudo rpm --import https://pkg.jenkins.io/redhat-stable/jenkins.io-2023.key

## Install the latest stable version of Jenkins
cd ~
sudo yum install jenkins -y

## Start the Jenkins service, check it status and set it to run at boot time:
sudo systemctl start jenkins.service
sudo systemctl status jenkins.service
sudo systemctl enable jenkins.service

## Adjust the firewall by opening the necessary port for Jenkins:
sudo firewall-cmd --permanent --zone=public --add-port=8080/tcp
sudo firewall-cmd --reload

echo "Installation Completed Successively!!!"

#########################################################################################################################
## Now, setup Jenkins on the server, by following these steps:
# 1. Type http://your_ip_or_domain:8080 on your broswer
# 2. If Jenkins is securely set up, a password box will be shown. You will be asked to copy the administrator password from the terminal using the command: sudo cat /var/lib/jenkins/secrets/initialAdminPassword
# 3. Paste this password into the administrator password box to unlock Jenkins.
# 4. Click on the Install suggested Plugins box and the installation process will start immediately 
# 5. Create the first admin user
# 6. Instance Configuration
# 7.On the next page, you must set the URL for the Jenkins instance. The Jenkins URL field will have a default value (automatically generated). Just click on Save and Finish