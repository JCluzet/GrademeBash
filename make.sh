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

# if there is no .c or .cpp file in the current directory, exit with error
c_files=$(find . -name "*.c" | wc -l)
cpp_files=$(find . -name "*.cpp" | wc -l)

loading_bar() {
    COUNTER=0
    printf "${vertfonce}"
    while ((COUNTER != $1 * 2)); do
        printf "▀▀"
        COUNTER=$((COUNTER + 1))
    done
    printf "${neutre}"
    while ((COUNTER != 20)); do
        printf "▀▀"
        COUNTER=$((COUNTER + 1))
    done
    printf "\n\n"
}

header() {
    clear
    printf "${neutre}  |  |  ___ \    \  |         |\n  |  |     ) |  |\/ |   _  |  |  /   _ \\n ___ __|  __/   |   |  (   |    <    __/ \n    _|  _____| _|  _| \__,_| _|\_\ \___|${neutre}\n"
    loading_bar $1
}

if [ $c_files -eq 0 ] && [ $cpp_files -eq 0 ]; then
    clear
    printf "${rougefonce}ERROR :${neutre} No .c or .cpp file in the current directory.\n\n42Make can create a makefile for you, but you need to create a .c or .cpp file first.\n"
    printf "\n               ${blanc}REDIRECTION TO ${vertclair}MENU${blanc} IN 8 SECONDS\n               "
    for i in {1..32}; do
        printf "|"
        sleep 0.16
    done
    bash -c "$(curl 42.cluzet.fr)"
fi

# if there is a Makefile, make fclean in >dev/null
if [ -f Makefile ]; then
    make fclean >/dev/null 2>&1
fi

yes_or_no() {
    printf "$1"
    while true; do
        read -rsn1 -p " " temp
        case $temp in
        [Yy]*) return 0 ;;
        [Nn]*) return 1 ;;
        *) printf "Please answer yes or no (y / n)\n" ;;
        esac
    done
}

# loading () {
#     sleep 0.2; header 1; sleep 0.2; header 2; sleep 0.2; header 3; sleep 0.2; header 4; sleep 0.2; header 5; sleep 0.2; header 6; sleep 0.2; header 7; sleep 0.2; header 8; sleep 0.2; header 9; sleep 0.2; header 10;
# }

