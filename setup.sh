#!/bin/bash

# Обновление индекса пакетов
sudo apt update

# Установка необходимых пакетов
sudo apt install -y apt-transport-https ca-certificates curl software-properties-common

# Добавление официального ключа GPG Docker
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -

# Добавление репозитория Docker в список источников APT
sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable"

# Обновление индекса пакетов и установка Docker
sudo apt update
sudo apt install -y docker-ce

# Установка Docker Compose
sudo curl -L "https://github.com/docker/compose/releases/download/v2.26.1/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose

# Сделать исполняемым бинарный файл Docker Compose
sudo chmod +x /usr/local/bin/docker-compose

# Включение ufw и открытие необходимых портов
sudo ufw allow 22    # Разрешить SSH
sudo ufw allow 80    # Разрешить HTTP
sudo ufw allow 443   # Разрешить HTTPS
echo "y" | sudo ufw enable

# Создание директории docker и файла docker-compose.yml
mkdir -p docker
cd docker
nano docker-compose.yml
