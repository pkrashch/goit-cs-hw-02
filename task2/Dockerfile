FROM python:3.11-slim

# Системні залежності, потрібні для збірки psycopg2 (драйвер PostgreSQL)
RUN apt-get update \
    && apt-get install -y --no-install-recommends gcc libpq-dev \
    && rm -rf /var/lib/apt/lists/*

WORKDIR /app

# requirements.txt у цьому репозиторії збережений у кодуванні UTF-16,
# тому спершу перекодовуємо його у UTF-8, інакше pip не зможе його прочитати
COPY requirements.txt .
RUN python -c "open('requirements.txt', 'w', encoding='utf-8').write(open('requirements.txt', encoding='utf-16').read())" \
    && pip install --no-cache-dir -r requirements.txt

COPY . .

EXPOSE 8000

CMD ["uvicorn", "main:app", "--host", "0.0.0.0", "--port", "8000"]
