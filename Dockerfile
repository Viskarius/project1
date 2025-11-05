# Используем легкий nginx образ
FROM nginx:alpine

# Устанавливаем рабочую директорию
WORKDIR /usr/share/nginx/html

# Копируем нашу игру
COPY index.html .

# Копируем конфиг nginx
COPY nginx.conf /etc/nginx/nginx.conf

# Создаем не-root пользователя для безопасности
RUN chown -R nginx:nginx /usr/share/nginx/html && \
    chmod -R 755 /usr/share/nginx/html

# Переключаемся на не-root пользователя
USER nginx

# Открываем порт
EXPOSE 8080

# Запускаем nginx
CMD ["nginx", "-g", "daemon off;"]
