#!/bin/bash

rougefonce='\033[0;31m'
vertfonce='\033[0;32m'
vertclair='\033[1;32m'
orange='\033[0;33m'
blanc='\033[1;37m'
neutre='\033[0;m'
clear

output=$(echo -e "test")
if [[ $output == "test" ]]
then
    clear
else
    clear
    printf "${rougefonce}ERROR :${neutre} Please launch this script with bash. ${vertclair} \n\nTry : ${neutre}bash -c \$(\"curl -L grademe.fr\")\n\n"
    exit 1
fi

#  bash -c "$(curl 42.cluzet.fr/check)"
# exit 0

printf "\n${vertclair} ______     ______     ______     _____     ______     __    __     ______    
/\  ___\   /\  == \   /\  __ \   /\  __-.  /\  ___\   /\ \"-./  \   /\  ___\   
\ \ \__ \  \ \  __<   \ \  __ \  \ \ \/\ \ \ \  __\   \ \ \-./\ \  \ \  __\   
 \ \_____\  \ \_\ \_\  \ \_\ \_\  \ \____-  \ \_____\  \ \_\ \ \_\  \ \_____\ 
  \/_____/   \/_/ /_/   \/_/\/_/   \/____/   \/_____/   \/_/  \/_/   \/_____/\n\n     ${blanc}Feel free to${rougefonce} fork ${vertclair}GradeMe${blanc} on${orange} Github ${blanc} : github.com/jcluzet/42_GradeMe\n\n\n"


        printf "        ${orange}1  ➤ ${vertclair} 42_CHECKER AUTO ${neutre} \n\n"
        printf "        ${orange}2  ➤ ${vertclair} 42_Make ${neutre}(create a auto makefile) \n\n"
        printf "        ${orange}3  ➤ ${vertclair} 42_EXAM simulator ${neutre} Exam Rank 02, 03, 04, 05\n\n";
        printf "\n        ${orange}4  ➤ ${rougefonce} EXIT ${neutre} \n" 
        # if user is in Desktop folder

        printf "\n           ${blanc}Selection     ➤ "
read -r -p " " choice
printf "\n\n"
while [ "$choice" != "1" ] && [ "$choice" != "2" ] && [ "$choice" != 3 ] && [ "$choice" != "4" ]
do
clear
printf "\n${vertclair} ______     ______     ______     _____     ______     __    __     ______    
/\  ___\   /\  == \   /\  __ \   /\  __-.  /\  ___\   /\ \"-./  \   /\  ___\   
\ \ \__ \  \ \  __<   \ \  __ \  \ \ \/\ \ \ \  __\   \ \ \-./\ \  \ \  __\   
 \ \_____\  \ \_\ \_\  \ \_\ \_\  \ \____-  \ \_____\  \ \_\ \ \_\  \ \_____\ 
  \/_____/   \/_/ /_/   \/_/\/_/   \/____/   \/_____/   \/_/  \/_/   \/_____/\n\n     ${blanc}Feel free to${rougefonce} fork ${vertclair}GradeMe${blanc} on${orange} Github ${blanc} : github.com/jcluzet/42_GradeMe\n\n\n"


        printf "        ${orange}1     ➤ ${vertclair} 42_CHECKER AUTO ${neutre} \n\n"
        printf "        ${orange}2     ➤ ${vertclair} 42_Make ${neutre}(create a auto makefile) \n\n"
        printf "        ${orange}3     ➤ ${vertclair} 42_EXAM simulator${neutre} Exam Rank 02, 03, 04 \n\n";
        printf "\n        ${orange}4     ➤ ${rougefonce} EXIT ${neutre} \n" 

        printf "\n          ${blanc}Select a number from 1 to 4     ➤ "
read -rsn1 -p " " choice
done
if (( "$choice" == 1 ))
then
        if [[ $PWD == *"/Desktop" ]]
        then
            printf "\n\n ${rougefonce}         ! Warning: ${blanc}You're in ~/Desktop folder.\n            42_CHECKER work only in repo folder.\n\n"
            printf "\n\n               ${blanc}REDIRECTION TO ${vertclair}MENU${blanc} IN 4 SECONDS\n               "
	for i in {1..32}
	do
		printf "|"
		sleep 0.08
	done
	bash -c "$(curl 42.cluzet.fr)"
	exit 0
        else
            bash -c "$(curl 42.cluzet.fr/check)"
        fi
fi
if (( "$choice" == 2))
then
        if [[ $PWD == *"/Desktop" ]]
        then
            printf "\n\n ${rougefonce}         ! Warning: ${blanc}You're in ~/Desktop folder.\n            42_CHECKER work only in repo folder.\n\n"
            printf "\n\n               ${blanc}REDIRECTION TO ${vertclair}MENU${blanc} IN 4 SECONDS\n               "
	for i in {1..32}
	do
		printf "|"
		sleep 0.08
	done
	bash -c "$(curl 42.cluzet.fr)"
	exit 0
        else
    bash -c "$(curl 42.cluzet.fr/make)"
    fi
fi
if (( "$choice" == 3))
then
clear
printf "\n${vertclair} ______     ______     ______     _____     ______     __    __     ______    
/\  ___\   /\  == \   /\  __ \   /\  __-.  /\  ___\   /\ \"-./  \   /\  ___\   
\ \ \__ \  \ \  __<   \ \  __ \  \ \ \/\ \ \ \  __\   \ \ \-./\ \  \ \  __\   
 \ \_____\  \ \_\ \_\  \ \_\ \_\  \ \____-  \ \_____\  \ \_\ \ \_\  \ \_____\ 
  \/_____/   \/_/ /_/   \/_/\/_/   \/____/   \/_____/   \/_/  \/_/   \/_____/\n\n\n"
# if folder 42_EXAM exist
    if [ -d 42_EXAM ]
    then
        printf "42_EXAM ${blanc}already download\n\nLaunch and check update... "
        cd 42_EXAM
        sleep 1
        make
    else
        printf "  ${blanc}You're going to download ${vertclair}42_EXAM ${blanc}from ${vertclair}JCluzet Github${blanc} in ${vertclair}${PWD}/42_EXAM/${blanc}\n\n    Click to continue or n to skip."
        read -rsn1 -p " " value
        if [ "$value" != "n" ]
then
printf "\n\n"
    git clone https://github.com/JCluzet/42_EXAM.git && cd 42_EXAM && make
    else
    printf "\n\n\n"
	printf "\n               ${blanc}REDIRECTION TO ${vertclair}MENU${blanc} IN 4 SECONDS\n               "
	for i in {1..32}
	do
		printf "|"
		sleep 0.08
	done
	bash -c "$(curl 42.cluzet.fr)"
	exit 0
    
        fi
    fi
fi
if (( "$choice" == 4))
then
    exit
fi
