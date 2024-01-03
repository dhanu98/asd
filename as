#!/bin/bash

display_menu() {
    echo "Menu:"
    echo "1. Create User"
    echo "2. Delete User"
    echo "3. Change Group"
    echo "4. Exit"
}

create_user() {
    read -p "Enter username: " username

    # Check if the user already exists
    if id "$username" &>/dev/null; then
        echo "Error: User '$username' already exists."
    else
        useradd "$username"
        echo "User '$username' created successfully."
    fi
}

delete_user() {
    read -p "Enter username: " username

    # Check if the user exists
    if id "$username" &>/dev/null; then
        userdel "$username"
        echo "User '$username' deleted successfully."
    else
        echo "Error: User '$username' does not exist."
    fi
}

change_group() {
    read -p "Enter username: " username
    read -p "Enter new group name: " new_group

    # Check if the user exists
    if id "$username" &>/dev/null; then
        usermod -g "$new_group" "$username"
        echo "Primary group of user '$username' changed to '$new_group'."
    else
        echo "Error: User '$username' does not exist."
    fi
}

while true; do
    display_menu

    read -p "Enter your choice: " choice

    case $choice in
        1) create_user ;;
        2) delete_user ;;
        3) change_group ;;
        4) echo "Exiting the script. Goodbye!"; exit ;;
        *) echo "Invalid choice. Please enter a valid option." ;;
    esac
done
