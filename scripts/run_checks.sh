#!/bin/bash
set -euo pipefail

REPORT_DIR="reports"
mkdir -p "$REPORT_DIR"

echo "Rodando knip (dependências não usadas) para cada servidor MCP..."
for dir in ./mcp-servers/*; do
  if [ -f "$dir/package.json" ]; then
    echo "Analisando dependências em $dir ..."
    knip "$dir" > "$REPORT_DIR/knip_report_$(basename "$dir").txt"
  fi
done

echo "Executando npm audit para verificar vulnerabilidades..."
for dir in ./mcp-servers/*; do
  if [ -f "$dir/package.json" ]; then
    echo "Rodando npm audit em $dir..."
    (cd "$dir" && npm audit --json > "../$REPORT_DIR/npm_audit_$(basename "$dir").json")
  fi
done

echo "Executando OWASP Dependency-Check..."
for dir in ./mcp-servers/*; do
  echo "Auditando $dir com Dependency-Check..."
  ./dependency-check/dependency-check/bin/dependency-check.sh --project "gemini-cli-enhanced" --scan "$dir" \
  --format HTML --out "$REPORT_DIR/dependency-check-$(basename "$dir")"
done

echo "Executando perfil de performance via Clinic.js (exemplo com 01-centminmod)..."
clinic doctor -- node ./mcp-servers/01-centminmod/server.js

echo "Todas as auditorias foram concluídas. Relatórios em $REPORT_DIR."