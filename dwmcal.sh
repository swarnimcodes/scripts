#!/bin/bash

current_month=$(date +%m)
current_year=$(date +%Y)

while true; do
    cal_output=$(cal $current_month $current_year)
    choice=$(echo -e "Prev Month\nNext Month\nQuit" | dmenu -i -l 10 -p "$cal_output")

    case $choice in
        "Prev Month")
            if [ $current_month -eq 1 ]; then
                current_month=12
                current_year=$((current_year - 1))
            else
                current_month=$((current_month - 1))
            fi
            ;;
        "Next Month")
            if [ $current_month -eq 12 ]; then
                current_month=1
                current_year=$((current_year + 1))
            else
                current_month=$((current_month + 1))
            fi
            ;;
        "Quit")
            break
            ;;
    esac
done
