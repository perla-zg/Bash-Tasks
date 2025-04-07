#!/bin/bash

# Script for Linux that generates report file with the following information:
# Current date and time
# Name of current user
# Internal IP address and hostname
# External IP address
# Name and version of Linux distribution
# System uptime
# Information about used and free space in / in GB
# Information about total and free RAM
# Number and frequency of CPU cores

# script - start

# current time and date
echo "Current time and date: $(date)" > Report.txt

# current user
echo "Current user: $(whoami)" >> Report.txt

# Internal IP address and hostname
echo "Internal IP: $(hostname -I)" >> Report.txt
echo "Hostname: $(hostname)" >> Report.txt

# External IP address
echo "External IP: $(curl -s ifconfig.me)" >> Report.txt

# Name and version of linux distribution
echo "Linux Distribution: $(grep -w 'NAME' /etc/os-release | awk -F= '{print $2}'| sed 's/"//g')" >> Report.txt
echo "Version: $(grep -w 'VERSION' /etc/os-release | awk -F= '{print $2}' | sed 's/"//g')" >> Report.txt

# System uptime
echo "System uptime: $(uptime | awk -F "up" '{print $2}' | cut -d',' -f1)" >> Report.txt

# Used/Free space in / in GB
echo "Used space in /: $(df -BG | grep -w "/" | awk -F " " '{print $3}')" >> Report.txt
echo "Free space in /: $(df -BG | grep -w "/" | awk -F " " '{print $4}')" >> Report.txt

# Total/free RAM
echo "Total RAM: $(free -h | grep -e "Mem:" | awk -F " " '{print $2}')" >> Report.txt
echo "Free RAM: $(free -h | grep -e "Mem:" | awk -F " " '{print $4}')" >> Report.txt

# External IP address
echo "External IP: $(curl -s ifconfig.me)" >> Report.txt

# Name and version of linux distribution
echo "Linux Distribution: $(grep -w 'NAME' /etc/os-release | awk -F= '{print $2}'| sed 's/"//g')" >> Report.txt
echo "Version: $(grep -w 'VERSION' /etc/os-release | awk -F= '{print $2}' | sed 's/"//g')" >> Report.txt

# System uptime
echo "System uptime: $(uptime | awk -F "up" '{print $2}' | cut -d',' -f1)" >> Report.txt

# Used/Free space in / in GB
echo "Used space in /: $(df -BG | grep -w "/" | awk -F " " '{print $3}')" >> Report.txt
echo "Free space in /: $(df -BG | grep -w "/" | awk -F " " '{print $4}')" >> Report.txt

# Number and frequency of CPU cores
echo "CPU(s): $(lscpu | grep -E "^CPU\(s\)" | awk -F " " '{print $2}')" >> Report.txt
echo "Frequency of CPU cores: $(lscpu | grep "CPU MHz" | awk '{print $3}') MHz" >> Report.txt

# script - end
