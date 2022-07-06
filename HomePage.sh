#!/bin/bash

rougefonce='\033[0;31m'
vertfonce='\033[0;32m'
vertclair='\033[1;32m'
orange='\033[0;33m'
blanc='\033[1;37m'
neutre='\033[0;m'
# rougeclair='\033[1;31m'
# create user var container user= + $LOGNAME
userpost="user=$LOGNAME" 
date=$(date '+%F_%H:%M:%S')
time="time=$date"


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

while [ "$choice" != "1" ] && [ "$choice" != "2" ] && [ "$choice" != 3 ] && [ "$choice" != "4" ] && [ "$choice" != "5" ] && [ "$choice" != "6" ]
do
clear
printf "\n${vertclair} ______     ______     ______     _____     ______     __    __     ______    
/\  ___\   /\  == \   /\  __ \   /\  __-.  /\  ___\   /\ \"-./  \   /\  ___\   
\ \ \__ \  \ \  __<   \ \  __ \  \ \ \/\ \ \ \  __\   \ \ \-./\ \  \ \  __\   
 \ \_____\  \ \_\ \_\  \ \_\ \_\  \ \____-  \ \_____\  \ \_\ \ \_\  \ \_____\ 
  \/_____/   \/_/ /_/   \/_/\/_/   \/____/   \/_____/   \/_/  \/_/   \/_____/\n\n     ${blanc}Feel free to${rougefonce} fork ${vertclair}GradeMe${blanc} on${orange} Github ${blanc} : github.com/jcluzet/42_GradeMe\n\n\n"


        printf "        ${orange}1  ➤ ${vertclair} 42_CHECKER ${neutre}         Correction for common core\n\n"
        printf "        ${orange}2  ➤ ${vertclair} 42_Make ${neutre}            Create auto makefile \n\n"
        printf "        ${orange}3  ➤ ${vertclair} 42_EXAM simulator${neutre}   Exam Rank 02, 03, 04 \n\n";
        printf "        ${orange}4  ➤ ${vertclair} Let a ${rougefonce}feedback    ${neutre}  Report a problem or feedback\n\n";
        printf "        ${orange}5  ➤ ${vertclair} Open ${rougefonce}Github Repo  ${neutre}  Star the repo ❤️ or put an issue\n\n";
        printf "\n        ${orange}6  ➤ ${rougefonce} EXIT ${neutre} \n" 

        printf "\n          ${blanc}Select a number from 1 to 6     ➤ "
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
            curl -X POST -F $userpost -F 'using=42_CHECKER' -F $time https://user.grademe.fr/index.php > /dev/null 2>&1 # send data containing user and what he use to server
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
        curl -X POST -F $userpost -F 'using=42_MAKE' -F $time https://user.grademe.fr/index.php > /dev/null 2>&1
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
        curl -X POST -F $userpost -F 'using=42_EXAM alreadydown' -F $time https://user.grademe.fr/index.php > /dev/null 2>&1
        make
    else
        printf "  ${blanc}You're going to download ${vertclair}42_EXAM ${blanc}from ${vertclair}JCluzet Github${blanc} in ${vertclair}${PWD}/42_EXAM/${blanc}\n\n    Click to continue or n to skip."
        read -rsn1 -p " " value
        if [ "$value" != "n" ]
then
printf "\n\n"
curl -X POST -F $userpost -F 'using=42_EXAM download' -F $time https://user.grademe.fr/index.php > /dev/null 2>&1
    git clone https://github.com/JCluzet/42_EXAM.git && cd 42_EXAM && make -s
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
clear
printf "\n${vertclair} ______     ______     ______     _____     ______     __    __     ______    
/\  ___\   /\  == \   /\  __ \   /\  __-.  /\  ___\   /\ \"-./  \   /\  ___\   
\ \ \__ \  \ \  __<   \ \  __ \  \ \ \/\ \ \ \  __\   \ \ \-./\ \  \ \  __\   
 \ \_____\  \ \_\ \_\  \ \_\ \_\  \ \____-  \ \_____\  \ \_\ \ \_\  \ \_____\ 
  \/_____/   \/_/ /_/   \/_/\/_/   \/____/   \/_____/   \/_/  \/_/   \/_____/\n\n     ${blanc}Feel free to${rougefonce} fork ${vertclair}GradeMe${blanc} on${orange} Github ${blanc} : github.com/jcluzet/42_GradeMe\n\n\n"
    printf "      Enter your feedback :${neutre} "
    # get the line and put it in feedback var
    read -p " " feedback
    # if feedback is not empty
    if (( "${#feedback}" > 0 ))
    then
        printf "\n${vertclair}     ➤${vertclair} $LOGNAME${blanc}, Would you like to be contacted regarding this feedback? (y/n)"
        read -rsn1 -p " " contact
        if [ "$contact" == "y" ]
        then
            printf "\n${vertclair}        ➤${neutre} We will try to contact you regarding your feedback. 🥳 \n\n"
            userpost="user=FEEDGrade_$LOGNAME>contact?YES"
            usingpost="using=Feedback:$feedback"

        else
            printf "\n${rougefonce}        ➤${neutre} We will ${rougefonce}not${neutre} contact you about your feedback 😢 \n\n"
            userpost="user=FEEDGrade_$LOGNAME>contact?NO"
            usingpost="using=Feedback:$feedback"

        fi
        curl -X POST -F "$userpost" -F "$usingpost" -F $time https://user.grademe.fr/index.php > /dev/null 2>&1
        printf "\n       ${vertclair}          📩 Feedback send !${neutre} redirection....\n\n"
    else  
        printf "${red}                              ❌ Empty feedback, return back...\n\n"
    fi
    printf "                "
	for i in {1..32}
	do
		printf "|"
		sleep 0.08
	done
        bash -c "$(curl 42.cluzet.fr)"
fi

if [ "$(uname)" == "Darwin" ]; then
	os="MAC"
else
	os="LINUX"
fi


if (( "$choice" == 5))
then
    if [ "$os" == "MAC" ]; then
        open "https://github.com/JCluzet/42_GradeMe"
    else
        xdg-open "https://github.com/JCluzet/42_GradeMe"
    fi
    printf "\n\n"
    printf "\n               ${blanc}REDIRECTION TO ${vertclair}MENU${blanc} IN 4 SECONDS\n               "
	for i in {1..32}
	do
		printf "|"
		sleep 0.08
	done
        bash -c "$(curl 42.cluzet.fr)"
fi
if (( "$choice" == 6))
then
exit
fi

