FROM redhat/ubi8:8.6-754
ARG R_VERSION=GIT_R_VERSION
RUN subscription-manager register --username=rahu.3296@gmail.com --password=jackadv@1 && \
    subscription-manager attach --auto && \
    subscription-manager repos --enable codeready-builder-for-rhel-8-x86_64-rpms && \
    dnf install -y https://dl.fedoraproject.org/pub/epel/epel-release-latest-8.noarch.rpm && \ 
    dnf clean all 
    