FROM wholroyd/centos:latest

MAINTAINER William Holroyd <wholroyd@gmail.com>

## This installs the Mono environment

RUN rpm --import "http://keyserver.ubuntu.com/pks/lookup?op=get&search=0x3FA7E0328081BFF6A14DA29AA6A19B38D3D831EF"
RUN yum install -y yum-utils
RUN yum-config-manager --add-repo http://download.mono-project.com/repo/centos/

RUN yum -y install mono-devel ca-certificates-mono fsharp mono-vbnc nuget

## This installs the DNX environment

ENV DNX_VERSION 1.0.0-beta6
ENV DNX_USER_HOME /opt/dnx

RUN yum -y update && yum -y install unzip

RUN curl -sSL https://raw.githubusercontent.com/aspnet/Home/dev/dnvminstall.sh | DNX_USER_HOME=$DNX_USER_HOME DNX_BRANCH=v$DNX_VERSION sh
RUN bash -c "source $DNX_USER_HOME/dnvm/dnvm.sh && \
    dnvm install $DNX_VERSION -a default && \
    dnvm alias default | xargs -i ln -s $DNX_USER_HOME/runtimes/{} $DNX_USER_HOME/runtimes/default"

# Install libuv for Kestrel from source code (binary is not in wheezy and one in jessie is still too old)
# Yet this may not be a problem for CentOS - will have to check it out. Until then...
RUN yum -y install \
    make \
    autoconf \
    automake \
    build-essential \
    libtool
RUN LIBUV_VERSION=1.4.2 && \
    curl -sSL https://github.com/libuv/libuv/archive/v${LIBUV_VERSION}.tar.gz | tar zxfv - -C /usr/local/src && \
    cd /usr/local/src/libuv-$LIBUV_VERSION && \
    sh autogen.sh && ./configure && make && make install && \
    rm -rf /usr/local/src/libuv-$LIBUV_VERSION && \
    ldconfig

ENV PATH $PATH:$DNX_USER_HOME/runtimes/default/bin

# Define working directory.
WORKDIR /data

# Define default command.
CMD ["bash"]
