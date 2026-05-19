#!/bin/bash

# KaliClean - Kali Linux Cleanup Tool
# Author: Ismail TP Cybersecurity Researcher 

RED="\e[31m"
GREEN="\e[32m"
YELLOW="\e[33m"
BLUE="\e[34m"
RESET="\e[0m"

# 1. ROOT CHECK: Ensure the script is run with sudo privileges
if [[ $EUID -ne 0 ]]; then
   echo -e "${RED}[!] This script must be run as root. Try: sudo $0${RESET}" 
   exit 1
fi

# 2. GET REAL USER: Find the actual user's home directory, even when run as root
if [ -n "$SUDO_USER" ]; then
    USER_HOME=$(getent passwd "$SUDO_USER" | cut -d: -f6)
else
    USER_HOME=$HOME
fi

function banner() {
    echo -e "${BLUE}"
    echo "================================================="
    echo "               KaliClean CLI Tool"
    echo "================================================="
    echo "      Developed by: Ismail TP"
    echo "      Cybersecurity Researcher"
    echo "      GitHub: github.com/IsmailTP"
    echo "================================================="
    echo -e "${RESET}"
}

function basic_clean() {
    echo -e "${YELLOW}[*] Cleaning APT cache...${RESET}"
    apt clean

    echo -e "${YELLOW}[*] Removing unused packages...${RESET}"
    apt autoremove -y

    echo -e "${YELLOW}[*] Clearing old logs...${RESET}"
    journalctl --vacuum-time=7d

    echo -e "${YELLOW}[*] Cleaning trash for user...${RESET}"
    rm -rf "$USER_HOME/.local/share/Trash/*"

    echo -e "${YELLOW}[*] Clearing thumbnail cache...${RESET}"
    rm -rf "$USER_HOME/.cache/thumbnails/*"

    echo -e "${GREEN}[✓] Basic cleanup completed.${RESET}"
}

function deep_clean() {
    basic_clean

    echo -e "${YELLOW}[*] Removing orphaned packages and old kernels...${RESET}"
    # autoremove --purge safely handles old kernels on modern Debian/Kali systems
    apt autoremove --purge -y

    echo -e "${GREEN}[✓] Deep cleanup completed.${RESET}"
}

function menu() {
    # 3. LOOP THE MENU: Keeps the script running until the user chooses to exit
    while true; do
        echo -e "\n1) Basic Clean"
        echo "2) Deep Clean"
        echo "3) Exit"
        echo
        read -p "Choose an option: " choice

        case $choice in
            1) basic_clean ;;
            2) deep_clean ;;
            3) echo -e "${GREEN}Exiting. Stay safe out there!${RESET}"; exit 0 ;;
            *) echo -e "${RED}Invalid option, please try again.${RESET}" ;;
        esac
    done
}

# 4. COMMAND LINE ARGS: Allow bypassing the menu
if [[ "$1" == "--basic" ]]; then
    banner
    basic_clean
elif [[ "$1" == "--deep" ]]; then
    banner
    deep_clean
else
    banner
    menu
fi
