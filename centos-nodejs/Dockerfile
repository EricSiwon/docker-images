FROM wholroyd/centos:latest

MAINTAINER William Holroyd <wholroyd@gmail.com>

# Install NodeJS
RUN mkdir /nodejs && \
    curl https://nodejs.org/dist/v0.12.7/node-v0.12.7-linux-x64.tar.gz | \
    tar xvzf - -C /nodejs --strip-components=1

# Configure the path
ENV PATH $PATH:/nodejs/bin
ENV PATH $PATH:/node_modules/.bin

# Define working directory.
WORKDIR /data

# Define default command.
CMD ["bash"]
