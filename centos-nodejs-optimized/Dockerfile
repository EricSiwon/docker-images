FROM wholroyd/centos-nodejs

MAINTAINER William Holroyd <wholroyd@gmail.com>

RUN yum -y autoremove && \
    yum clean all

RUN rpm -ev yum-plugin-fastestmirror yum-metadata-parser yum \
        pyxattr pyliblzma pygpgme rpm-python python-iniparse python-urlgrabber python-pycurl \
	perl-Carp perl-constant perl-Encode perl-Exporter perl-File-Path perl-File-Temp \
	perl-Filter perl-Getopt-Long perl-HTTP-Tiny perl-libs perl-macros perl-parent \
	perl-PathTools perl-Pod-Escapes perl-podlators perl-Pod-Perldoc perl-Pod-Simple \
	perl-Pod-Usage perl-Scalar-List-Utils perl-Socket perl-Storable perl-Text-ParseWords \
	perl-threads perl-threads-shared perl-Time-HiRes perl-Time-Local redhat-rpm-config \
	perl nodejs-packaging nodejs-devel node-gyp npm   

RUN rm -fr /tmp/* && \
    rm -fr /usr/share/locale && \
    rm -fr /usr/share/zoneinfo && \
    rm -fr /usr/share/groff && \
    rm -fr /usr/share/i18n && \
    rm -fr /usr/share/perl5 && \
    rm -fr /usr/lib64/perl5 && \
    rm -fr /usr/lib/locale && \
    rm -fr /var/lib/yum && \ 
    rm -fr /var/lib/rpm && \
    rm -fr /var/lib/rpm-state && \
    rm -fr /var/cache/*

# Define working directory.
WORKDIR /data

# Define default command.
CMD ["bash"]

