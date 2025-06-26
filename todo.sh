#!/bin/bash

TODO_FILE=~/todo.txt

# Create the todo file if it doesn't exist
touch "$TODO_FILE"

# Function to show the main menu
show_menu() {
  echo ""
  echo "====== TO-DO LIST MANAGER ======"
  echo "1. View all tasks"
  echo "2. Add a new task"
  echo "3. Delete a task"
  echo "4. Exit"
  echo "================================"
  echo -n "Choose an option [1-4]: "
}

# Function to view tasks
view_tasks() {
  echo ""
  echo "====== Your Tasks ======"
  if [[ ! -s "$TODO_FILE" ]]; then
    echo "No tasks found."
  else
    nl "$TODO_FILE"
  fi
}

# Function to add a new task
add_task() {
  echo -n "Enter new task: "
  read task
  echo "$task" >> "$TODO_FILE"
  echo "Task added!"
}

# Function to delete a task by number
delete_task() {
  view_tasks
  echo -n "Enter task number to delete: "
  read task_num
  if [[ $task_num =~ ^[0-9]+$ ]]; then
    sed -i "${task_num}d" "$TODO_FILE"
    echo "Task deleted."
  else
    echo "Invalid task number."
  fi
}

# Main loop that keeps the script running
while true; do
  show_menu
  read choice
  case $choice in
    1) view_tasks ;;
    2) add_task ;;
    3) delete_task ;;
    4) echo "Goodbye!"; exit 0 ;;
    *) echo "Invalid choice. Please choose 1-4." ;;
  esac
done
