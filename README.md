# summer-program

# Jenkins Virtual Machine
docker run -u root -p 8080:8080 -p 50000:50000 -v jenkins:/var/jenkins_home -v /var/run/docker.sock:/var/run/docker.sock -v $(which docker):/usr/bin/docker --restart=on-failure jenkins/jenkins:lts-jdk11
