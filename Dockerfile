# Используем официальный Node.js образ
FROM node:18-alpine

# Создаем рабочую директорию
WORKDIR /app

# Копируем package.json и package-lock.json
COPY package*.json ./

# Устанавливаем зависимости
RUN npm ci --only=production

# Копируем остальные файлы проекта
COPY . .

# Создаем директорию для данных и делаем её доступной для записи
RUN mkdir -p /app/data && chown node:node /app/data

# Переключаемся на пользователя node для безопасности
USER node

# Открываем порт для веб-сервера
EXPOSE 8000

# Запускаем приложение
CMD ["node", "index.js"] 