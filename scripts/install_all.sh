#!/bin/bash
set -e

echo "Instalando ferramentas globais essenciais..."

# PM2
npm install -g pm2

# depcheck ou knip (preferível knip)
npm install -g knip

# Clinic.js
npm install -g clinic

# OWASP Dependency Check (manual)
if [ ! -d "dependency-check" ]; then
  echo "Baixando OWASP Dependency-Check..."
  rm -f dependency-check.zip # Ensure clean download
  curl -Ls "https://github.com/jeremylong/DependencyCheck/releases/download/v9.0.9/dependency-check-9.0.9-release.zip" -o dependency-check.zip
  if [ $? -ne 0 ]; then
    echo "Erro: Falha ao baixar dependency-check.zip" >&2
    exit 1
  fi
  rm -rf dependency-check # Ensure clean extraction
  unzip dependency-check.zip -d dependency-check
  rm dependency-check.zip
fi

# Instalação OpenJDK 17 e configuração JAVA_HOME
echo "Instalando OpenJDK 17 (Java Runtime) e configurando JAVA_HOME..."

sudo apt-get update # Ensure package lists are updated
if ! sudo apt-get install -y openjdk-17-jdk < /dev/null; then # Redirect stdin
  echo "openjdk-17-jdk not found, trying default-jdk..." >&2
  sudo apt-get install -y default-jdk < /dev/null # Redirect stdin
fi

# Encontra o caminho do Java instalado para configurar JAVA_HOME
JAVA_PATH=$(dirname $(dirname $(readlink -f $(which javac))))

# Adiciona configuração no ~/.bashrc se ainda não existir
if ! grep -q "export JAVA_HOME=" ~/.bashrc; then
  echo "export JAVA_HOME=\"$JAVA_PATH\"" >> ~/.bashrc
  echo 'export PATH=$PATH:$JAVA_HOME/bin' >> ~/.bashrc
  echo "JAVA_HOME configurado em ~/.bashrc como $JAVA_PATH"
else
  echo "JAVA_HOME já configurado no ~/.bashrc"
fi

echo "Para aplicar as alterações execute: source ~/.bashrc"

echo "Pacotes globais instalados. Instale localmente no projeto Fastify, Prisma, Redis etc. usando npm."

echo "Instalação concluída."