# goit-cs-hw-02 Bash-скрипт перевірки сайтів + FastAPI в Docker
## Завдання 1 — task1/check_websites.sh

Bash-скрипт перевіряє список сайтів через curl (з опрацюванням переадресацій), виводить статус кожного (UP/DOWN) і записує результати у файл логів website_status.log.

Запуск:

cd task1
./check_websites.sh
## Завдання 2 — Computer-Systems-hw02

FastAPI-застосунок, запакований у Docker + PostgreSQL через docker-compose.

Запуск:

cd Computer-Systems-hw02
docker-compose up --build

Після старту:

застосунок доступний на http://localhost:8000
кнопка "Перевірити БД" на сторінці перевіряє підключення до PostgreSQL

У conf/db.py рядок підключення налаштований на ім'я сервіса db з docker-compose.yaml (не localhost).