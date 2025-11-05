FROM nginx:alpine

# Копируем нашу игру
COPY index.html /usr/share/nginx/html/

# Копируем кастомный конфиг nginx
COPY nginx.conf /etc/nginx/nginx.conf

# Переключаемся на пользователя nginx
USER nginx

# Открываем порт
EXPOSE 8080

# Запускаем nginx
CMD ["nginx", "-g", "daemon off;"]
