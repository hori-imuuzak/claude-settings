#!/bin/bash

# Claude Code notification hook script
# This script is called when certain events occur in Claude Code

# Get the event type from the first argument
EVENT_TYPE="$1"

# Function to send macOS notification
send_notification() {
    local title="$1"
    local message="$2"
    local sound="${3:-default}"
    
    # Use terminal-notifier for macOS notifications
    if command -v terminal-notifier &> /dev/null; then
        terminal-notifier -title "$title" -message "$message" -sound "$sound"
    else
        echo "Warning: terminal-notifier is not installed. Please install it with: brew install terminal-notifier" >&2
    fi
}

# Function to check if Claude is waiting for user input
check_waiting_status() {
    # Check if the output contains common patterns that indicate waiting for user input
    if echo "$CLAUDE_OUTPUT" | grep -qE "(waiting for|awaiting|please provide|please enter|what would you like|how can I help|need more information|please specify|please clarify)"; then
        return 0
    fi
    return 1
}

# Handle different event types
case "$EVENT_TYPE" in
    "task_completed")
        # Task completed successfully
        send_notification "Claude Code" "タスクが完了しました ✅" "Glass"
        ;;
    
    "task_failed")
        # Task failed
        send_notification "Claude Code" "タスクが失敗しました ❌" "Basso"
        ;;
    
    "waiting_for_input")
        # Waiting for user input
        send_notification "Claude Code" "ユーザーの入力を待っています 💭" "Pop"
        ;;
    
    "long_running_task")
        # Long running task notification
        send_notification "Claude Code" "処理を実行中です... ⏳" "Purr"
        ;;
    
    "claude_response")
        # Check if Claude is waiting for user input
        if check_waiting_status; then
            send_notification "Claude Code" "応答を待っています 💬" "Pop"
        fi
        ;;
    
    "session_started")
        # Session started
        send_notification "Claude Code" "セッションを開始しました 🚀" "Purr"
        ;;
    
    "session_ended")
        # Session ended
        send_notification "Claude Code" "セッションを終了しました 👋" "Glass"
        ;;
    
    "user_prompt")
        # User submitted a prompt
        send_notification "Claude Code" "ユーザーの入力を受信しました 💬" "Pop"
        ;;
    
    "todo_updated")
        # Todo list was updated
        send_notification "Claude Code" "TODOリストを更新しました 📝" "Tink"
        ;;
    
    *)
        # Default notification for unknown events
        if [ -n "$EVENT_TYPE" ]; then
            send_notification "Claude Code" "イベント: $EVENT_TYPE" "Ping"
        fi
        ;;
esac

# Log the event (optional - can be disabled in production)
echo "[$(date '+%Y-%m-%d %H:%M:%S')] Event: $EVENT_TYPE" >> /tmp/claude_code_events.log

# Exit successfully
exit 0