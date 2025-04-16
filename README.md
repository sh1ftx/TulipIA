
# **Tulip IA**

**Tulip IA** é um projeto que integra inteligência artificial para automação de tarefas, com foco na interação com a OpenAI API. O objetivo é simplificar o uso de IA e proporcionar uma experiência prática para desenvolvedores.

![Texto alternativo](https://pin.it/fxqJWhAgJ)

## Descrição

**Tulip IA** facilita a configuração de um ambiente com integração automática à OpenAI API. O projeto conta com um script de inicialização (`init.sh`) para automatizar a instalação das dependências necessárias, tornando o setup mais eficiente.

### Funcionalidades:
- Integração com a OpenAI API.
- Instalação automatizada via script `init.sh`.
- Arquivo `knowledge_base.csv` para uso de dados no sistema.

## Requisitos

Antes de instalar, assegure-se de ter os seguintes pré-requisitos:

- **Python 3.8+** ou superior.
- **Git** instalado.
- **pip** (gerenciador de pacotes do Python).
- **Chave da API OpenAI** para utilizar os modelos de IA.

## Clonando o Repositório

1. Abra o terminal e navegue até o diretório onde deseja clonar o repositório.
2. Clone o repositório com o comando:

```bash
git clone https://github.com/sh1ftx/TulipIA.git
```

3. Entre na pasta do projeto clonado:

```bash
cd TulipIA
```

## Instalação

### Usando o Script `init.sh`

O script `init.sh` facilita a configuração do ambiente. Para usá-lo, siga os seguintes passos:

1. Dê permissão de execução ao script `init.sh`:

```bash
chmod +x init.sh
```

2. Execute o script para configurar o ambiente e instalar as dependências:

```bash
./init.sh
```

### O que o Script `init.sh` Faz

- **Cria e ativa o ambiente virtual**: O ambiente isolado impede conflitos com outras instalações do sistema.
- **Instala as dependências**: Usa o `pip` para instalar as dependências definidas no arquivo `requirements.txt`.
- **Configuração do arquivo `.env`**: Solicita a chave da API do OpenAI para garantir a integração com a IA.

## Executando o Projeto

Após a instalação, o projeto estará pronto para ser executado. Para rodar o sistema, use o comando:

```bash
python src/tulip.py
```

Isso iniciará o projeto, permitindo a interação com a IA conforme a lógica do sistema.

## Estrutura de Diretórios

A estrutura de diretórios do **Tulip IA** é a seguinte:

```
Tulip-IA/
│
├── init.sh                 # Script de configuração e instalação.
├── README.md               # Documentação do projeto.
├── src/                    # Código-fonte do projeto.
│   ├── knowledge_base.csv  # Base de conhecimento usada no sistema.
│   └── tulip.py            # Arquivo principal para execução do sistema.
└── requirements.txt        # Dependências do projeto.
```

## Contribuindo

1. Faça um fork do projeto.
2. Crie uma branch para sua feature (`git checkout -b minha-feature`).
3. Faça commit das suas alterações (`git commit -am 'Adiciona nova feature'`).
4. Faça push para sua branch (`git push origin minha-feature`).
5. Abra um pull request.

## Licença

Este projeto está licenciado sob a [Licença MIT](LICENSE).

