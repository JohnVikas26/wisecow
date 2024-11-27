#!/bin/bash

# Path to the actual web server log file or your sample log file
LOG_FILE="/home/ubuntu/wisecow/Task2/access.log"

# Number of 404 errors
echo "Number of 404 errors:"
grep " 404 " $LOG_FILE | wc -l

# Most requested pages
echo -e "\nMost Requested Pages:"
awk '{print $7}' $LOG_FILE | sort | uniq -c | sort -nr | head -n 10

# Top 10 IP addresses with the most requests
echo -e "\nTop 10 IP addresses with the most requests:"
awk '{print $1}' $LOG_FILE | sort | uniq -c | sort -nr | head -n 10

