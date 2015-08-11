FROM centos:latest

RUN rpm -Uvh https://dl.fedoraproject.org/pub/epel/epel-release-latest-7.noarch.rpm
RUN yum clean all
RUN rpm --rebuilddb

# Define working directory.
WORKDIR /data

# Define default command.
CMD ["bash"]

