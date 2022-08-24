FROM jenkins/jnlp-slave
USER root
RUN apt-get update && \
    apt-get install -y make curl golang
USER jenkins
ENV GO_VERSION 1.18.5
RUN go get golang.org/dl/go${GO_VERSION}
RUN go install golang.org/dl/go${GO_VERSION}
RUN /home/jenkins/go/bin/go${GO_VERSION} download
ENV GOROOT=/home/jenkins/sdk/go${GO_VERSION}
ENV PATH=/home/jenkins/sdk/go${GO_VERSION}/bin:/home/jenkins/go/bin:${PATH}
