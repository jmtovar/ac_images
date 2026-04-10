
## GitHub Authentication

`gh` (GitHub CLI) is included in the image.

### Option A — Personal Access Token (recommended)

Create a [GitHub PAT](https://github.com/settings/tokens) with `repo` scope, then export it in your shell:

```bash
export GH_TOKEN=ghp_yourtoken
```

Singularity inherits the host environment, so `GH_TOKEN` is automatically available inside the container.

## Pull the image

```bash
singularity pull claude.sif docker://ghcr.io/jmtovar/ac_images:latest
```

## Run Claude Code

Run interactively, mounting your current project directory:

```bash
singularity run \
  --bind $(pwd):/workspace \
  ~/claude.sif
```

Run a one-off non-interactive command with `--print`:

```bash
singularity run \
  --bind $(pwd):/workspace \
  ~/claude.sif \
  --print "explain what this codebase does"
```
