#FROM centos:centos8
# use ubi image
FROM registry.access.redhat.com/ubi8/ubi


RUN echo "Installing dependancies" && \
yum update -y && \
yum install wget unzip -y && \
yum clean all -y



RUN echo "Installing AWS cli v2" && \
    mkdir /tmp/aws && \
    cd /tmp/aws && \
    wget -O awscliv2.zip  https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip && \
    unzip awscliv2.zip && \
    ./aws/install 


# install the latest oc client for version 4.3.5 


RUN echo "Installing oc cli" && \
    mkdir /tmp/oc && \
    cd /tmp/oc && \
    wget -O oc.tar.gz https://mirror.openshift.com/pub/openshift-v4/clients/ocp/latest-4.3/openshift-client-linux.tar.gz && \
    tar  -zxvf oc.tar.gz && \
    mv oc /usr/bin/ && \
    mv kubectl /usr/bin/ && \
    ln -sf /usr/bin/oc /usr/bin/kubectl && \
    rm -rf *
USER 1001
WORKDIR /tmp

