FROM jenkins/jenkins:lts-jdk21

USER root

# Install base dependencies + Docker CLI + Node.js
RUN apt-get update && \
    apt-get install -y \
        maven \
        docker.io \
        curl \
        wget \
        gnupg \
        lsb-release && \
    curl -fsSL https://deb.nodesource.com/setup_22.x | bash - && \
    apt-get install -y nodejs && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

RUN groupadd -g 102 docker || true
RUN usermod -aG docker jenkins

# Install Trivy
RUN wget -qO - https://aquasecurity.github.io/trivy-repo/deb/public.key | \
    gpg --dearmor -o /usr/share/keyrings/trivy.gpg && \
    echo "deb [signed-by=/usr/share/keyrings/trivy.gpg] https://aquasecurity.github.io/trivy-repo/deb generic main" \
        > /etc/apt/sources.list.d/trivy.list && \
    apt-get update && \
    apt-get install -y trivy && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

USER jenkins

