#!/bin/bash

# Exit immediately if a command exits with a non-zero status
set -e

# Maximum number of retries
MAX_RETRIES=3
RETRY_DELAY=3  # seconds to wait between retries
COUNT=0

echo "=== Checking if Docker is installed ==="
if ! command -v docker &> /dev/null
then
    echo "❌ Docker is not installed or not running!"
    exit 1
fi

echo "=== Checking for .env file ==="
if [ ! -f ".env" ]; then
    echo "📄 .env not found, copying from .env.example"
    cp .env.example .env
fi

echo "=== Running docker compose up -d --build with up to $MAX_RETRIES retries ==="

until [ $COUNT -ge $MAX_RETRIES ]
do
    if docker compose up -d --build; then
        echo "✅ Docker Compose started successfully!"
        exit 0
    else
        COUNT=$((COUNT+1))
        echo "⚠️ Failed to run docker compose (attempt $COUNT/$MAX_RETRIES)"
        if [ $COUNT -lt $MAX_RETRIES ]; then
            echo "⏳ Retrying in $RETRY_DELAY seconds..."
            sleep $RETRY_DELAY
        fi
    fi
done

echo "❌ Failed after $MAX_RETRIES attempts. Exiting."
exit 1
