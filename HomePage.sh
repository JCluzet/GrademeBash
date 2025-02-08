#!/bin/bash

spin[0]="⠁"
spin[1]="⠃"
spin[2]="⠇"
spin[3]="⠧"
spin[4]="⠷"
spin[5]="⠿"
spin[6]="⠷"
spin[7]="⠧"
spin[8]="⠇"

# rm -rf 42-EXAM
spin[9]="⠃"

MANGENTA="\033[35m"
BOLD="\033[1m"
CLEAR_LINE="\033[2K"
LINE_UP="\033[1A"
RED="\033[31m"
WHITE="\033[37m"
GRAY="\033[90m"
BLUE="\033[34m"
GREEN="\033[32m"
RESET="\033[0m"
rougefonce='\033[0;31m'
vertfonce='\033[0;32m'
vertclair='\033[1;32m'
orange='\033[0;33m'
blanc='\033[1;37m'
magenta='\033[0;35m'
neutre='\033[0;m'
userpost="user=$LOGNAME"
date=$(date '+%F_%H:%M:%S')
time="time=$date"
vip=0
ban=0

viplist=$(curl -s https://user.grademe.fr/vip_list 2>&1 )
banlist=$(curl -s https://user.grademe.fr/ban_list 2>&1 )
for line in $viplist; do
    # if LOGNAME = line
    if [ "$line" == $LOGNAME ]; then
        vip=1
    fi
done
for line in $banlist; do
    # if LOGNAME = line
    if [ "$line" == $LOGNAME ]; then
        ban=1
    fi
done

if [ $ban -eq 1 ]; then
    clear
    echo -e "${blanc}Due to multiple violations of our Community Guidelines,${rougefonce} you're temporarily blocked from using Grademe${neutre}"
    exit
fi

laststar=$(curl -s https://user.grademe.fr/star.txt | tail -n 1 2>&1)

clear

output=$(echo -e "test")
if [[ $output == "test" ]]; then
    clear
else
    clear
    printf "${rougefonce}ERROR :${neutre} Please launch this script with bash. ${vertclair} \n\nTry : ${neutre}bash -c \$(\"curl https://grademe.fr\")\n\n"
    exit 1
fi

while [ "$choice" != "1" ] && [ "$choice" != "2" ] && [ "$choice" != 3 ] && [ "$choice" != "4" ] && [ "$choice" != "5" ] && [ "$choice" != "6" ]; do
    clear
    printf "\n${vertclair} ______     ______     ______     _____     ______     __    __     ______    
/\  ___\   /\  == \   /\  __ \   /\  __-.  /\  ___\   /\ \"-./  \   /\  ___\   
\ \ \__ \  \ \  __<   \ \  __ \  \ \ \/\ \ \ \  __\   \ \ \-./\ \  \ \  __\   
 \ \_____\  \ \_\ \_\  \ \_\ \_\  \ \____-  \ \_____\  \ \_\ \ \_\  \ \_____\ 
  \/_____/   \/_/ /_/   \/_/\/_/   \/____/   \/_____/   \/_/  \/_/   \/_____/\n\n"

    if [ $vip -eq 1 ]; then
        printf "${neutre}                            You're ${vertclair}VIP ${neutre}$LOGNAME ${neutre}\n\n"
    else
        printf "     ${blanc}Feel free to${rougefonce} star ${vertclair}GradeMe${blanc} on${orange} Github ${blanc} : github.com/jcluzet/42_GradeMe\n\n\n"
    fi

    printf "        ${orange}1  ➤ ${vertclair} 42_CHECKER ${neutre}         Correction for common core\n\n"
    printf "        ${orange}2  ➤ ${vertclair} 42_Make ${neutre}            Create auto makefile \n\n"
    printf "        ${orange}3  ➤ ${vertclair} 42_EXAM simulator${neutre}   All Studs & Piscine exams \n"
    printf "               ⮑  Last Star on Github: ${vertclair}$laststar ${rougefonce}❤️\n\n"
    printf "        ${orange}4  ➤ ${vertclair} Let a ${rougefonce}feedback    ${neutre}  Report a problem or feedback\n\n"
    printf "        ${orange}5  ➤ ${vertclair} Open ${rougefonce}Github Repo  ${neutre}  Star the repo ❤️  or put an issue\n\n"
    printf "\n        ${orange}6  ➤ ${rougefonce} EXIT ${neutre} \n"

    printf "\n          ${blanc}Select a number from 1 to 6     ➤ "
    read -rsn1 -p " " choice
done
if (("$choice" == 1)); then
    if [[ $PWD == *"/Desktop" ]]; then
        printf "\n\n ${rougefonce}         ! Warning: ${blanc}You're in ~/Desktop folder.\n            42_CHECKER work only in repo folder.\n\n"
        printf "\n\n               ${blanc}REDIRECTION TO ${vertclair}MENU${blanc} IN 4 SECONDS\n               "
        for i in {1..32}; do
            printf "|"
            sleep 0.08
        done
        bash -c "$(curl -s 42.cluzet.fr)"
        exit 0
    else
        curl -X POST -F $userpost -F 'using=42_CHECKER' -F $time https://user.grademe.fr/index.php >/dev/null 2>&1 # send data containing user and what he use to server
        bash -c "$(curl -s 42.cluzet.fr/check)"
    fi
fi
if (("$choice" == 2)); then
    if [[ $PWD == *"/Desktop" ]]; then
        printf "\n\n ${rougefonce}         ! Warning: ${blanc}You're in ~/Desktop folder.\n            42_CHECKER work only in repo folder.\n\n"
        printf "\n\n               ${blanc}REDIRECTION TO ${vertclair}MENU${blanc} IN 4 SECONDS\n               "
        for i in {1..32}; do
            printf "|"
            sleep 0.08
        done
        bash -c "$(curl -s 42.cluzet.fr)"
        exit 0
    else
        printf "\n\n${rougefonce}Warning!${blanc} 42_MAKE must be used in a repo folder.\n"
        printf "Please confirm $vertclair$PWD$blanc is your repo folder where you want to create a Makefile.\n"
        printf "\n${blanc}Press any key to continue or CTRL+C to cancel."
        read -rsn1 -p " " choice
        curl -X POST -F $userpost -F 'using=42_MAKE' -F $time https://user.grademe.fr/index.php >/dev/null 2>&1
        bash -c "$(curl -s 42.cluzet.fr/make)"
    fi
fi
if (("$choice" == 3)); then

    # Function to search for 42_EXAM directory
    search_42exam() {
        echo -ne "\n${vertclair}     ➤ ${blanc}Searching for 42_EXAM directory...\n"
        # Search in home directory for 42_EXAM or 42-EXAM
        found_dir=$(find ~ -type d \( -name "42_EXAM" -o -name "42-EXAM" \) -not -path "*/\.*" 2>/dev/null | head -n 1)
        
        if [ -n "$found_dir" ]; then
            echo -ne "\n${vertclair}     ✔ ${blanc}Found 42_EXAM at: ${vertclair}$found_dir${blanc}\n"
            printf "\n${vertclair}     ➤ ${blanc}Would you like to use this directory? ${orange}(y/n)${blanc} "
            read -rsn1 -p " " reply
            echo
            if [ "$reply" == "y" ]; then
                cd "$found_dir"
                make grade
                exit 0
            fi
        else
            echo -ne "\n${rougefonce}     ✗ ${blanc}No 42_EXAM directory found on your computer${neutre}\n"
            sleep 2
        fi
    }

    clear
    printf "\n${vertclair} ______     ______     ______     _____     ______     __    __     ______    
/\  ___\   /\  == \   /\  __ \   /\  __-.  /\  ___\   /\ \"-./  \   /\  ___\   
\ \ \__ \  \ \  __<   \ \  __ \  \ \ \/\ \ \ \  __\   \ \ \-./\ \  \ \  __\   
 \ \_____\  \ \_\ \_\  \ \_\ \_\  \ \____-  \ \_____\  \ \_\ \ \_\  \ \_____\ 
  \/_____/   \/_/ /_/   \/_/\/_/   \/____/   \/_____/   \/_/  \/_/   \/_____/\n\n"

    if [ -d 42_EXAM ] || [ -d 42-EXAM ]; then
        printf "$LINE_UP$CLEAR_LINE$GREEN$BOLD"
        echo -ne "✔$RESET 42_EXAM$RESET is already install$WHITE$BOLD\n"
        if [ -d 42_EXAM ]; then
            cd 42_EXAM
        else
            cd 42-EXAM
        fi
        make grade
        exit 0
    else
        printf "\n${rougefonce}     ! ${blanc}Since 09 february 2025, ${vertclair}42_EXAM${blanc} is no longer available for download.\n\n"
        
        printf "        ${orange}1  ➤ ${vertclair}Search for 42_EXAM${blanc} on your computer\n\n"
        printf "        ${orange}2  ➤ ${vertclair}Visit Grademe.fr${blanc} for more information\n\n"
        printf "        ${orange}0  ➤ ${rougefonce}Return to main menu${neutre}\n\n"
        
        printf "\n          ${blanc}Select a number from 0 to 2     ➤ "
        read -rsn1 -p " " choice
        echo
        
        case $choice in
            1)
                search_42exam
                printf "\n${blanc}     Press any key to return to main menu"
                read -rsn1
                bash -c "$(curl -s https://grademe.fr)"
                exit 0
                ;;
            2)
                echo -ne "\n${vertclair}     ➤ ${blanc}Opening Grademe.fr in your browser...${neutre}\n"
                open "https://grademe.fr"
                sleep 2
                bash -c "$(curl -s https://grademe.fr)"
                exit 0
                ;;
            0)
                echo -ne "\n${vertclair}     ➤ ${blanc}Returning to main menu...${neutre}\n"
                sleep 1
                bash -c "$(curl -s https://grademe.fr)"
                exit 0
                ;;
            *)
                echo -ne "\n${rougefonce}     ✗ ${blanc}Invalid choice. Returning to main menu...${neutre}\n"
                sleep 2
                bash -c "$(curl -s https://grademe.fr)"
                exit 0
                ;;
        esac
    fi

