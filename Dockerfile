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

# Install Claude Code native binary
SHELL ["/bin/bash", "-o", "pipefail", "-c"]
RUN curl -fsSL https://claude.ai/install.sh | bash && \
    cp /root/.local/bin/claude /usr/local/bin/claude

WORKDIR /workspace
ENTRYPOINT ["claude"]
