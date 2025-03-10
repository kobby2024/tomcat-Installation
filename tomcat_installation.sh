#!/bin/bash
# TOMCAT.SH
# Steps for Installing tomcat9 on rhel9
# update server
sudo yum update -y
# sudo yum install fontconfig java-17-openjdk -y.
sudo hostnamectl set-hostname tomcat
cd /opt
# install git wget zip unzip packages
sudo yum install git wget zip unzip -y
sudo yum install fontconfig java-17-openjdk -y
sudo wget https://dlcdn.apache.org/tomcat/tomcat-9/v9.0.100/bin/apache-tomcat-9.0.100.zip
sudo unzip apache-tomcat-9.0.100.zip
sudo rm -rf apache-tomcat-9.0.100.zip
### rename tomcat for good naming convention
sudo mv apache-tomcat-9.0.100 tomcat9
### assign executable permissions to the tomcat home directory
sudo chmod 777 -R /opt/tomcat9
sudo chown ec2-user -R /opt/tomcat9
### start tomcat
sh /opt/tomcat9/bin/startup.sh
# create a soft link to start and stop tomcat
# This will enable us to manage tomcat as a service
sudo ln -s /opt/tomcat9/bin/startup.sh /usr/bin/starttomcat
sudo ln -s /opt/tomcat9/bin/shutdown.sh /usr/bin/stoptomcat
starttomcat
echo "end on tomcat installation"
#========
