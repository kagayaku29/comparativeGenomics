#!/bin/bash

input="scaffolds_info_sample.txt"
output="karyotype.txt"

# Цвета для разных скаффолдов
colors=(green blue red purple orange cyan)

# Очищаем файл кариотипа, если он уже существует
> "$output"

# Счётчик для цвета
color_index=0

while IFS=$'\t' read -r scaffold length; do
    # Выбираем цвет для каждого скаффолда, циклически используя массив colors
    color=${colors[$color_index]}
    echo "chr - $scaffold $scaffold 0 $length $color" >> "$output"

    # Переходим к следующему цвету в массиве
    color_index=$(( (color_index + 1) % ${#colors[@]} ))
done < "$input"

echo "Файл кариотипа создан: $output"
