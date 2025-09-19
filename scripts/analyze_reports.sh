#!/bin/bash
set -euo pipefail

REPORT_DIR="reports"
SUMMARY_FILE="$REPORT_DIR/summary.txt"
echo "Analisando relatórios e gerando resumo..." > "$SUMMARY_FILE"

# Exemplo: contagem de vulnerabilidades no npm audit
for file in "$REPORT_DIR"/npm_audit_*.json; do
  echo "Analisando $file ..." >> "$SUMMARY_FILE"
  vuln_count=$(jq '.metadata.vulnerabilities.total' "$file")
  echo "Vulnerabilidades encontradas: $vuln_count" >> "$SUMMARY_FILE"
done

# Exemplo: sumarizar knip
for file in "$REPORT_DIR"/knip_report_*.txt; do
  unused_deps=$(grep -E 'Unused dependency:' "$file" | wc -l)
  echo "$file - Dependências não usadas: $unused_deps" >> "$SUMMARY_FILE"
done

# Exemplo: sumarizar dependency-check
for dir in "$REPORT_DIR"/dependency-check-*; do
  echo "Resultado do OWASP Dependency-Check em $dir" >> "$SUMMARY_FILE"
  cat "$dir"/dependency-check-report.html | grep -oP '[0-9]+(?= vulnerabilities)' | head -1 >> "$SUMMARY_FILE"
done

echo "Resumo gerado em $SUMMARY_FILE"
cat "$SUMMARY_FILE"
