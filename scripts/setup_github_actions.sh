#!/bin/bash
set -euo pipefail

WORKFLOW_DIR=".github/workflows"
mkdir -p "$WORKFLOW_DIR"

cat > "$WORKFLOW_DIR/dependency-scan.yml" << EOF
name: Dependency Scan

on: [push, pull_request]

jobs:
  scan:
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v3
      - name: Run Dependency-Check
        run: ./scripts/run_checks.sh
EOF

echo "Workflow GitHub Actions criado em $WORKFLOW_DIR/dependency-scan.yml"
