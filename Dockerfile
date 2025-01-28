# Используем базовый образ python:3-alpine
FROM python:3-alpine

# Создаем каталог /app в контейнере и делаем его рабочим каталогом
WORKDIR /app

# Добавляем файлы веб-страницы в рабочий каталог
COPY web/index.html /app
COPY web/source /app/source

# Создаем пользователя с uid 1001 и назначаем его владельцем рабочего каталога
RUN adduser -D -u 1001 appuser && chown -R appuser /app
USER appuser

# Запускаем Python HTTP-сервер на порту 8000
CMD ["python", "-m", "http.server", "8000"]
