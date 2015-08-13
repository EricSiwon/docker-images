FROM wholroyd/centos:latest

MAINTAINER William Holroyd <wholroyd@gmail.com>

ENV datadir /var/data
ENV appname jenkins
ENV appversion 1.617
ENV portoffset 90
ENV JAVA_OPTIONS -Xmx1024m
ENV JENKINS_OPTIONS --httpPort=80${portoffset}
ENV JENKINS_HOME ${datadir}/${appname}

# create data directory
RUN mkdir -p /var/data

# create user
RUN adduser -u 10${portoffset} -U ${appname} -b ${datadir}

# setting up locale
RUN echo "LC_ALL=en_US.UTF-8" >> ${JENKINS_HOME}/.bashrc

# install basic tools
RUN yum install --quiet git subversion vim wget curl tar -y && yum clean all -y

# get java
RUN wget --quiet --no-check-certificate --no-cookies --header "Cookie: oraclelicense=accept-securebackup-cookie" http://download.oracle.com/otn-pub/java/jdk/8u45-b14/jdk-8u45-linux-x64.tar.gz -O /opt/jdk18.tar.gz && cd /opt && tar xfz jdk18.tar.gz && ln -s /opt/jdk1.8* /opt/jdk18 && rm -rf /opt/*.tar.gz

# add java opts to .bashrc file
RUN echo "export JAVA_OPTIONS=${JAVA_OPTIONS}" >> ${JENKINS_HOME}/.bashrc

# create custom run.sh
RUN wget --quiet http://mirrors.jenkins-ci.org/war/latest/jenkins.war -O /opt/jenkins.war && chown ${appname}:${appname} /opt/jenkins.war

# create custom run.sh
RUN echo "/opt/jdk18/bin/java ${JAVA_OPTS} -jar /opt/jenkins.war ${JENKINS_OPTIONS}" >> /opt/run.sh

# start jenkins on container start
CMD su - jenkins -c "sh /opt/run.sh"