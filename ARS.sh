#!/bin/bash
# Project name: ARS - Always Running Services
# Version: 1.0
# Written by: KsrvcO
# Tested on: Debian based servers
# Video demo: https://www.aparat.com/v/eHSWU
# Contact me: flower.k2000@gmail.com
reset
echo -e "

──────────────────────────────────────────────────
─██████████████─████████████████───██████████████─
─██░░░░░░░░░░██─██░░░░░░░░░░░░██───██░░░░░░░░░░██─
─██░░██████░░██─██░░████████░░██───██░░██████████─
─██░░██──██░░██─██░░██────██░░██───██░░██─────────
─██░░██████░░██─██░░████████░░██───██░░██████████─
─██░░░░░░░░░░██─██░░░░░░░░░░░░██───██░░░░░░░░░░██─
─██░░██████░░██─██░░██████░░████───██████████░░██─
─██░░██──██░░██─██░░██──██░░██─────────────██░░██─
─██░░██──██░░██─██░░██──██░░██████─██████████░░██─
─██░░██──██░░██─██░░██──██░░░░░░██─██░░░░░░░░░░██─
─██████──██████─██████──██████████─██████████████─
──────────────────────────────────────────────────
                                         by KsrvcO
Tool name: ARS - Always Running Services
Written by: KsrvcO
Version: 1.0
Contact me: flower.k2000@gmail.com
Tested on Debian based servers

"
echo -e "[+] Please wait for some seconds to start...\n"
sleep 10
mkdir -p /tmp/ARS
echo -e "[+] Get running services on this server...\n"
service --status-all | grep "+" | cut -d "]" -f2 | sort -u | sed 's/^..//' > /tmp/ARS/running.txt
echo -e "[+] Monitoring and ARS started now...\n"
while (true); do
	for i in $(cat /tmp/ARS/running.txt); do
		service=$(ps -A | grep -w $i)
		if ! [ -n "$service" ]
		then
    		service $i start
		fi
	done
done

