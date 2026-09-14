#!/bin/bash
#
# check_websites.sh
#
# Скрипт перевіряє доступність списку вебсайтів за допомогою curl,
# опрацьовує HTTP-переадресації та записує результат перевірки
# кожного сайту (UP/DOWN) у файл логів.

# Список вебсайтів для перевірки
websites=(
    "https://google.com"
    "https://facebook.com"
    "https://twitter.com"
    "https://github.com"
    "https://a-site-that-does-not-exist-123456.com"
)

# Файл логів, куди записуються результати перевірки
log_file="website_status.log"

# Очищуємо файл логів перед новим запуском
> "$log_file"

# Перебираємо всі сайти зі списку та перевіряємо їх доступність
for site in "${websites[@]}"; do
    # -L  -> опрацьовує переадресацію (redirects)
    # -s  -> тихий режим, без прогрес-бару
    # -o /dev/null -> не виводимо тіло відповіді
    # -w "%{http_code}" -> виводимо тільки HTTP статус-код
    # --max-time 10 -> обмежуємо час очікування відповіді
    status_code=$(curl -L -s -o /dev/null -w "%{http_code}" --max-time 10 "$site")

    if [ "$status_code" -eq 200 ]; then
        result="$site is UP"
    else
        result="$site is DOWN"
    fi

    echo "$result"
    echo "$result" >> "$log_file"
done

echo ""
echo "Результати перевірки записано у файл логів: $log_file"
