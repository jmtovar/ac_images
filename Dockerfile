FROM ghcr.io/anthropics/claude-code:latest

# Add your project-specific tools
RUN apt-get update && apt-get install -y \
    python3 git curl && \
    rm -rf /var/lib/apt/lists/*

WORKDIR /workspace