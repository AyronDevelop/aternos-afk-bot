# Minecraft AFK Bot

AFK бот для серверов Minecraft с веб-интерфейсом и автоматическими функциями.

## Функции

- 🤖 Автоматическое подключение к серверу
- 🔄 Анти-AFK система (движения персонажа)
- 💬 Автоматические сообщения в чат
- 🔐 Автоматическая авторизация
- 📍 Перемещение в заданную позицию
- 🌐 Веб-интерфейс на порту 30000
- 🔄 Автоматическое переподключение при разрыве связи

## Запуск через Docker

### Быстрый запуск

1. **Настройте конфигурацию** в файле `settings.json`:
   ```json
   {
     "bot-account": {
       "username": "YourUsername",
       "password": "YourPassword",
       "type": "mojang"
     },
     "server": {
       "ip": "your-server.com",
       "port": 25565,
       "version": "1.12.1"
     }
   }
   ```

2. **Запустите с помощью Docker Compose**:
   ```bash
   docker-compose up -d
   ```

3. **Проверьте статус**:
   ```bash
   docker-compose logs -f
   ```

4. **Откройте веб-интерфейс**: http://localhost:30000

### Остановка бота

```bash
docker-compose down
```

### Обновление

```bash
docker-compose down
docker-compose build --no-cache
docker-compose up -d
```

## Запуск через Docker (без compose)

```bash
# Сборка образа
docker build -t minecraft-afk-bot .

# Запуск контейнера
docker run -d \
  --name minecraft-afk-bot \
  -p 30000:8000 \
  -v $(pwd)/settings.json:/app/settings.json:ro \
  -v $(pwd)/launcher_accounts.json:/app/launcher_accounts.json:ro \
  minecraft-afk-bot
```

## Настройка

### Основные параметры в `settings.json`:

- `bot-account`: Данные аккаунта Minecraft
- `server`: Настройки сервера (IP, порт, версия)
- `anti-afk`: Включение анти-AFK движений
- `chat-messages`: Автоматические сообщения в чат
- `auto-auth`: Автоматическая регистрация/авторизация
- `position`: Перемещение в заданную точку

### Аккаунты Minecraft в `launcher_accounts.json`:

Файл для хранения данных аккаунтов лаунчера (если используется).

## Логи

Просмотр логов в реальном времени:
```bash
docker-compose logs -f minecraft-afk-bot
```

## Устранение неполадок

1. **Проблемы с подключением**: Проверьте настройки сервера в `settings.json`
2. **Ошибки авторизации**: Убедитесь в правильности данных аккаунта
3. **Бот не отвечает**: Проверьте логи с помощью `docker-compose logs`

## Безопасность

- Контейнер запускается от имени непривилегированного пользователя
- Конфигурационные файлы монтируются в режиме только для чтения
- Порт 30000 открыт только для веб-интерфейса

## Лицензия

MIT License 