#!/bin/bash

souligne="\033[4m"
rougefonce='\033[0;31m'
vertfonce='\033[0;32m'
vertclair='\033[1;32m'
orange='\033[0;33m'
blanc='\033[1;37m'
neutre='\033[1;37m'
reset="\033[0m"
bleu='\033[0;34m'

yes_or_no () {
    printf "$1"
    while true; do
    read temp
    case $temp in
        [Yy]* ) return 0;;
        [Nn]* ) return 1;;
        * ) printf "Please answer yes or no (y / n)\n";;
    esac
done
}

# loading () {
#     sleep 0.2; header 1; sleep 0.2; header 2; sleep 0.2; header 3; sleep 0.2; header 4; sleep 0.2; header 5; sleep 0.2; header 6; sleep 0.2; header 7; sleep 0.2; header 8; sleep 0.2; header 9; sleep 0.2; header 10;
# }

ask () {
    printf "$1"
    if [ $# -eq 2 ]
    then 
    printf "$2" >> Makefile_temp
    printf "        := " >> Makefile_temp
    fi
    printf "\n\n"
    read temp
    # while there is no input into the var temp ask the user to input something
    while [ -z "$temp" ]
    do
        printf "$1"
        read temp
    done
    printf "$temp" >> Makefile_temp
}

ask2 () {
    printf "$1"
    if [ $# -eq 2 ]
    then
    printf "$2" >> Makefile_temp
    fi
    read temp
    printf "$temp" >> Makefile_temp
}

blank () {
    clear
}

loading_bar () {
    COUNTER=0
    printf "${vertfonce}"
    while ((COUNTER!=$1*2))
    do
    printf "▀▀"
    COUNTER=$((COUNTER+1))
    done
    printf "${neutre}"
    while ((COUNTER!=20))
    do
    printf "▀▀"
    COUNTER=$((COUNTER+1))
    done
    printf "\n\n"
}

check_at_the_end () {
    header 0
    printf "${vertfonce}Great !${neutre}\nNow wait until your Makefile generating...\n\n"
    printf "\n\n" >> Makefile_temp
    sleep 0.2
    header 1
    printf "${vertfonce}Great !${neutre}\nNow wait until your Makefile generating...\n\n"
    sleep 0.2
    header 2
    printf "${vertfonce}Great !${neutre}\nNow wait until your Makefile generating...\n\n"
    sleep 0.2
    header 3
    printf "${vertfonce}Great !${neutre}\nNow wait until your Makefile generating...\n\n"
    sleep 0.2
    header 4
    printf "${vertfonce}Great !${neutre}\nNow wait until your Makefile generating...\n\n"
    sleep 0.2
    header 5
    printf "${vertfonce}Great !${neutre}\nNow wait until your Makefile generating...\n\n"
    sleep 0.2
    header 6
    printf "${vertfonce}Great !${neutre}\nNow wait until your Makefile generating...\n\n"
    sleep 0.2
    header 7
    printf "${vertfonce}Great !${neutre}\nNow wait until your Makefile generating...\n\n"
    sleep 0.2
    header 8
    printf "${vertfonce}Great !${neutre}\nNow wait until your Makefile generating...\n\n"
    sleep 0.2
    header 9
    printf "${vertfonce}Great !${neutre}\nNow wait until your Makefile generating...\n\n"
    sleep 0.2
    header 10
}

header () {
    clear
    printf   "${neutre}  |  |  ___ \    \  |         |\n  |  |     ) |  |\/ |   _  |  |  /   _ \\n ___ __|  __/   |   |  (   |    <    __/ \n    _|  _____| _|  _| \__,_| _|\_\ \___|${neutre}\n"
    loading_bar $1
}

cxx=0
clear

# printf   "${vertfonce}  |  |  ___ \    \  |         |\n  |  |     ) |  |\/ |   _  |  |  /   _ \\n ___ __|  __/   |   |  (   |    <    __/ \n    _|  _____| _|  _| \__,_| _|\_\ \___|\n  Creation of Makefile for your project${neutre}\n\n"
printf "${reset}"
printf   "#  |  |  ___ \    \  |         |\n#  |  |     ) |  |\/ |   _  |  |  /   _ \\n# ___ __|  __/   |   |  (   |    <    __/ \n#    _|  _____| _|  _| \__,_| _|\_\ \___|\n#                              by jcluzet\n" > Makefile_temp
printf   "################################################################################\n#                                     CONFIG                                   #\n################################################################################\n\n" >> Makefile_temp
header 0
ask "${vertfonce}1. ${neutre}What is the name of your executable ? (ex : minishell or a.out)" "NAME"
header 5
# if yes_or_no "${vertfonce}2. ${neutre}Is your project use Minilibx ? (y / n)"
# then
#     printf "BIMLX       := ON\n" >> Makefile_temp
#     printf "MLX         := libmlx.a\n" >> Makefile_temp
#     header 7
#     printf "${rougefoncefonce}⚠ Becarful about using minilibx with different environnement\n${neutre}You must have${vertfonce} mlx ${neutre}and ${vertfonce}mlx_linux${neutre} folder in your repo.\n\n"
#     if yes_or_no "Want you ${vertfonce}42Make${neutre} to install${vertfonce} mlx${neutre} & ${vertfonce}mlx_linux ${neutre}folder? (y / n)"
#     then
#     clear
#     cp -r ~/.42Make/mlx .
#     cp -r ~/.42Make/mlx_linux .
#     printf "${vertfonce}✓ mlx and mlx_linux is now in your repo\n${neutre}"
#     sleep 1; 
#     else
#     blank;
#     printf "Skipping installation of mlx & mlx_linux\n\n"
#     fi
# else
#     printf "BIMLX       := OFF\n" >> Makefile_temp
# fi
header 7

# detect if there is more .cpp file than .c file in the subdirectory
c_files=$(find . -name "*.c" | wc -l)
cpp_files=$(find . -name "*.cpp" | wc -l)
if [ $c_files -gt $cpp_files ]
then
    cxx=1
fi


if [ "$cxx" -eq "0" ]
then
    printf "\nCC         := c++\n" >> Makefile_temp
    printf "FLAGS    := -Wall -Wextra -Werror -std=c++98\n" >> Makefile_temp
else
    ask "${vertfonce}3. ${neutre}Which compiler do you want to use ? ex : ${vertfonce}gcc${neutre}, ${vertfonce}clang${neutre}" "\nCC"
    printf "FLAGS    := -Wall -Wextra -Werror" >> Makefile_temp
fi

# header 3

# if yes_or_no "${vertfonce}4. ${neutre}Do you need a compilation with ${vertfonce}address-sanitizer ${neutre}for easy debug ? ${rougefoncefonce}(Forbidden in correction)${neutre} (y / n)"
# then
#     printf " -g3 -fsanitize=address" >> Makefile_temp
# fi



if yes_or_no "${vertfonce}5. ${neutre}Do you want to add more flags than basic -Wall -Werror -Wextra? (y / n)\n\n     ${vertfonce}      ➢ ${neutre}You don't need to add flag for mlx\n\n"
then
header 5
printf " " >> Makefile_temp
ask "Type the flags you want to add : (ex : -readline)"
else
    printf "\n" >> Makefile_temp
fi

# printf "\nDFLAGS      = -MMD -MF \$(@:.o=.d)\nDATE    = 01/01/1970\nHASH      = \n\nNOVISU    = 0 # 1 = no progress bar usefull when tty is not available\n\n" >> Makefile_temp

printf "\n################################################################################\n#                                 PROGRAM'S SRCS                               #\n################################################################################\n" >> Makefile_temp



fill_srcs () {
    while [ "$temp" != "exit" ]
    do
        read temp
        if [ "$temp" != "exit" ]
        then
        if [ "$temp" != "\n" ]
        then
        if [ "$temp" != " " ]
        then
        printf "$temp \\                                        " >> Makefile_temp
        printf "\n                                      " >> Makefile_temp
        fi
        fi
        fi
    done
}


# printf "${vertfonce}7. ${neutre}Now it's time to setup auto all your ${vertfonce}SRCS${neutre} files.\n"

printf "\nSRCS        :=      " >> Makefile_temp


header 8
for f in $(find . -name '*.c' -o -name "*.cpp" -prune -o -path \*mlx\* -prune -path \*MiniLibx\* -prune -o -path \*mlx_linux\* -prune)
do 
if [[ $f != *"mlx" ]] && [[ $f != *"mlx_linux" ]] && [[ $f != *"MiniLibx" ]];
    then 
    # if yes_or_no "${neutre}Add ${vertfonce}$(printf "$f" | cut -c 3- )${neutre} ?        (y/n)"
    # then
    printf "$(printf "$f" | cut -c 3- ) \\" >> Makefile_temp
    printf "\n                          " >> Makefile_temp
    printf "Adding ${vertfonce} $(echo "$f" | cut -c 3- ) ${neutre}\n"
    sleep 0.2
    header 9

fi
done
if [ "$cxx" -eq "0" ]
then
    printf "\nOBJS        := \${SRCS:.cpp=.o}\n" >> Makefile_temp
    printf "\n.cpp.o:\n\t\${CC} \${FLAGS} -c $< -o \${<:.cpp=.o}\n" >> Makefile_temp
else
    printf "\nOBJS        := \$(SRCS:.c=.o)\n" >> Makefile_temp
    printf "\n.c.o:\n\t\${CC} \${FLAGS} -c $< -o \${<:.c=.o}\n" >> Makefile_temp
fi



clear
# cat ~/.42Make/utils >> Makefile_temp

printf ""
printf "
################################################################################
#                                  Makefile  objs                              #
################################################################################


CLR_RMV		:= \\\033[0m
RED		:= \\\033[1;31m
GREEN		:= \\\033[1;32m
YELLOW		:= \\\033[1;33m
BLUE		:= \\\033[1;34m
CYAN 		:= \\\033[1;36m
RM		:= rm -f

\${NAME}:	\${OBJS}
			@echo \"\$(GREEN)Compilation \${CLR_RMV}of \${YELLOW}\$(NAME) \${CLR_RMV}...\"
			\${CC} \${FLAGS} -o \${NAME} \${OBJS}
			@echo \"\$(GREEN)\$(NAME) created\\033[0m ✔️\"

all:		\${NAME}

bonus:		all

clean:
			@ \${RM} *.o */*.o */*/*.o
			@ echo \"\$(RED)Deleting \$(CYAN)\$(NAME) \$(CLR_RMV)objs ✔️\"

fclean:		clean
			@ \${RM} \${NAME}
			@ echo \"\$(RED)Deleting \$(CYAN)\$(NAME) \$(CLR_RMV)binary ✔️\"

re:			fclean all

.PHONY:		all clean fclean re
" >> Makefile_temp






# if there is a Makefile_old in the same directory, ask if you want to keep it
header 9
if [ -f Makefile ]
then
    printf "Do you want to keep the old Makefile ? (y/n)\n"
    read -rsn1 -p "" value
    if [ "$value" == "y" ]
    then
        mv Makefile Makefile_old_$(date +%d-%m-%Y)
        printf "Youre Makefile is now named Makefile_old_$(date +%d-%m-%Y)\n"
    else
        rm Makefile
    fi
fi
check_at_the_end

mv Makefile_temp Makefile
clear
printf   "${vertfonce}  |  |  ___ \    \  |         |\n  |  |     ) |  |\/ |   _  |  |  /   _ \\n ___ __|  __/   |   |  (   |    <    __/ \n    _|  _____| _|  _| \__,_| _|\_\ \___|${neutre}\n                  made with ${rougefoncefonce}♥${neutre} by ${vertfonce}jcluzet${neutre}\n\n"
# printf MAkefile is now ready to be used.
printf "${neutre}\n${vertfonce}    ✓ ${neutre}Makefile is now ready to be used.\n\n"
