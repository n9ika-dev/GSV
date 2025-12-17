#!/bin/bash

# Исходное количество кадров
TOTAL_FRAMES=212

# Желаемое количество кадров
TARGET_FRAMES=20

# Тип файлов
FILE_TYPE="jpg"

STEP=$((TOTAL_FRAMES * 1000 / (TOTAL_FRAMES - TARGET_FRAMES)))
COUNT=1
FR=1000

for f in *.$FILE_TYPE; do
    MOD=$((FR % STEP))
    if [ $MOD -lt 1000 ]; then
        rm "$f"
        FR=$((FR + 1000))
    else
        mv "$f" "$COUNT.$FILE_TYPE"
        COUNT=$((COUNT + 1))
        FR=$((FR + 1000))
    fi
done

echo "Ready"
