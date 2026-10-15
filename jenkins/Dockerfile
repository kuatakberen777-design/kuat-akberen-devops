# Jenkins LTS + Docker CLI + Python, so the pipeline can run docker and tests
FROM jenkins/jenkins:lts
USER root
RUN apt-get update \
 && apt-get install -y --no-install-recommends docker-cli python3 \
 && rm -rf /var/lib/apt/lists/*
USER jenkins
