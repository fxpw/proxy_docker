FROM ubuntu:20.04

# Установка Squid и утилиты для аутентификации
ENV TZ=Europe/Minsk
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone
RUN apt-get update && \
    apt-get install -y squid apache2-utils
RUN rm -rf /var/lib/apt/lists/* 

# Копируем конфигурационный файл и файл паролей
COPY squid.conf /etc/squid/squid.conf
COPY passwords.txt /etc/squid/passwords.txt

# Открываем порт
EXPOSE 3128

# Запускаем Squid
CMD ["squid", "-N"]
