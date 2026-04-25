FROM python:3.9-slim

ENV PYTHONDONTWRITEBYTECODE=1 \
    PYTHONUNBUFFERED=1 \
    PORT=8025 \
    DJANGO_DEBUG=True \
    DJANGO_ALLOWED_HOSTS=*

WORKDIR /app

COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

COPY docker-entrypoint.sh /app/docker-entrypoint.sh
RUN chmod +x /app/docker-entrypoint.sh

COPY babyshop_app/ .

EXPOSE 8025

CMD ["/app/docker-entrypoint.sh"]
