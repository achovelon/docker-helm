FROM alpine:3.15.0
WORKDIR /helm

# Install requirements
RUN apk add --no-cache bash ca-certificates curl git

# Define build arguments
#ARG HELM_VERSION=${HELM_VERSION}
ARG HELM_VERSION=3.8.0
# Download & Install Helm
RUN curl -L https://get.helm.sh/helm-v${HELM_VERSION}-linux-amd64.tar.gz | tar xvz && \
    mv linux-amd64/helm /usr/local/bin/helm && chmod +x /usr/local/bin/helm && rm -rf linux-amd64
RUN /usr/local/bin/helm plugin install https://github.com/chartmuseum/helm-push
