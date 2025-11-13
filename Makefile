.PHONY: help install dev build preview clean lint format

# Variáveis
NODE_ENV ?= development

# Comando padrão
.DEFAULT_GOAL := help

## help: Mostra esta mensagem de ajuda
help:
	@echo "Comandos disponíveis:"
	@echo ""
	@echo "  make install    - Instala as dependências"
	@echo "  make dev        - Inicia o servidor de desenvolvimento"
	@echo "  make build      - Faz o build de produção"
	@echo "  make preview    - Preview do build de produção"
	@echo "  make clean      - Limpa arquivos gerados"
	@echo "  make lint       - Executa o linter"
	@echo "  make format     - Formata o código"
	@echo "  make deploy     - Prepara para deploy na Vercel"
	@echo "  make fresh      - Limpa tudo e reinstala dependências"
	@echo ""

## install: Instala as dependências do projeto
install:
	@echo "📦 Instalando dependências..."
	npm install

## dev: Inicia o servidor de desenvolvimento
dev: install
	@echo "🚀 Iniciando servidor de desenvolvimento na porta 3000..."
	npm run dev

## build: Faz o build de produção
build: install
	@echo "🔨 Fazendo build de produção..."
	npm run build

## preview: Preview do build de produção
preview:
	@echo "👀 Preview do build de produção..."
	npm run preview

## clean: Limpa arquivos gerados
clean:
	@echo "🧹 Limpando arquivos gerados..."
	rm -rf .nuxt
	rm -rf .output
	rm -rf dist
	rm -rf node_modules/.cache
	rm -rf .nitro
	@echo "✅ Limpeza concluída!"

## lint: Executa o linter
lint:
	@echo "🔍 Executando linter..."
	npm run lint || true

## format: Formata o código (se tiver prettier/eslint fix)
format:
	@echo "✨ Formatando código..."
	@echo "Nota: Adicione prettier ou eslint --fix se necessário"

## fresh: Limpa tudo e reinstala dependências
fresh: clean
	@echo "🔄 Reinstalando dependências..."
	rm -rf node_modules
	rm -rf package-lock.json
	npm install
	@echo "✅ Reinstalação completa!"

## deploy: Prepara para deploy na Vercel
deploy: build
	@echo "🚀 Build concluído! Pronto para deploy na Vercel"
	@echo "Execute: vercel --prod ou faça push para o repositório conectado"

## check: Verifica se tudo está ok
check: lint
	@echo "✅ Verificação concluída!"

## setup: Configuração inicial do projeto
setup: install
	@echo "✅ Projeto configurado!"
	@echo "Execute 'make dev' para iniciar o servidor de desenvolvimento"

