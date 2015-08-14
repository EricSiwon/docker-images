FROM wholroyd/centos:latest

MAINTAINER William Holroyd <wholroyd@gmail.com>

RUN yum -y install openssh-server && \
    yum -y install java-1.7.0-openjdk  
  
RUN echo "root:password" | chpasswd  
RUN useradd jenkins  
RUN echo "jenkins:jenkins" | chpasswd  
  
RUN mkdir -p /var/run/sshd  
RUN ssh-keygen -t rsa -f /etc/ssh/ssh_host_rsa_key -N ''  
RUN ssh-keygen -t ecdas -f /etc/ssh/ssh_host_ecdsa_key -N ''
RUN sed -i 's|session    required     pam_loginuid.so|session    optional     pam_loginuid.so|g' /etc/pam.d/sshd  
   
EXPOSE 22  

CMD ["/usr/sbin/sshd", "-D"]  
