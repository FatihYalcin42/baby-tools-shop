FROM python:3.9-slim

ENV PYTHONDONTWRITEBYTECODE=1 \
    PYTHONUNBUFFERED=1 \
    PORT=8025 \
    DJANGO_DEBUG=True \
    DJANGO_ALLOWED_HOSTS=*

WORKDIR /app

COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

COPY babyshop_app/ .

EXPOSE 8025

CMD ["sh", "-c", "python manage.py migrate && python manage.py runserver 0.0.0.0:${PORT}"]
