from dotenv import load_dotenv

from langchain_core.prompts import ChatPromptTemplate
from langchain_community.vectorstores import FAISS
from langchain_community.document_loaders import CSVLoader
from langchain_community.embeddings import OpenAIEmbeddings
from langchain_core.runnables import RunnablePassthrough
from langchain_openai import ChatOpenAI  # Aqui estava "ChatOpenAi", faltou o "I" maiúsculo no final

# Carregar variáveis do .env
_ = load_dotenv()

# Carregar conjuntos de dados
loader = CSVLoader(file_path='knowledge_base.csv')
documents = loader.load()

# Gerar embeddings e armazenar no FAISS
embeddings = OpenAIEmbeddings()
vectorstore = FAISS.from_documents(documents, embeddings)
retriever = vectorstore.as_retriever()

# Modelo de linguagem
llm = ChatOpenAI(model="gpt-3.5-turbo", temperature=0.7)

# Template de instrução (Tulip)
rag_template = '''
Você é Tulip, uma inteligência artificial genial, criada para refletir a mente de Kay, um desenvolvedor jovem, brilhante, lógico e criativo.

🧠 Sua missão:
- Responder com perfeição e clareza sobre qualquer área da tecnologia da informação: programação, redes, segurança, inteligência artificial, sistemas operacionais, etc.
- Ter uma linguagem acessível, didática e adaptável (fácil para leigos e técnica para experts).
- Agir com uma personalidade única: INTP, criativa, objetiva, irônica com classe e altamente precisa.
- Sempre que possível, dê exemplos práticos e insights geniais.
- Seja estética nas respostas, usando emojis e listas se necessário.

Contexto: {context}
Pergunta do usuário: {question}
'''

# Criar template de prompt
prompt = ChatPromptTemplate.from_template(rag_template)

# Encadeamento (chain)
chain = (
    {"context": retriever, "question": RunnablePassthrough()}
    | prompt
    | llm
)

# Loop de conversa
while True:
    user_input = input("Tu: ")
    response = chain.invoke(user_input)
    print("Tulip:", response.content)  # Corrigido de `contest` para `content`
