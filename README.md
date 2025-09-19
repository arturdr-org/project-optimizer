# Project Optimizer

Automatiza instalação e execução de ferramentas para melhorar segurança, performance e qualidade do seu projeto.

## Como usar

1. Clone este repositório
2. Execute `./scripts/install_all.sh`
3. Configure seu projeto para usar as ferramentas locais/globalmente
4. Execute `./scripts/run_checks.sh` para rodar auditorias e análises
5. Verifique os relatórios e análises gerados
6. Configure workflows GitHub Actions via `workflows/dependency-scan.yml`

## Ferramentas incluídas

- OWASP Dependency-Check (audit de vulnerabilidades)
- knip (análise dependências não usadas)
- npm audit (vulnerabilidades npm)
- PM2 (gestão e performance de processos)
- Clinic.js (profiling de performance)
- GitHub CodeQL (análise estática de segurança)
- Webpack (bundling e otimização)

---