fi

if (("$choice" == "4")); then
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
    if (("${#feedback}" > 0)); then
        printf "\n${vertclair}     ➤ ${blanc}Would you like to be contacted regarding this feedback? ${orange}(y/n)${blanc} "
        read -rsn1 -p " " contact
        echo
        if [ "$contact" == "y" ]; then
            printf "\n${vertclair}        ➤ ${blanc}We will try to contact you regarding your feedback. 🥳 \n\n"
            userpost="user=FEEDGrade_$LOGNAME>contact?YES"
            usingpost="using=Feedback:$feedback"

        else
            printf "\n${rougefonce}        ➤ ${blanc}We will ${rougefonce}not${blanc} contact you about your feedback 😢 \n\n"
            userpost="user=FEEDGrade_$LOGNAME>contact?NO"
            usingpost="using=Feedback:$feedback"

        fi
        curl -X POST -F "$userpost" -F "$usingpost" -F $time https://user.grademe.fr/index.php >/dev/null 2>&1
        printf "\n       ${vertclair}          📩 Feedback send !${neutre} redirection....\n\n"
    else
        printf "${red}                              ❌ Empty feedback, return back...\n\n"
    fi
    printf "                "
    for i in {1..32}; do
        printf "|"
        sleep 0.08
    done
    bash -c "$(curl -s 42.cluzet.fr)"
fi

if [ "$(uname)" == "Darwin" ]; then
    os="MAC"
else
    os="LINUX"
fi

if (("$choice" == "5")); then
    if [ "$os" == "MAC" ]; then
        open "https://github.com/JCluzet/42_GradeMe"
    else
        xdg-open "https://github.com/JCluzet/42_GradeMe"
    fi
    printf "\n\n"
    printf "\n               ${blanc}REDIRECTION TO ${vertclair}MENU${blanc} IN 4 SECONDS\n               "
    for i in {1..32}; do
        printf "|"
        sleep 0.08
    done
    bash -c "$(curl -s 42.cluzet.fr)"
fi
if (("$choice" == "6")); then
    exit
fi
