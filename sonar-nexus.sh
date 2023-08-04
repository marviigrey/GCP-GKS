
#!/bin/bash

# Install required dependencies
sudo yum install -y wget unzip java-11-openjdk-devel

# Install SonarQube
echo "Installing SonarQube..."
wget https://binaries.sonarsource.com/Distribution/sonarqube/sonarqube-9.0.1.46107.zip
unzip sonarqube-9.0.1.46107.zip
sudo mv sonarqube-9.0.1.46107 /opt/sonarqube
sudo /opt/sonarqube/bin/linux-x86-64/sonar.sh start

# Install Nexus Repository Manager
echo "Installing Nexus Repository Manager..."
wget https://download.sonatype.com/nexus/3/latest-unix.tar.gz
tar -zxvf latest-unix.tar.gz
sudo mv nexus-* /opt/nexus
sudo /opt/nexus/bin/nexus start

echo "Installation complete. SonarQube and Nexus are now running."

# Cleanup downloaded files
rm sonarqube-9.0.1.46107.zip
rm latest-unix.tar.gz
