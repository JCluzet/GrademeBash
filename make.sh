#!/bin/sh

vertclair='\033[0;32m'
neutre='\033[m'
rouge='\033[0;31m'
arg1="hey"

yes_or_no () {
    echo $1
    while true; do
    read temp
    case $temp in
        [Yy]* ) return 0;;
        [Nn]* ) return 1;;
        * ) echo "Please answer yes or no (y / n)\n";;
    esac
done
}

# loading () {
#     sleep 0.2; header 1; sleep 0.2; header 2; sleep 0.2; header 3; sleep 0.2; header 4; sleep 0.2; header 5; sleep 0.2; header 6; sleep 0.2; header 7; sleep 0.2; header 8; sleep 0.2; header 9; sleep 0.2; header 10;
# }

ask () {
    echo $1
    if [ $# -eq 2 ]
    then 
    printf $2 >> Makefile_temp
    printf "        := " >> Makefile_temp
    fi
    read temp
    echo $temp >> Makefile_temp
}

ask2 () {
    echo $1
    if [ $# -eq 2 ]
    then
    printf "$2" >> Makefile_temp
    fi
    read temp
    echo $temp >> Makefile_temp
}

blank () {
    clear
}

loading_bar () {
    COUNTER=0
    printf "\033[0;32m"
    while ((COUNTER!=$1*2))
    do
    printf "▀▀"
    COUNTER=$((COUNTER+1))
    done
    printf "\033[m"
    while ((COUNTER!=20))
    do
    printf "▀▀"
    COUNTER=$((COUNTER+1))
    done
    printf "\n\n"
}

check_at_the_end () {
    header 0
    printf "\033[0;32mGreat !\033[m\nNow wait until your Makefile generating...\n\n"
    printf "\n\n" >> Makefile_temp
    sleep 0.2
    header 1
    printf "\033[0;32mGreat !\033[m\nNow wait until your Makefile generating...\n\n"
    sleep 0.2
    header 2
    printf "\033[0;32mGreat !\033[m\nNow wait until your Makefile generating...\n\n"
    sleep 0.2
    header 3
    printf "\033[0;32mGreat !\033[m\nNow wait until your Makefile generating...\n\n"
    sleep 0.2
    header 4
    printf "\033[0;32mGreat !\033[m\nNow wait until your Makefile generating...\n\n"
    sleep 0.2
    header 5
    printf "\033[0;32mGreat !\033[m\nNow wait until your Makefile generating...\n\n"
    sleep 0.2
    header 6
    printf "\033[0;32mGreat !\033[m\nNow wait until your Makefile generating...\n\n"
    sleep 0.2
    header 7
    printf "\033[0;32mGreat !\033[m\nNow wait until your Makefile generating...\n\n"
    sleep 0.2
    header 8
    printf "\033[0;32mGreat !\033[m\nNow wait until your Makefile generating...\n\n"
    sleep 0.2
    header 9
    printf "\033[0;32mGreat !\033[m\nNow wait until your Makefile generating...\n\n"
    sleep 0.2
    header 10
}

header () {
    clear
    printf   "\033[0;32m  |  |  ___ \    \  |         |\n  |  |     ) |  |\/ |   _  |  |  /   _ \\n ___ __|  __/   |   |  (   |    <    __/ \n    _|  _____| _|  _| \__,_| _|\_\ \___|\033[m\n"
    loading_bar $1
}

cxx=0
clear

# printf   "\033[0;32m  |  |  ___ \    \  |         |\n  |  |     ) |  |\/ |   _  |  |  /   _ \\n ___ __|  __/   |   |  (   |    <    __/ \n    _|  _____| _|  _| \__,_| _|\_\ \___|\n  Creation of Makefile for your project\033[m\n\n"
echo   "#  |  |  ___ \    \  |         |\n#  |  |     ) |  |\/ |   _  |  |  /   _ \\n# ___ __|  __/   |   |  (   |    <    __/ \n#    _|  _____| _|  _| \__,_| _|\_\ \___|\n#                              by jcluzet\n" > Makefile_temp
printf   "################################################################################\n#                                     CONFIG                                   #\n################################################################################\n\n" >> Makefile_temp
header 0
ask "\033[0;32m1. \033[mWhat is the name of your executable ? (ex : minishell or a.out)" "NAME            = "
header 5
# if yes_or_no "\033[0;32m2. \033[mIs your project use Minilibx ? (y / n)"
# then
#     printf "BIMLX       := ON\n" >> Makefile_temp
#     printf "MLX         := libmlx.a\n" >> Makefile_temp
#     header 7
#     printf "\033[0;31m⚠ Becarful about using minilibx with different environnement\n\033[mYou must have\033[0;32m mlx \033[mand \033[0;32mmlx_linux\033[m folder in your repo.\n\n"
#     if yes_or_no "Want you \033[0;32m42Make\033[m to install\033[0;32m mlx\033[m & \033[0;32mmlx_linux \033[mfolder? (y / n)"
#     then
#     clear
#     cp -r ~/.42Make/mlx .
#     cp -r ~/.42Make/mlx_linux .
#     echo "\033[0;32m✓ mlx and mlx_linux is now in your repo\n\033[m"
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
    printf "CC         := c++\n" >> Makefile_temp
    printf "FLAGS    := -Wall -Wextra -Werror -Wshadow -Wno-shadow -std=c++98\n" >> Makefile_temp
else
    ask "\033[0;32m3. \033[mWhich compiler do you want to use ? ex : \033[0;32mgcc\033[m, \033[0;32mclang\033[m" "CC"
    printf "FLAGS    := -Wall -Wextra -Werror\n" >> Makefile_temp
fi

# header 3

# if yes_or_no "\033[0;32m4. \033[mDo you need a compilation with \033[0;32maddress-sanitizer \033[mfor easy debug ? \033[0;31m(Forbidden in correction)\033[m (y / n)"
# then
#     printf " -g3 -fsanitize=address" >> Makefile_temp
# fi



if yes_or_no "\033[0;32m5. \033[mDo you want to add more flags than basic -Wall -Werror -Wextra? (y / n)\n     \033[0;32m      ➢ \033[mYou don't need to add flag for mlx"
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


# printf "\033[0;32m7. \033[mNow it's time to setup auto all your \033[0;32mSRCS\033[m files.\n"

printf "SRCS        :=      " >> Makefile_temp

header 8
printf "\n\n"
for f in $(find . -name '*.c' -o -name "*.cpp" -prune -o -path \*mlx\* -prune -path \*MiniLibx\* -prune -o -path \*mlx_linux\* -prune)
do 
if [[ $f != *"mlx" ]] && [[ $f != *"mlx_linux" ]] && [[ $f != *"MiniLibx" ]];
    then 
    # if yes_or_no "\033[mAdd \033[0;32m$(echo "$f" | cut -c 3- )\033[m ?        (y/n)"
    # then
    printf "$(echo "$f" | cut -c 3- ) \\" >> Makefile_temp
    printf "\n                          " >> Makefile_temp
    printf "Adding \033[0;32m $(echo "$f" | cut -c 3- ) \033[m\n"
    sleep 0.2
    header 9

fi
done
if [ "$cxx" -eq "0" ]
then
    printf "\nOBJS        := \${SRCS:.cpp=.o}\n" >> Makefile_temp
    printf ".cpp.o:\n\t\${CC} \${FLAGS} -c $< -o \${<:.cpp=.o}\n" >> Makefile_temp
else
    printf "\nOBJS        := \$(SRCS:.c=.o)\n" >> Makefile_temp
    printf ".c.o:\n\t\${CC} \${FLAGS} -c $< -o \${<:.c=.o}\n" >> Makefile_temp
fi


check_at_the_end

clear
cat ~/.42Make/utils >> Makefile_temp
rm Makefile > /dev/null
mv Makefile_temp Makefile
printf   "\033[0;32m  |  |  ___ \    \  |         |\n  |  |     ) |  |\/ |   _  |  |  /   _ \\n ___ __|  __/   |   |  (   |    <    __/ \n    _|  _____| _|  _| \__,_| _|\_\ \___|\033[m\n                  made with \033[0;31m♥\033[m by \033[0;32mjcluzet\033[m\n\n\nYou can now find your \033[0;32mMakefile\033[m in your repo.\n\n"