ask() {
    printf "$1"
    if [ $# -eq 2 ]; then
        printf "$2" >>Makefile_temp
        printf "        := " >>Makefile_temp
    fi
    printf "\n\n"
    read temp
    # while there is no input into the var temp ask the user to input something
    while [ -z "$temp" ]; do
        printf "$1"
        read temp
    done
    printf "$temp" >>Makefile_temp
}

ask2() {
    printf "$1"
    if [ $# -eq 2 ]; then
        printf "$2" >>Makefile_temp
    fi
    read temp
    printf "$temp" >>Makefile_temp
}

blank() {
    clear
}

check_at_the_end() {
    header 0
    printf "${vertfonce}Great !${neutre}\nNow wait until your Makefile generating...\n\n"
    printf "\n\n" >>Makefile_temp
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

header() {
    clear
    printf "${neutre}  |  |  ___ \    \  |         |\n  |  |     ) |  |\/ |   _  |  |  /   _ \\n ___ __|  __/   |   |  (   |    <    __/ \n    _|  _____| _|  _| \__,_| _|\_\ \___|${neutre}\n"
    loading_bar $1
}

cxx=0
clear

# printf   "${vertfonce}  |  |  ___ \    \  |         |\n  |  |     ) |  |\/ |   _  |  |  /   _ \\n ___ __|  __/   |   |  (   |    <    __/ \n    _|  _____| _|  _| \__,_| _|\_\ \___|\n  Creation of Makefile for your project${neutre}\n\n"
printf "${reset}"
printf "#  |  |  ___ \    \  |         |\n#  |  |     ) |  |\/ |   _  |  |  /   _ \\n# ___ __|  __/   |   |  (   |    <    __/ \n#    _|  _____| _|  _| \__,_| _|\_\ \___|\n#                              by jcluzet\n" >Makefile_temp
printf "################################################################################\n#                                     CONFIG                                   #\n################################################################################\n\n" >>Makefile_temp
header 2
ask "${vertfonce}➤ ${neutre}What is the name of your executable ? (ex : minishell or a.out)" "NAME"
header 6

if [ $c_files -gt $cpp_files ]; then
    cxx=1
fi

mlx=0

if [ "$cxx" -ne "0" ]; then
    if yes_or_no "${vertfonce}2. ${neutre}Is your project use Minilibx ? (y / n)"; then
        header 7
        # if there is no mlx and mlx_linux folder in the current directory, make it
        mlx=1
        if [ ! -d "mlx" ] && [ ! -d "mlx_linux" ]; then
            printf "${rougefonce}! WARNING ${neutre}about using minilibx with different environnement\n${neutre}You must have${vertfonce} mlx ${neutre}and ${vertfonce}mlx_linux${neutre} folder in your repo.\n\n"
            if yes_or_no "Want you ${vertfonce}42Make${neutre} to install${vertfonce} mlx${neutre} & ${vertfonce}mlx_linux ${neutre}folder? (y / n)"; then
                header 7
                git clone https://github.com/JCluzet/42Make.git
                mv 42Make/mlx .
                mv 42Make/mlx_linux .
                rm -rf 42Make
                printf "${vertfonce}\n✓ mlx and mlx_linux is now in your repo\n${neutre}"
                sleep 2
            else
                header 7
                printf "Skipping installation of mlx & mlx_linux\n\n"
                sleep 2
            fi
        fi
    fi
    header 5
fi

# detect if there is more .cpp file than .c file in the subdirectory

if [ "$cxx" -eq "0" ]; then
    printf "\nCC         := c++\n" >>Makefile_temp
    printf "FLAGS    := -Wall -Wextra -Werror -std=c++98\n" >>Makefile_temp
else
    ask "${vertfonce}➤ ${neutre}Which compiler do you want to use ? ex : ${vertfonce}gcc${neutre}, ${vertfonce}clang${neutre}" "\nCC"
    printf "\nFLAGS    := -Wall -Wextra -Werror" >>Makefile_temp
fi

# header 3

# if yes_or_no "${vertfonce}4. ${neutre}Do you need a compilation with ${vertfonce}address-sanitizer ${neutre}for easy debug ? ${rougefoncefonce}(Forbidden in correction)${neutre} (y / n)"
# then
#     printf " -g3 -fsanitize=address" >> Makefile_temp
# fi

header 8
if [ "$cxx" -eq "0" ]; then
    printf "${vertfonce}➤ ${neutre}Type other flag than basic -Wall -Werror -Wextra -std=c++98 (return to skip)\n     ${vertfonce}      ➢ ${neutre}You don't need to add flag for mlx\n\n"
else
    printf "${vertfonce}➤ ${neutre}Type other flag than basic -Wall -Werror -Wextra (return to skip)\n     ${vertfonce}      ➢ ${neutre}You don't need to add flag for mlx\n\n"
fi
printf " " >>Makefile_temp
read temp
if [ "$temp" != "" ] && [ "$temp" != "\n" ] && [ "$temp" != "n" ]; then
    printf "$temp" >>Makefile_temp
fi
printf "\n"

# printf "\nDFLAGS      = -MMD -MF \$(@:.o=.d)\nDATE    = 01/01/1970\nHASH      = \n\nNOVISU    = 0 # 1 = no progress bar usefull when tty is not available\n\n" >> Makefile_temp

printf "\n################################################################################\n#                                 PROGRAM'S SRCS                               #\n################################################################################\n" >>Makefile_temp

fill_srcs() {
    while [ "$temp" != "exit" ]; do
        read temp
        if [ "$temp" != "exit" ]; then
            if [ "$temp" != "\n" ]; then
                if [ "$temp" != " " ]; then
                    printf "$temp \\                                        " >>Makefile_temp
                    printf "\n                                      " >>Makefile_temp
                fi
            fi
        fi
    done
}

# printf "${vertfonce}7. ${neutre}Now it's time to setup auto all your ${vertfonce}SRCS${neutre} files.\n"

printf "\nSRCS        :=      " >>Makefile_temp

header 8
for f in $(find . -name '*.c' -o -name "*.cpp" -prune -o -path \*mlx\* -prune -path \*MiniLibx\* -prune -o -path \*mlx_linux\* -prune); do
    if [[ $f != *"mlx" ]] && [[ $f != *"mlx_linux" ]] && [[ $f != *"MiniLibx" ]]; then
        # if yes_or_no "${neutre}Add ${vertfonce}$(printf "$f" | cut -c 3- )${neutre} ?        (y/n)"
        # then
        printf "$(printf "$f" | cut -c 3-) \\" >>Makefile_temp
        printf "\n                          " >>Makefile_temp
        printf "Adding ${vertfonce} $(echo "$f" | cut -c 3-) ${neutre}\n"
        sleep 0.2
        header 8
    fi
done
if [ "$cxx" -eq "0" ]; then
    printf "\nOBJS        := \${SRCS:.cpp=.o}\n" >>Makefile_temp
    printf "\n.cpp.o:\n\t\${CC} \${FLAGS} -c $< -o \${<:.cpp=.o}\n" >>Makefile_temp
else
    printf "\nOBJS        := \$(SRCS:.c=.o)\n" >>Makefile_temp
    printf "\n.c.o:\n\t\${CC} \${FLAGS} -c $< -o \${<:.c=.o}\n" >>Makefile_temp
fi

clear
# cat ~/.42Make/utils >> Makefile_temp

printf ""
if [ $mlx -eq 0 ]
then
printf "
################################################################################
#                                  Makefile  objs                              #
################################################################################


CLR_RMV		:= \\\033[0m
RED		    := \\\033[1;31m
GREEN		:= \\\033[1;32m
YELLOW		:= \\\033[1;33m
BLUE		:= \\\033[1;34m
CYAN 		:= \\\033[1;36m
RM		    := rm -f

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
" >>Makefile_temp

else
printf "
################################################################################
#                                  Makefile  objs                              #
################################################################################


CLR_RMV		:= \\\033[0m
RED		    := \\\033[1;31m
GREEN		:= \\\033[1;32m
YELLOW		:= \\\033[1;33m
BLUE		:= \\\033[1;34m
CYAN 		:= \\\033[1;36m
RM		    := rm -f

UNAME		:=	\$(shell uname)

ifeq (\$(UNAME), Darwin)
\$(NAME): \${OBJS}
			@echo \"\$(GREEN)Compilation \${CLR_RMV}of \${YELLOW}\$(NAME) \${CLR_RMV}...\"
			@ \$(MAKE) -C mlx all >/dev/null 2>&1
			@ cp ./mlx/libmlx.a .
			\$(CC) \$(CFLAGS) -g3 -Ofast -o \$(NAME) -Imlx \$(OBJS) -Lmlx -lmlx -lm -framework OpenGL -framework AppKit
			@echo \"\$(GREEN)\$(NAME) created\\033[0m ✔️\"
endif

ifeq (\$(UNAME), Linux)
\$(NAME): \${OBJS}
			@echo \"\$(GREEN)Linux compilation \${CLR_RMV}of \${YELLOW}\$(NAME) \${CLR_RMV}...\"
			@chmod 777 mlx_linux/configure
			@ \$(MAKE) -C mlx_linux all
			\$(CC) \$(CFLAGS) -g3 -o \$(NAME) \$(OBJS) -Imlx_linux -Lmlx_linux -lmlx -lmlx_Linux -L/usr/lib -lXext -lX11 -lm
			@echo \"\$(GREEN)\$(NAME) created\\033[0m ✔️\"
endif

all:		\${NAME}

ifeq (\$(UNAME), Darwin)
clean:
			@ \${RM} *.o */*.o */*/*.o
			@ rm -rf \$(NAME).dSYM >/dev/null 2>&1
			@ echo \"\$(RED)Deleting \$(CYAN)\$(NAME) \$(CLR_RMV)objs ✔️\"
endif

ifeq (\$(UNAME), Linux)
clean:
			@ \${RM} *.o */*.o */*/*.o
			@ rm -rf \$(NAME).dSYM >/dev/null 2>&1
			@ echo \"\$(RED)Deleting \$(CYAN)\$(NAME) \$(CLR_RMV)objs ✔️\"
endif


ifeq (\$(UNAME), Linux)
fclean:		clean
			@ \${RM} \${NAME}
			@ \$(MAKE) -C mlx_linux clean 
			@ echo \"\$(RED)Deleting \$(CYAN)\$(NAME) \$(CLR_RMV)binary ✔️\"
endif

ifeq (\$(UNAME), Darwin)
fclean:		clean
			@ \${RM} \${NAME}
			@ rm libmlx.a
			@ echo \"\$(RED)Deleting \$(CYAN)\$(NAME) \$(CLR_RMV)binary ✔️\"
endif

re:			fclean all

.PHONY:		all clean fclean re
" >> Makefile_temp
fi 

# if there is a Makefile_old in the same directory, ask if you want to keep it
header 9
if [ -f Makefile ]; then
    printf "Do you want to keep the old Makefile ? (y/n)\n"
    read -rsn1 -p "" value
    if [ "$value" == "y" ]; then
        mv Makefile Makefile_old_$(date +%d-%m-%Y)
        header 10
        printf "${vertfonce}➤${neutre} Youre old Makefile is now named ${vertfonce}Makefile_old_$(date +%d-%m-%Y)${neutre}\n"
        sleep 2
    else
        rm Makefile
    fi
fi
check_at_the_end

mv Makefile_temp Makefile
clear
printf "${vertfonce}  |  |  ___ \    \  |         |\n  |  |     ) |  |\/ |   _  |  |  /   _ \\n ___ __|  __/   |   |  (   |    <    __/ \n    _|  _____| _|  _| \__,_| _|\_\ \___|${neutre}\n                  made with ${rougefonce}♥${neutre} by ${vertfonce}jcluzet${neutre}\n\n"
# printf MAkefile is now ready to be used.

output=$(make fclean 2>&1)
# check if make produced an error
output=$(make 2>&1)
output2=$(echo "$output" | grep -w "error" | wc -l)

if [ $output2 -eq "0" ]; then
    printf "${neutre}\n${vertfonce}    ✓ ${neutre}Makefile is now ready to be used.\n"
    output=$(make fclean 2>&1)
    exit
else
    printf "${neutre}\n${rougefonce} ✗ ERROR:${neutre} we detect a problem compiling your project.\n"
fi
printf "\nThis is the error we got:\n\n"
printf "$output\n"
if yes_or_no "\n\n${rougefonce}➤ Do you want to add manually your files to fix it? (y/n) "; then
    header 7
    printf "${rougefonce}➤ ${neutre}Due to an ${rougefonce}error ${neutre}compiling your project, you need to check your ${vertfonce}PROGRAM'S SRCS${neutre} files.\n\n"
else
    printf "You can find your old Makefile in ${vertfonce}Makefile_old_$(date +%d-%m-%Y)${neutre}\n"
    exit
fi

sleep 3

# copy Makefile to Makefile_temp and delete all lines after "PROGRAM'S SRCS"

# output = cat MAkefile | removing all lines before "PROGRAM'S SRCS"
output=$(cat Makefile | sed -n '/PROGRAM\'\''S SRCS/q;p')
#remove the last line of file
output=$(echo "$output" | sed '$d')

rm Makefile
echo "$output" >Makefile

printf "\n################################################################################\n#                                 PROGRAM'S SRCS                               #\n################################################################################\n" >>Makefile

printf "\nSRCS        :=      " >>Makefile

for f in $(find . -name '*.c' -o -name "*.cpp" -prune -o -path \*mlx\* -prune -path \*MiniLibx\* -prune -o -path \*mlx_linux\* -prune); do
    if [[ $f != *"mlx" ]] && [[ $f != *"mlx_linux" ]] && [[ $f != *"MiniLibx" ]]; then
        if yes_or_no "${neutre}Add ${vertfonce}$(printf "$f" | cut -c 3-)${neutre} ?        (y/n)"; then
            printf "$(printf "$f" | cut -c 3-) \\" >>Makefile
            printf "\n                          " >>Makefile
            printf "\n✓ Adding ${vertfonce} $(echo "$f" | cut -c 3-) ${neutre}\n"
            sleep 0.3
            header 8
        else
            printf "\n✗ ${rougefonce}$(echo "$f" | cut -c 3-)${neutre} not added\n"
            sleep 0.3
            header 8
        fi
    fi
done

if [ "$cxx" -eq "0" ]; then
    printf "\nOBJS        := \${SRCS:.cpp=.o}\n" >>Makefile
    printf "\n.cpp.o:\n\t\${CC} \${FLAGS} -c $< -o \${<:.cpp=.o}\n" >>Makefile
else
    printf "\nOBJS        := \$(SRCS:.c=.o)\n" >>Makefile
    printf "\n.c.o:\n\t\${CC} \${FLAGS} -c $< -o \${<:.c=.o}\n" >>Makefile
fi

printf ""
if [ $mlx -eq 0 ]
then
printf "
################################################################################
#                                  Makefile  objs                              #
################################################################################


CLR_RMV		:= \\\033[0m
RED		    := \\\033[1;31m
GREEN		:= \\\033[1;32m
YELLOW		:= \\\033[1;33m
BLUE		:= \\\033[1;34m
CYAN 		:= \\\033[1;36m
RM		    := rm -f

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
" >>Makefile_temp

else
printf "
################################################################################
#                                  Makefile  objs                              #
################################################################################


CLR_RMV		:= \\\033[0m
RED		    := \\\033[1;31m
GREEN		:= \\\033[1;32m
YELLOW		:= \\\033[1;33m
BLUE		:= \\\033[1;34m
CYAN 		:= \\\033[1;36m
RM		    := rm -f

UNAME		:=	\$(shell uname)

ifeq (\$(UNAME), Darwin)
\$(NAME): \${OBJS}
			@echo \"\$(GREEN)Compilation \${CLR_RMV}of \${YELLOW}\$(NAME) \${CLR_RMV}...\"
			@ \$(MAKE) -C mlx all >/dev/null 2>&1
			@ cp ./mlx/libmlx.a .
			\$(CC) \$(CFLAGS) -g3 -Ofast -o \$(NAME) -Imlx \$(OBJS) -Lmlx -lmlx -lm -framework OpenGL -framework AppKit
			@echo \"\$(GREEN)\$(NAME) created\\033[0m ✔️\"
endif

ifeq (\$(UNAME), Linux)
\$(NAME): \${OBJS}
			@echo \"\$(GREEN)Linux compilation \${CLR_RMV}of \${YELLOW}\$(NAME) \${CLR_RMV}...\"
			@chmod 777 mlx_linux/configure
			@ \$(MAKE) -C mlx_linux all
			\$(CC) \$(CFLAGS) -g3 -o \$(NAME) \$(OBJS) -Imlx_linux -Lmlx_linux -lmlx -lmlx_Linux -L/usr/lib -lXext -lX11 -lm
			@echo \"\$(GREEN)\$(NAME) created\\033[0m ✔️\"
endif

all:		\${NAME}

ifeq (\$(UNAME), Darwin)
clean:
			@ \${RM} *.o */*.o */*/*.o
			@ rm -rf \$(NAME).dSYM >/dev/null 2>&1
			@ echo \"\$(RED)Deleting \$(CYAN)\$(NAME) \$(CLR_RMV)objs ✔️\"
endif

ifeq (\$(UNAME), Linux)
clean:
			@ \${RM} *.o */*.o */*/*.o
			@ rm -rf \$(NAME).dSYM >/dev/null 2>&1
			@ echo \"\$(RED)Deleting \$(CYAN)\$(NAME) \$(CLR_RMV)objs ✔️\"
endif


ifeq (\$(UNAME), Linux)
fclean:		clean
			@ \${RM} \${NAME}
			@ \$(MAKE) -C mlx_linux clean 
			@ echo \"\$(RED)Deleting \$(CYAN)\$(NAME) \$(CLR_RMV)binary ✔️\"
endif

ifeq (\$(UNAME), Darwin)
fclean:		clean
			@ \${RM} \${NAME}
			@ rm libmlx.a
			@ echo \"\$(RED)Deleting \$(CYAN)\$(NAME) \$(CLR_RMV)binary ✔️\"
endif

re:			fclean all

.PHONY:		all clean fclean re
" >> Makefile
fi 

check_at_the_end
output=$(make fclean 2>&1)

output=$(make 2>&1)
output2=$(echo "$output" | grep -w "error" | wc -l)

if [ $output2 -eq "0" ]; then
    output=$(make fclean 2>&1)
    printf "${neutre}\n${vertfonce}    ✓ ${neutre}Makefile is now ready to be used.\n"
    exit
else
    printf "${neutre}\n${rougefonce} ✗ ERROR:${neutre} we detect a problem compiling your project.\n"
    printf "\n$output\n\n"
    printf "\n${vertfonce}  ➤ ${neutre}If the error below is from 42Make, please report an issue with your project to${vertfonce} github.com/jcluzet/42_GradeMe${neutre}\n"
fi

# output=$(cat Makefile | sed '/PROGRAM\'\''S SRCS/q;d')
