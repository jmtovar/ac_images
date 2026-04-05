FROM debian:bookworm-slim

ENV DEBIAN_FRONTEND=noninteractive

# hadolint ignore=DL3008
RUN apt-get update -qq && apt-get install -y -qq --no-install-recommends \
  bash \
  ca-certificates \
  curl \
  git \
  python3 \
  python3-pip \
  python3-venv && \
rm -rf /var/lib/apt/lists/*

SHELL ["/bin/bash", "-o", "pipefail", "-c"]

# Install GitHub CLI
# hadolint ignore=DL3008
RUN curl -fsSL https://cli.github.com/packages/githubcli-archive-keyring.gpg \
      | dd of=/usr/share/keyrings/githubcli-archive-keyring.gpg && \
    chmod go+r /usr/share/keyrings/githubcli-archive-keyring.gpg && \
    echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/githubcli-archive-keyring.gpg] https://cli.github.com/packages stable main" \
      > /etc/apt/sources.list.d/github-cli.list && \
    apt-get update -qq && \
    apt-get install -y -qq --no-install-recommends gh && \
    rm -rf /var/lib/apt/lists/*

# Install Claude Code native binary
RUN curl -fsSL https://claude.ai/install.sh | bash && \
    cp /root/.local/bin/claude /usr/local/bin/claude

WORKDIR /workspace
ENTRYPOINT ["claude"]
