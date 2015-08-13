FROM wholroyd/centos:latest

MAINTAINER William Holroyd <wholroyd@gmail.com>

RUN yum -y install openjdk-7-jdk && \
    yum -y install openssh-server && \
    sed -i 's|session    required     pam_loginuid.so|session    optional     pam_loginuid.so|g' /etc/pam.d/sshd && \
    mkdir -p /var/run/sshd


RUN adduser --quiet jenkins

RUN echo "jenkins:jenkins" | chpasswd

EXPOSE 22

CMD ["/usr/sbin/sshd", "-D"]