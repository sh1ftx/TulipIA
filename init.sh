#!/bin/bash

echo "🌱 Iniciando a configuração do ambiente para Tulip..."

# Função auxiliar para exibir mensagens coloridas
info() { echo -e "\033[1;34m[INFO]\033[0m $1"; }
success() { echo -e "\033[1;32m[SUCCESS]\033[0m $1"; }
error() { echo -e "\033[1;31m[ERROR]\033[0m $1"; }

# Verificar se Python está instalado
if ! command -v python3 &>/dev/null; then
    error "Python3 não encontrado. Por favor, instale o Python 3 antes de continuar."
    exit 1
fi

# Verificar se pip está instalado
if ! command -v pip &>/dev/null && ! command -v pip3 &>/dev/null; then
    error "pip não encontrado. Por favor, instale o pip (geralmente 'python3 -m ensurepip --upgrade')"
    exit 1
fi

# Criar ambiente virtual
info "Criando ambiente virtual 'venv'..."
python3 -m venv venv

# Ativar ambiente virtual dependendo do sistema
OS="$(uname -s)"
case "$OS" in
    Linux*|Darwin*)
        source venv/bin/activate
        ;;
    MINGW*|MSYS*|CYGWIN*)
        source venv/Scripts/activate
        ;;
    *)
        error "Sistema operacional não suportado: $OS"
        exit 1
        ;;
esac

success "Ambiente virtual ativado!"

# Atualizar pip
info "Atualizando pip..."
pip install --upgrade pip

# Instalar pacotes necessários
info "Instalando bibliotecas com pip..."
pip install \
    python-dotenv \
    langchain \
    langchain-core \
    langchain-community \
    langchain-openai \
    faiss-cpu \
    openai \
    tiktoken

# Criar arquivo .env se não existir
if [ ! -f .env ]; then
    info "Criando arquivo .env de exemplo..."
    echo 'OPENAI_API_KEY=coloque_sua_chave_aqui' > .env
    success "Arquivo .env criado! Edite-o com sua API Key da OpenAI."
else
    info ".env já existe, pulando criação."
fi

success "Tulip está pronta para florescer! 🌸"
echo "Para iniciar, execute: source venv/bin/activate && python oracle.py"
