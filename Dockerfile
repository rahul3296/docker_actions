FROM redhat/ubi8:8.6-754
ARG R_VERSION=GIT_R_VERSION
RUN subscription-manager register --username=rahu.3296@gmail.com --password=jackadv@1 && \
    subscription-manager attach --auto && \
    subscription-manager repos --enable codeready-builder-for-rhel-8-x86_64-rpms && \
    dnf install -y https://dl.fedoraproject.org/pub/epel/epel-release-latest-8.noarch.rpm && \ 
    echo "Installing R-${R_VERSION} Base..." && \
    curl -O https://cdn.rstudio.com/r/centos-8/pkgs/R-${R_VERSION}-1-1.x86_64.rpm && \
    dnf install -y R-${R_VERSION}-1-1.x86_64.rpm && \
    dnf install -y unixODBC unixODBC-devel && \
    dnf clean all && \
    rm -rf R-${R_VERSION}-1-1.x86_64.rpm &&\
    ln -s /opt/R/${R_VERSION}/bin/R /usr/local/bin/R && \
    ln -s /opt/R/${R_VERSION}/bin/Rscript /usr/local/bin/Rscript && \
    ln -s /opt/R/${R_VERSION}/bin/R /usr/local/bin/${R_VERSION}

COPY Makevars /opt/R/${R_VERSION}/lib/R/etc/Makevars
COPY Makevars /opt/R/${R_VERSION}/lib64/R/etc/Makevars

ENV R_MAKEVARS_SITE=/opt/R/${R_VERSION}/lib/R/etc/Makevars

COPY Renviron /opt/R/${R_VERSION}/lib/R/etc/Renviron
COPY Renviron /opt/R/${R_VERSION}/lib64/R/etc/Renviron
