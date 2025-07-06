FROM python:3.13.4-alpine3.22

WORKDIR /app

COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

# Copia o restante da aplicação para o diretório de trabalho
COPY . .

EXPOSE 8000

# Comando para executar a aplicação usando uvicorn
# O host 0.0.0.0 permite que a aplicação seja acessada externamente ao conteiner
CMD ["uvicorn", "app:app", "--host", "0.0.0.0", "--port", "8000", "--reload"]