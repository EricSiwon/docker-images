FROM wholroyd/centos-dnx:latest

MAINTAINER William Holroyd <wholroyd@gmail.com>

## This installs and configures the necessary bits to make this a Docker-ized Jenkins slave

RUN yum -y install openssh-server && \
    yum -y install git

RUN echo "root:password" | chpasswd  
RUN useradd jenkins  
RUN echo "jenkins:jenkins" | chpasswd  
  
RUN mkdir -p /var/run/sshd  
RUN ssh-keygen -A
RUN sed -i 's|session    required     pam_loginuid.so|session    optional     pam_loginuid.so|g' /etc/pam.d/sshd  
   
EXPOSE 22 

# Define default command.
CMD ["/usr/sbin/sshd", "-D"]
