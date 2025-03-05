#!/usr/bin/bash

DB_DIR="databases"
mkdir -p "$DB_DIR"

function create_database() {
    read -p "Enter database name: " db_name
    if [ -d "$DB_DIR/$db_name" ]; then
        echo "Database '$db_name' already exists!"
    else
        mkdir "$DB_DIR/$db_name"
        echo "Database '$db_name' created successfully!"
    fi
}

function show_databases() {
    db_list=$(find "$DB_DIR" -type d -printf "%f\n")

    if [ -z "$db_list" ]; then
        echo "No databases found!"
        read -p "Press Enter to return to the main menu..."
    else
        echo "Available Databases:"
        echo "$db_list"
    fi
}


function drop_database() {
    read -p "Enter database name to delete: " db_name
    if [ -d "$DB_DIR/$db_name" ]; then
        rm -rf "$DB_DIR/$db_name"
        echo "Database '$db_name' deleted successfully!"
    else
        echo "Database '$db_name' not found!"
    fi
}

function use_database() {
    read -p "Enter database name to use: " db_name
    if [ -d "$DB_DIR/$db_name" ]; then
        echo "Using database '$db_name'..."
        database_menu "$db_name"
    else
        echo "Database '$db_name' does not exist!"
    fi
}

function create_table() {
    read -p "Enter table name: " table_name
    table_path="$DB_DIR/$1/$table_name.txt"
    if [ -f "$table_path" ]; then
        echo "Table '$table_name' already exists!"
    else
        touch "$table_path"
        echo "Table '$table_name' created successfully!"
    fi
}

function alter_table() {
    read -p "Enter table name to alter: " table_name
    table_path="$DB_DIR/$1/$table_name.txt"
    if [ -f "$table_path" ]; then
        read -p "Enter column name to add: " column_name
        echo "$column_name" >> "$table_path"
        echo "Column '$column_name' added to '$table_name'."
    else
        echo "Table '$table_name' does not exist!"
    fi
}

function insert_into_table() {
    read -p "Enter table name: " table_name
    table_path="$DB_DIR/$1/$table_name.txt"
    if [ -f "$table_path" ]; then
        read -p "Enter row data (comma-separated): " row_data
        echo "$row_data" >> "$table_path"
        echo "Data inserted into '$table_name'."
    else
        echo "Table '$table_name' does not exist!"
    fi
}

function select_from_table() {
    read -p "Enter table name: " table_name
    table_path="$DB_DIR/$1/$table_name.txt"
    if [ -f "$table_path" ]; then
        cat "$table_path"
    else
        echo "Table '$table_name' does not exist!"
    fi
}

function update_table() {
    read -p "Enter table name: " table_name
    table_path="$DB_DIR/$1/$table_name.txt"
    if [ -f "$table_path" ]; then
        read -p "Enter old value to replace: " old_value
        read -p "Enter new value: " new_value
        sed -i "s/$old_value/$new_value/g" "$table_path"
        echo "Table '$table_name' updated successfully!"
    else
        echo "Table '$table_name' does not exist!"
    fi
}

function delete_from_table() {
    read -p "Enter table name: " table_name
    table_path="$DB_DIR/$1/$table_name.txt"
    if [ -f "$table_path" ]; then
        read -p "Enter value to delete: " delete_value
        sed -i "/$delete_value/d" "$table_path"
        echo "Data deleted from '$table_name'."
    else
        echo "Table '$table_name' does not exist!"
    fi
}

function drop_table() {
    read -p "Enter table name to delete: " table_name
    table_path="$DB_DIR/$1/$table_name.txt"
    if [ -f "$table_path" ]; then
        rm "$table_path"
        echo "Table '$table_name' deleted successfully!"
    else
        echo "Table '$table_name' does not exist!"
    fi
}

function database_menu() {
    local db_name="$1"
    while true; do
        echo "--------------------------------"
        echo "Using Database: $db_name"
        echo "1) Create Table"
        echo "2) Alter Table"
        echo "3) Insert into Table"
        echo "4) Select from Table"
        echo "5) Update Table"
        echo "6) Delete from Table"
        echo "7) Drop Table"
        echo "8) Back to Main Menu"
        echo "--------------------------------"
        read -p "Choose an option: " choice

        case $choice in
            1) create_table "$db_name" ;;
            2) alter_table "$db_name" ;;
            3) insert_into_table "$db_name" ;;
            4) select_from_table "$db_name" ;;
            5) update_table "$db_name" ;;
            6) delete_from_table "$db_name" ;;
            7) drop_table "$db_name" ;;
            8) break ;;
            *) echo "Invalid option!" ;;
        esac
    done
}

function main_menu() {
    while true; do
        echo "--------------------------------"
        echo "Simple Bash DBMS"
        echo "1) Create Database"
        echo "2) Show Databases"
        echo "3) Use Database"
        echo "4) Drop Database"
        echo "5) Exit"
        echo "--------------------------------"
        read -p "Choose an option: " choice

        case $choice in
            1) create_database ;;
            2) show_databases ;;
            3) use_database ;;
            4) drop_database ;;
            5) echo "Exiting..."; exit ;;
            *) echo "Invalid option!" ;;
        esac
    done
}

main_menu
