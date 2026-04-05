FROM debian:bookworm-slim

ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update -qq && apt-get install -y -qq --no-install-recommends \
    curl bash git ca-certificates \
    python3 python3-pip python3-venv && \
    rm -rf /var/lib/apt/lists/*

# Install Claude Code native binary
RUN curl -fsSL https://claude.ai/install.sh | bash && \
    cp /root/.local/bin/claude /usr/local/bin/claude

WORKDIR /workspace
ENTRYPOINT ["claude"]