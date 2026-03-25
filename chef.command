#!/bin/bash

# Chef App Launcher - Double-click to run the app
# This runs both the frontend and Convex backend in separate tabs

cd "$(dirname "$0")"

# Open two tabs in Terminal - one for Convex, one for frontend
osascript -e '
    tell application "Terminal"
        activate
        -- First tab: Convex backend
        do script "cd \"'$(pwd)'\" && npx convex dev"

        -- Second tab: Frontend
        do script "cd \"'$(pwd)'\" && pnpm dev"
    end tell
' 2>/dev/null || (
    # Fallback if osascript fails
    echo "Starting Convex backend in background..."
    npx convex dev &
    echo "Starting frontend..."
    pnpm dev
)