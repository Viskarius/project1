FROM nginx:alpine

# Копируем нашу игру
COPY index.html /usr/share/nginx/html/

# Копируем кастомный конфиг nginx
COPY nginx.conf /etc/nginx/nginx.conf

# Создаем необходимые директории и устанавливаем права
RUN mkdir -p /var/cache/nginx/client_temp && \
    chown -R nginx:nginx /var/cache/nginx && \
    chmod -R 755 /var/cache/nginx

# Переключаемся на пользователя nginx
USER nginx

# Открываем порт
EXPOSE 8080

# Запускаем nginx
CMD ["nginx", "-g", "daemon off;"]
