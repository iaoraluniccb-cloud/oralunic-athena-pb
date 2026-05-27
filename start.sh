#!/bin/sh
set -e

PB_DIR=/pb/pb_data
PB_BIN=/pb/pocketbase

# Cria superusuário admin na primeira inicialização
echo "Criando superusuário..."
$PB_BIN superuser upsert "${PB_ADMIN_EMAIL:-thais@oralunic.com.br}" "${PB_ADMIN_PASSWORD:-ximia123}" --dir="$PB_DIR" 2>/dev/null || true

echo "Iniciando servidor PocketBase..."
exec $PB_BIN serve --http="0.0.0.0:8080" --dir="$PB_DIR"
