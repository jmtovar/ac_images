

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
