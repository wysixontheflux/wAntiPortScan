#!/bin/sh
#Port Scan Restrictive
#Supported Systems:
supported="RHEL & Debian"

# Root Force
 if [ "$(id -u)" != "0" ]; then
         printf "${RED}⛔️ Attention droit root obligatoire ⛔️\n" 1>&2
         printf "\n"
         exit 1
 fi
    printf "${RED}⛔️ Empêcher le port scan ⛔️\n"
    printf "\n"
    printf "${WHITE}Supporte:${MAGENTA} $supported \n"
    printf "${CYAN}\n"
    echo
"-------------------------------------"
    printf "Pour continuer appuyez sur entrer...\n"
    echo "-------------------------------------"
    read -p ""
    printf "Exécution du script en cours...\n"
    printf "\n"
	
    printf "${YELLOW} Souhaitez-vous bloquer le Port Scan ? [o/N]\n"
    read reponse
if [[ "$reponse" == "o" ]]
then 
        printf "${CYAN} D'accord, les règles sont désormais actives !"
     /sbin/iptables -A INPUT   -m recent --name portscan --rcheck --seconds 86400 -j DROP
        /sbin/iptables -A FORWARD -m recent --name portscan --rcheck
--seconds 86400 -j DROP
        /sbin/iptables -A INPUT   -m recent --name portscan --remove
        /sbin/iptables -A FORWARD -m recent --name portscan --remove
fi

	printf "disable port scan activé"
echo
echo
