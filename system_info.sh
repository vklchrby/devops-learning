#!/bin/bash

GREEN="\033[32m"
WHITE="\033[37m"
CYAN="\033[36m"
RESET="\033[0m"

echo -e "${CYAN}=== SYSTEM INFO ===${RESET}"
echo -e "${GREEN}Hostname:${RESET} ${WHITE}$(hostname)${RESET}"
echo -e "${GREEN}User:    ${RESET} ${WHITE}$(whoami)${RESET}"
echo -e "${GREEN}Uptime:  ${RESET} ${WHITE}$(uptime -p)${RESET}"
echo

echo -e "${CYAN}=== DISK (/ ) ===${RESET}"
df -h | grep "/$" | awk -v w="$WHITE" -v r="$RESET" '{print w $0 r}'
echo

echo -e "${CYAN}=== MEMORY ===${RESET}"
free -h | grep Mem | awk -v w="$WHITE" -v r="$RESET" '{print w $0 r}'
echo

echo -e "${CYAN}=== TOP CPU PROCESSES ===${RESET}"

ps aux --sort=-%cpu | head -4 | awk -v w="$WHITE" -v r="$RESET" '
NR==1 {
    printf w"%-10s %-7s %-5s %-5s %-8s %-8s %-6s %-5s %-7s %-7s %s"r"\n",
    $1,$2,$3,$4,$5,$6,$7,$8,$9,$10,$11
    next
}
{
    printf w"%-10s %-7s %-5s %-5s %-8s %-8s %-6s %-5s %-7s %-7s %s"r"\n",
    $1,$2,$3,$4,$5,$6,$7,$8,$9,$10,$11
}'

