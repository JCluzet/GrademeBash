# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    C_Checker.sh                                       :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: jcluzet <jcluzet@student.42.fr>            +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2021/02/13 00:44:50 by jcluzet           #+#    #+#              #
#    Updated: 2022/02/11 02:39:17 by jcluzet          ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

#!/bin/bash


rougefonce='\033[0;31m'
vertfonce='\033[0;32m'
vertclair='\033[1;32m'
orange='\033[0;33m'
blanc='\033[1;37m'
neutre='\033[0;m'
bleu='\033[0;34m'
version="UNKNOWN"
student="UNKNOWN"

i=6
cluster=$(echo $SESSION_MANAGER | cut -c 7- | sed "s/.clusters.42paris.fr/                      /g" | cut -c -10 | sed "s/ //g")
u=0
goodheader=0
goodnorme=0
norminettenotfound=0
goodmakefile=0
gooddock=0
errorinfile=-1
error=0
inallancien=0
inall=0
ok=0
ignorefiles="vdin3irn3dubhwbuy3bru2ruy23b32uyrv23bur32"
ignorefilesdeux="vdin3irn3dubhwbuy3bru2ruy23b32uyrv23bur32"
ko=0
sp="/-\|"

# detect if os is linux or mac
if [ "$(uname)" == "Darwin" ]; then
	os="MAC"
else
	os="LINUX"
fi



# if os is mac, 
thathscpp=-1
cpp=-1

			for fichier in $(find . -type f -iname "*.c" -o -iname "*.h" | grep -v "^./${ignorefiles}/" | grep -v "^./${ignorefilesdeux}/")
 			do
				((thatsc++))
			done
			for fichier in $(find . -type f -iname "*.cpp" -o -iname "*.hpp" | grep -v "^./${ignorefiles}/" | grep -v "^./${ignorefilesdeux}/")
 			do
				((thatscpp++))
			done

header()
{
	clear

printf "\n${vertclair} ______     ______     ______     _____     ______     __    __     ______    
/\  ___\   /\  == \   /\  __ \   /\  __-.  /\  ___\   /\ \"-./  \   /\  ___\  
\ \ \__ \  \ \  __<   \ \  __ \  \ \ \/\ \ \ \  __\   \ \ \-./\ \  \ \  __\   
 \ \_____\  \ \_\ \_\  \ \_\ \_\  \ \____-  \ \_____\  \ \_\ \ \_\  \ \_____\ 
  \/_____/   \/_/ /_/   \/_/\/_/   \/____/   \/_____/   \/_/  \/_/   \/_____/\n"

# printf "       ${blanc}🛃 MAKEFILE 🛃${neutre}              ${blanc}📜 HEADER 📜 ${neutre}             ${blanc}🛂 NORMINETTE 🛂${neutre}\n"
# if [[ $goodmakefile == 1 ]]
# then
# 	printf "${vertclair}         PERFECT${neutre}"
# fi
# if [[ $goodmakefile == 0 ]]
# then
# 	printf "${orange}           LOADING${neutre}"
# fi
# if [[ $goodmakefile == -1 ]]
# then
# 	printf "${rougefonce}         INVALID${neutre}"
# fi

# if [[ $goodheader == 1 ]]
# then
# 	printf "${vertclair}                    PERFECT${neutre}"
# fi
# if [[ $goodheader == 0 ]]
# then
# 	printf "${orange}                    LOADING${neutre}"
# fi
# if [[ $goodheader == -1 ]]
# then
# 	printf "${rougefonce}                    INVALID${neutre}"
# fi

# if [[ $goodnorme == 1 ]]
# then
# 	printf "${vertclair}                    PERFECT${neutre}"
# fi
# if [[ $goodnorme == 0 ]]
# then
# 	printf "${orange}                    LOADING${neutre}"
# fi
# if [[ $goodnorme == -1 ]]
# then
# 	printf "${rougefonce}                    INVALID${neutre}"
# fi




printf "\n";



if [ $ignorefiles = 'vdin3irn3dubhwbuy3bru2ruy23b32uyrv23bur32' ] && [ $ignorefilesdeux = 'vdin3irn3dubhwbuy3bru2ruy23b32uyrv23bur32' ]
	then
	printf "      Student : ${blanc}${version}      ${vertclair}${PWD##*/} ${blanc}> ${vertclair}${inall} ${blanc}Files${neutre} 🔦      🔧 ${vertclair}$os $cluster${blanc} Correction\n"
fi

if [ $ignorefiles != 'vdin3irn3dubhwbuy3bru2ruy23b32uyrv23bur32' ] && [ $ignorefilesdeux = 'vdin3irn3dubhwbuy3bru2ruy23b32uyrv23bur32' ]
	then
	printf "     Student : ${blanc}${version} ${vertclair}${PWD##*/}${blanc} without ${rougefonce}${ignorefiles} ${blanc}> ${vertclair}${inall} ${blanc}Files${neutre} 🔦    🔧 ${vertclair}$os $cluster ${blanc} Correction\n"
fi

if [ $ignorefiles != 'vdin3irn3dubhwbuy3bru2ruy23b32uyrv23bur32' ] && [ $ignorefilesdeux != 'vdin3irn3dubhwbuy3bru2ruy23b32uyrv23bur32' ]
	then
	printf "     Student : ${blanc}${version} ${vertclair}${PWD##*/}${blanc} without ${rougefonce}${ignorefiles}${blanc}, ${rougefonce}${ignorefilesdeux} ${blanc}> ${vertclair}${inall} ${blanc}Files${neutre} 🔦"
fi
printf "\n"


}

# if thathscpp different from 0 then it's cpp
if [ $thatscpp -ne -1 ]; then
header
	bash -c "$(curl 42.cluzet.fr/cpp)"
	exit 0
else
	clear
fi

output=$(echo -e "test")
if [[ $output == "test" ]]
then
    clear
else
    clear
    printf "${rougefonce}ERROR :${neutre} Please launch this script with bash. ${vertclair} \n\nTry : ${neutre}bash -c \$(\"curl 42.cluzet.fr\")\n\n"
    exit 1
fi

			for fichier in $(find . -type f -iname "*.c" -o -iname "*.h" | grep -v "^./${ignorefiles}/" | grep -v "^./${ignorefilesdeux}/")
 			do
			grep -H -r  "Created:" $fichier | awk '{print $6}' >> .42Checker_2021_Header
			grep -H -r  "Updated:" $fichier | awk '{print $6}' >> .42Checker_2021_Header
			grep -H -r  "By:" $fichier | awk '{print $3}' >> .42Checker_2021_Header
			done
			sort .42Checker_2021_Header | uniq >> .42Checker_2021_Header_Sort
			version=$(cat .42Checker_2021_Header | head -n 1)
			if [ -z "$version" ]
			then
				version="UNKNOWN"
			fi
			rm .42Checker_2021_Header
			rm .42Checker_2021_Header_Sort

# if os is mac and folder name is Minishell or minishell then open https://projects.intra.42.fr/42cursus-minishell

for fichier in $(find . -type f -iname "*.c" -o -iname "*.h" | grep -v "^./${ignorefiles}")
 do
	((inall++))
done

for fichier in $(find . -type f -iname "*.c" -o -iname "*.h" | grep -v "^./${ignorefiles}")
 do
	((gooddock++))
done

header

if [ $gooddock = 0 ]; then
	printf "\n${rougefonce}         Error ${vertclair}${PWD##*/} ${blanc}does not contain any .c, .cpp or .h files.\n               ${neutre}           >  Check your repertory\n\n"
	# echo "${rougefonce}Maybe you use sh instead of BASH :${neutre} Please launch this script with bash. ${vertclair} \n\nTry : ${neutre}bash -c \$(\"curl 42.cluzet.fr/check\")\n\n\n"
	
	printf "\n\n\n               ${blanc}REDIRECTION TO ${vertclair}MENU${blanc} IN 5 SECONDS\n               "
	for i in {1..32}
	do
		printf "|"
		sleep 0.1
	done
	bash -c "$(curl 42.cluzet.fr)"
	exit 0
fi








	
	
	
	printf "\n\n\n${blanc}     🗝   Touch y to launch ${vertclair} 42 EXAM simulator ${blanc} or other to exit\n"
	read -rsn1 "" value
	if [[ $value == "y" ]] || [[ $value == "Y" ]]
	then
		bash -c "$(curl 42.cluzet.fr/exam)"
		exit 0
	else
		exit 0
	fi
else

if [ -e savenorme ]
then
	rm savenorme
fi

if [ -e .42Checker_2021_Header_Sort ]
then
	rm .42Checker_2021_Header_Sort
fi

if [ -e .42Checker_2021_Header ]
then
	rm .42Checker_2021_Header
fi

while true; do                                                                                    ## DEMANDE DE CHECKALL ?
	printf "\n${blanc} 📚 Do you want to check ${rougefonce}ALL ${blanc}files ${neutre}(*.c & *.h)${blanc} in ${vertclair}${PWD##*/}${blanc}? (y/n)\n\n    "
    read -p " " yn
    case $yn in
        [Yy]* )
			header
			printf "\n${blanc} 📚 Do you want to check ${rougefonce}ALL ${blanc}files in ${vertclair}${PWD##*/}${blanc} ? (y/n)\n"
			printf "\n   ${vertclair} 📦 ${inall} files in ${PWD##*/} are well imported"
			break;;
        [Nn]* )
			header
			printf "\n${blanc} 📚 What repertory do you want to ignore in ${vertclair}${PWD##*/}${blanc} ? \n \n"
			printf "$(ls -d */ | tr / " ")\n\n"
			read ignorefiles
			inallancien=$inall
			inall=0
			for fichier in $(find . -type f -iname "*.c" -o -iname "*.h" | grep -v "^./${ignorefiles}/")
 			do
				((inall++))
			done
			ignorefiles2=$(($inallancien-$inall))
			header
			printf "\n${vertclair} 📚 ${ignorefiles}${blanc} with ${ignorefiles2} files will be ignored of ${vertclair}${PWD##*/}${blanc}\n\n"


while true; do                                                 ## ignore plus ??
	printf "${blanc} 📚 Do you want to ignore more repertory ? (y/n)\n\n        "
    read -p " " yn
    case $yn in
        [Yy]* )
			header
			printf "\n${vertclair} 📚 ${ignorefiles}${blanc} with ${ignorefiles2} files will be ignored of ${vertclair}${PWD##*/}${blanc}\n      "
			printf "\n${blanc} 📚 What repertory do you want to ignore in ${vertclair}${PWD##*/}${blanc} ? \n\n"
			printf "$(ls -d */ | tr / " ")\n\n"
			printf "         "
			read ignorefilesdeux
			inall=0
			for fichier in $(find . -type f -iname "*.c" -o -iname "*.h" | grep -v "^./${ignorefiles}/" | grep -v "^./${ignorefilesdeux}/")
 			do
				((inall++))
			done
			ignorefiles3=$(($inallancien-$inall))
			header
			printf "\n${vertclair} 📚 ${ignorefiles}${blanc}, ${vertclair}${ignorefilesdeux} ${blanc}with ${ignorefiles3} files will be ignored of ${vertclair}${PWD##*/}${blanc}\n\n      "
			break;;
        [Nn]* )
			header
			break;;
        * ) header
			printf "\n${rougefonce}                                            ❌ Please enter yes or no (y/n)"
			printf "\n${vertclair} 📚 ${ignorefiles}${blanc} ${ignorefiles2} files will be ignored of ${vertclair}${PWD##*/}${blanc}\n\n";;
    esac
done
			break;;
        * ) header
			printf "\n${rougefonce}                                            ❌ Please enter yes or no (y/n)";;
    esac
done

printf "\n"
header

if [ ${PWD##*/} == "Minishell" ] || [ ${PWD##*/} == "minishell" ]
then
	if [ $os == "MAC" ]
	then
		printf "\n${orange} 📎 Opening ${vertclair}42 Minishell Project${blanc} in your browser\n\n"
		sleep 1
		open https://projects.intra.42.fr/42cursus-minishell/mine
	else
	printf "\n${orange} 📎 Opening ${vertclair}42 Minishell Project${blanc} in your browser\n\n"
	sleep 1
		xdg-open https://projects.intra.42.fr/42cursus-minishell/mine
	fi
fi

# same check for libft
if [ ${PWD##*/} == "libft" ] || [ ${PWD##*/} == "Libft" ]
then
	if [ $os == "MAC" ]
	then
		printf "\n${orange} 📎 Opening ${vertclair}42 libft Project${blanc} in your browser\n\n"
		sleep 1
		open https://projects.intra.42.fr/42cursus-libft/mine
	else
	printf "\n${orange} 📎 Opening ${vertclair}42 libft Project${blanc} in your browser\n\n"
	sleep 1
		xdg-open https://projects.intra.42.fr/42cursus-libft/mine
	fi
fi

#same for ft_printf
if [ ${PWD##*/} == "ft_printf" ] || [ ${PWD##*/} == "Ft_printf" ] || [ ${PWD##*/} == "printf" ] || [ ${PWD##*/} == "Printf" ]
then
	if [ $os == "MAC" ]
	then
		printf "\n${orange} 📎 Opening ${vertclair}42 ft_printf Project${blanc} in your browser\n\n"
		sleep 1
		open https://projects.intra.42.fr/42cursus-ft_printf/mine
	else
	printf "\n${orange} 📎 Opening ${vertclair}42 ft_printf Project${blanc} in your browser\n\n"
	sleep 1
		xdg-open https://projects.intra.42.fr/42cursus-ft_printf/mine
	fi
fi

#same for gnl
if [ ${PWD##*/} == "get_next_line" ] || [ ${PWD##*/} == "Get_next_line" ] || [ ${PWD##*/} == "gnl" ] || [ ${PWD##*/} == "Gnl" ]
then
	if [ $os == "MAC" ]
	then
		printf "\n${orange} 📎 Opening ${vertclair}42 get_next_line Project${blanc} in your browser\n\n"
		sleep 1
		open https://projects.intra.42.fr/42cursus-get_next_line/mine
	else
	printf "\n${orange} 📎 Opening ${vertclair}42 get_next_line Project${blanc} in your browser\n\n"
	sleep 1
		xdg-open https://projects.intra.42.fr/42cursus-get_next_line/mine
	fi
fi

#same for push_swap
if [ ${PWD##*/} == "push_swap" ] || [ ${PWD##*/} == "Push_swap" ] || [ ${PWD##*/} == "Pushswap" ] || [ ${PWD##*/} == "pushswap" ]
then
	if [ $os == "MAC" ]
	then
		printf "\n${orange} 📎 Opening ${vertclair}42 push_swap Project${blanc} in your browser\n\n"
		sleep 1
		open https://projects.intra.42.fr/42cursus-push_swap/mine
	else
		printf "\n${orange} 📎 Opening ${vertclair}42 push_swap Project${blanc} in your browser\n\n"
		sleep 1
		xdg-open https://projects.intra.42.fr/42cursus-push_swap/mine
	fi
fi

#same for minitalk
if [ ${PWD##*/} == "minitalk" ] || [ ${PWD##*/} == "Minitalk" ]
then
	if [ $os == "MAC" ]
	then
		printf "\n${orange} 📎 Opening ${vertclair}42 minitalk Project${blanc} in your browser\n\n"
		sleep 1
		open https://projects.intra.42.fr/minitalk/mine
	else
		printf "\n${orange} 📎 Opening ${vertclair}42 minitalk Project${blanc} in your browser\n\n"
		sleep 1
		xdg-open https://projects.intra.42.fr/minitalk/mine
	fi
fi


#same for pipex
if [ ${PWD##*/} == "pipex" ] || [ ${PWD##*/} == "Pipex" ]
then
	if [ $os == "MAC" ]
	then
		printf "\n${orange} 📎 Opening ${vertclair}42 pipex Project${blanc} in your browser\n\n"
		sleep 1
		open https://projects.intra.42.fr/pipex/mine
	else
		printf "\n${orange} 📎 Opening ${vertclair}42 pipex Project${blanc} in your browser\n\n"
		sleep 1
		xdg-open https://projects.intra.42.fr/pipex/mine
	fi
fi

#same for so_long
if [ ${PWD##*/} == "so_long" ] || [ ${PWD##*/} == "So_long" ]
then
	if [ $os == "MAC" ]
	then
		printf "\n${orange} 📎 Opening ${vertclair}42 so_long Project${blanc} in your browser\n\n"
		sleep 1
		open https://projects.intra.42.fr/so_long/mine
	else
		printf "\n${orange} 📎 Opening ${vertclair}42 so_long Project${blanc} in your browser\n\n"
		sleep 1
		xdg-open https://projects.intra.42.fr/so_long/mine
	fi
fi

#same for Philosophers
if [ ${PWD##*/} == "Philosophers" ] || [ ${PWD##*/} == "philosophers" ] || [ ${PWD##*/} == "42-Philosopher" ] || [ ${PWD##*/} == "philo" ]
then
	if [ $os == "MAC" ]
	then
		printf "\n${orange} 📎 Opening ${vertclair}42 Philosophers Project${blanc} in your browser\n\n"
		sleep 1
		open https://projects.intra.42.fr/42cursus-philosophers/mine
	else
		printf "\n${orange} 📎 Opening ${vertclair}42 Philosophers Project${blanc} in your browser\n\n"
		sleep 1
		xdg-open https://projects.intra.42.fr/42cursus-philosophers/mine
	fi
fi

printf "\nTouch any key to continue...\n\n"
read -p ""

# grep -H -r  "Created:" *.c | awk '{print $6}'

			header
			#printf "\n ${blanc}   📝 Header Created by :${vertclair}\n"
			for fichier in $(find . -type f -iname "*.c" -o -iname "*.h" | grep -v "^./${ignorefiles}/" | grep -v "^./${ignorefilesdeux}/")
 			do
			 grep -H -r  "Created:" $fichier | awk '{print $6}' >> .42Checker_2021_Header
			 grep -H -r  "Updated:" $fichier | awk '{print $6}' >> .42Checker_2021_Header
			 grep -H -r  "By:" $fichier | awk '{print $3}' >> .42Checker_2021_Header
			done
			sort .42Checker_2021_Header | uniq >> .42Checker_2021_Header_Sort
			while read line
				do
				((auteur++))
			done < .42Checker_2021_Header_Sort
			if ((auteur > 1))
			then
			while true; do                                                                   ## DEMANDE DE DETAILS HEADER ?
				printf "\n    ${rougefonce} WARNING: ${blanc} More then 1 name finded in header.${vertclair}\n"
					while read line
					do
						printf "\n     $line"
					done < .42Checker_2021_Header_Sort
				
				printf "${blanc}\n\n     Want to check details for a name ? ${neutre}(y/n)\n\n"
    			read -p " " yn
    			case $yn in
        		[Yy]* )
					header
				printf "\n    ${rougefonce} WARNING: ${blanc} More then 1 name finded in header.${vertclair}\n"
					while read line
					do
						printf "\n     $line"
						((auteur++))
					done < .42Checker_2021_Header_Sort
					printf "\n\n ${blanc}   📝 Enter the name you want to search for :${vertclair}\n"
					read -p "       " nom
					present=0
					for fichier in $(find . -type f -iname "*.c" -o -iname "*.h" | grep -v "^./${ignorefiles}" | grep -v "^./${ignorefilesdeux}")
					do
						if [[ `grep -H -r  "Created:" $fichier | awk '{print $6}'` = $nom ]] ||
						[[ `grep -H -r  "Updated:" $fichier | awk '{print $6}'` = $nom ]] ||
						 [[ `grep -H -r  "By:" $fichier | awk '{print $3}'` = $nom ]]; then
						((present++))
						printf "\n      ${blanc}$fichier"
						fi
					done
					printf "\n\nTouch any key to continue...\n"
					read -p " " yn
					if [ $present = 0 ]; then
						header
						printf "\n    ${rougefonce} WARNING: ${blanc} More then 1 name finded in header.${vertclair}\n"
						while read line
						do
							printf "\n     $line"
							((auteure++))
						done < .42Checker_2021_Header_Sort
						printf "\n\n ${blanc}   📝 Enter the name you want to search for :${vertclair}\n\n"
						printf "         ${rougefonce}⁉️  ${vertclair}$nom ${rougefonce}does not appear in any Header"
					fi
					printf "\n"
					break;;
        		[Nn]* ) printf "\n${rougefonce} 😕 Header details ignored"
					sleep 1;
					header
					break;;
        		* ) header
					printf "\n${rougefonce}                                            ❌ Please enter yes or no (y/n)"
					printf "\n ${blanc}   📝 Header Created by :${vertclair}"
					while read line
					do
						printf "\n     $line"
						((auteure++))
					done < .42Checker_2021_Header_Sort;;
    			esac
			done
			else
						printf "\n ${blanc}   🛂 Header ${vertclair}OK"
						goodheader=1
			fi
			rm .42Checker_2021_Header
			rm .42Checker_2021_Header_Sort

if hash norminette 2>/dev/null; then
sleep 1

# if [[ `grep -H -r  "Created:" $fichier | awk '{print $6}'` = $nom ]] ||
header
printf "\n"
if (( $u < 10 ))
   then
	nombreb4='\b'
fi
if (( $u < 100 ))
   then
	nombreb4='\b\b'
fi
if (( $u < 1000 ))
   then
	nombreb4='\b\b\b'
fi
for fichier in $(find . -type f -iname "*.c" -o -iname "*.h" | grep -v "^./${ignorefiles}" | grep -v "^./${ignorefilesdeux}")
 do
   line=$(norminette $fichier)
 if (( $u < 10 ))
   then
   	printf "${nombreb4}${blanc}\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b${sp:i++%${#sp}:1} ${u}/${inall} Files Norme Checked"
   elif (( $u < 100))
   then
   	printf "${nombreb4}${blanc}\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b${sp:i++%${#sp}:1} ${u}/${inall} Files Norme Checked"
   else
	printf "${nombreb4}${blanc}\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b${sp:i++%${#sp}:1} ${u}/${inall} Files Norme Checked"
   fi
   ((u++))
   output=$(echo $line | grep -o "Error" | wc -l)
	if [ $output != 0 ]; then
		((error++))
		((errorinfile++))
		((ko++))
		echo $line >> savenorme
		printf "\n${rougefonce} ⚠️  ${vertclair}$fichier ${rougefonce}Norme Error\n"
		goodnorme=-1
		sleep 2
	fi
done
header
printf "\n"
   if (( $u < 10 ))
   then
   	printf "  🎉 ${blanc} ${u} Files Checked"
   elif (( $u < 100))
   then
   	printf "  🎉 ${blanc} ${u} Files Checked"
   else
	printf "  🎉 ${blanc} ${u} Files Checked"
   fi
# if [ -e savenorme ]
# then
# while read line
# do
# 	var1=$(echo $line | grep Error)
# 	if [[ `echo $line | grep -o "Error"` = "Error" ]]; then
# 		((error++))
# 		((errorinfile++))
# 	fi
# 	if [[ `echo $line | grep -o "Error"` = "Error" ]] && [[ "$var3" != "false" ]]; then
# 		printf "\n    💥 ${blanc} $var2 ${neutre}> ${rougefonce}$(echo $line | cut -c7-)"
# 		((ko++))
# 	fi
# 	if [[ `echo $line | grep -o "Norme"` = "Norme" ]]; then
# 		if (( $errorinfile > 0)); then printf "${blanc} + $errorinfile"; fi
# 		var2=$(echo $line | cut -c10-)
# 		var3=$(echo $line | cut -c10-)
# 		((errorinfile = -1))
# 	else
# 		var3="false"
# 		((ok++))
# 	fi
# done < savenorme
#fi
if (( $goodnorme == 1 )); then
	printf "  👍 ${vertclair} ${u} Norminette OK\n\n"
	goodnorme=1
# 	if [ -e savenorme ]
# 	then
# 		rm savenorme
# fi
fi
if (( $goodnorme != 0 )); then
	printf "\n\n   😰 ${rougefonce} ${ko} File(s) with ${error} norme(s) error\n     ${blanc}  /cat savenorme for more info\n\n"
	read -p " Press any key to continue"
else
	goodnorme=1
fi

    else
        # printf "\n\n ${blanc}   😿 ${rougefonce}Error :${blanc} Norminette Not Found.${vertclair}\n"
		norminettenotfound=1
fi
#touch key to continue

 ##############################################################################################################

			header
			if [ -f Makefile ]
			then
				printf "\n ${blanc}   📝 Makefile clean : ${neutre} \n\n\n"
				make fclean
				printf "\n ${blanc}   📝 Makefile all : ${neutre} \n\n"
				make
				output=$(make)
				#if output containing more then 1 line
				outtest=$(echo "$output" | wc -l)
				#check if outtest is different from 1
				if [ $outtest != 1 ]
				then
					printf "\n ${blanc}   📝 Make all again : ${neutre} \n\n"
					printf "\n     ${rougefonce} ✖ $output\n"
					printf "\n\n ${rougefonce} ✖ ${blanc}Please check this make output bellow\n        The code must not be compiled again.\n\n"
					printf "\n\n ${blanc}   🛂 Makefile ${orange}FAILED?${blanc} : More than 1 line detected when make again\n"
					
				else
					output3=$(find . -type f -iname "*.c" | tail -n 1)
					header
					printf "\n ${blanc}   📝 Testing relink by adding empty line in ${blanc}: ${vertclair}$output3${blanc}\n"
					printf "\n" >> $output3
					output1=$(make)
					outtest=$(echo "$output1" | wc -l)
				    #check if outtest is different 
					if [ $outtest != 1 ]
					then
						header
						printf "\n ${blanc}   🛂 Makefile ${vertclair}PERFECT${blanc}\n"
						goodmakefile=1
					else
					printf "\n     ${rougefonce} ✖ $output"
					printf "\n\n\n\n ${blanc}   🛂 Makefile ${rougefonce}FAILED${blanc} : relink detected\n"
					fi 
				fi
			else
				printf "\n ${rougefonce}  ❌ Makefile ${vertclair}NOT FOUND\n"
			fi
						if [ -f Makefile ]
			then
            flag=$(cat Makefile | grep Wall)
            printf "\n\n${blanc}    🛂 Makefile flag :${vertclair}"
            wall=$(cat Makefile | grep "Wall" | wc -l)
            if [ $wall -eq 1 ]
            then
                printf "${blanc} Wall ${vertclair}✔️${blanc}"
            else
                printf "${rougefonce} Wall ❌"
            fi
            wextra=$(cat Makefile | grep "Wextra" | wc -l)
            if [ $wextra -eq 1 ]
            then
                printf "${blanc} Wextra ${vertclair}✔️${blanc}"
            else
                printf "${rougefonce} Wextra ❌"
            fi
            werror=$(cat Makefile | grep "Werror" | wc -l)
            if [ $werror -eq 1 ]
            then
                printf "${blanc} Werror ${vertclair}✔️${blanc}"
            else
                printf "${rougefonce} Werror ❌"
            fi
            fi
			printf "\n"

			# if good norme is ok then output OK
if (( $auteur == 1 ))
then
	printf "\n ${blanc}   🛂 Header ${vertclair}OK${blanc}\n"
else
	printf "\n ${blanc}   🛂 Header ${rougefonce}FAILED ($auteur names find) ${blanc}\n"
fi
if (( $goodnorme == 1))
then
	printf "\n ${blanc}   🛂 Norme ${vertclair}OK${blanc}\n"
else
	if (( $norminettenotfound == 1 ))
	then
		printf "\n ${blanc}   🛂 Norme ${vertclair}NOT INSTALLED${blanc}\n"
	else
		printf "\n ${blanc}   🛂 Norme ${rougefonce}FAILED${blanc}\n"
	fi
fi
printf "\n\n\n ${blanc}   🧬 Touch a key to open ${vertclair}${PWD##*/}${blanc} in ${bleu}Visual Studio Code${blanc}"
read -p " "
printf "\n ${blanc}   Opening..."
# if os is MAC, use open -a Visual\ Studio\ Code.app . else use code .
if [[ "$os" == "MAC" ]]; then
	open -a "Visual Studio Code.app" .
else
	code .
fi


printf "\n";

if [[ ${PWD##*/} == 'ft_printf' || ${PWD##*/} == 'printf' || ${PWD##*/} == 'my_printf' ]]
then
while true; do                                                 ## detection printf ??
	printf "\n${blanc} 📚 ${vertclair}PRINTF ${blanc}repo detected, do you want launch a tester ? (y/n)\n\n        "
    read -p " " yn
    case $yn in
        [Yy]* )
			header
			git clone https://github.com/Tripouille/printfTester.git
			cd printfTester
			header
			printf "\n\n${blanc}Running Printf tester... ${neutre}\n\n     "
			sleep 2
			make
			while true; do                                                                   ## DEMANDE DE DETAILS tester printf ?
				printf "\n\n${blanc}Want to check bonus ? ${neutre}(y/n)\n\n     "
    			read -p " " yn
    			case $yn in
        		[Yy]* )
					header
					make b
					break;;
        		[Nn]* ) printf "\n${rougefonce} 😕 Printf Tester details ignored"
					sleep 1;
					header
					break;;
        		* ) header
					printf "\n${rougefonce}                                            ❌ Please enter yes or no (y/n)"
    			esac
			done
			cd ..
			read -n 1 -s -r -p "Press any key to quit"
			rm -rf 42TESTERS-PRINTF
			break;;
        [Nn]* )
			header
			break;;
        * ) header
			printf "\n${rougefonce}                                            ❌ Please enter yes or no (y/n)"
    esac
done



##########################################################################################################################


elif [[ ${PWD##*/} == 'Cub3D' || ${PWD##*/} == 'cub3D' || ${PWD##*/} == 'cub3d' || ${PWD##*/} == 'CUB3D' ]]          ## Verification Cub3D
then
while true; do
	printf "\n${blanc} 📚 ${vertclair}Cub3D ${blanc}repo detected, do you want launch ${vertclair} humblEgo ♥ GitHub ${blanc}tester ? (y/n)\n\n        "
    read -p " " yn
    case $yn in
        [Yy]* )
			header
			git clone https://github.com/humblEgo/cub3D_map_tester.git
			cd cub3D_map_tester
			header
			printf "\n\n${blanc}Running Cub3D tester... ${neutre}\n\n     "
			sleep 2
			sh test_map_valid_function.sh
			cd ..
			read -n 1 -s -r -p "Press any key to quit"
			rm -rf cub3D_map_tester
			break;;
        [Nn]* )
			header
			break;;
        * ) header
			printf "\n${rougefonce}                                            ❌ Please enter yes or no (y/n)"
    esac
done

##########################################################################################################################

elif [[ ${PWD##*/} == 'LIBFT' || ${PWD##*/} == 'libft' || ${PWD##*/} == 'libft' || ${PWD##*/} == 'Libft' ]]          ## Verification Libft
then
while true; do
	printf "\n${blanc} 📚 ${vertclair}Libft ${blanc}repo detected, do you want launch ${vertclair} alelievr ♥ GitHub ${blanc}tester ? (y/n)\n\n        "
    read -p " " yn
    case $yn in
        [Yy]* )
			header
			cd ..
			git clone https://github.com/alelievr/libft-unit-test.git
			cd libft-unit-test
			make
			header
			printf "\n\n${blanc}Running LIBFT tester... ${neutre}\n\n     "
			sleep 2
			./run_test
			cd ..
			while true; do                                                                   ## DEMANDE DE SPLIT tester Libft ?
				printf "\n\n${blanc}Do you want launch ${vertclair} Ysoroko ♥ GitHub ${blanc}SPLIT tester ? "
    			read -p " " yn
    			case $yn in
        		[Yy]* )
					cd libft
					git clone https://github.com/Ysoroko/FT_SPLIT_TESTER.git
					cd FT_SPLIT_TESTER
					make
					cd ..
					rm -rf FT_SPLIT_TESTER
					break;;
        		[Nn]* ) printf "\n${rougefonce} 😕 Split Tester ignored"
					sleep 1;
					header
					break;;
        		* ) header
					printf "\n${rougefonce}                                            ❌ Please enter yes or no (y/n)"
    			esac
			done
			read -n 1 -s -r -p "Press any key to quit"
			rm -rf libft-unit-test
			break;;
        [Nn]* )
			header
			break;;
        * ) header
			printf "\n${rougefonce}                                            ❌ Please enter yes or no (y/n)"
    esac
done

#######################################################################################################################

elif [[ ${PWD##*/} == 'GNL' || ${PWD##*/} == 'get_next_line' || ${PWD##*/} == 'GET_NEXT_LINE' || ${PWD##*/} == 'GNL' ]]          ## Verification GNL
then
while true; do
	printf "\n${blanc} 📚 ${vertclair}GNL ${blanc}repo detected, do you want launch ${vertclair} Mazoise ♥ GitHub ${blanc}tester ? (y/n)\n\n        "
    read -p " " yn
    case $yn in
        [Yy]* )
			header
			git clone https://github.com/Mazoise/42TESTERS-GNL.git
			cd 42TESTERS-GNL
			header
			printf "\n\n${blanc}Running GNL tester ... ${neutre}\n\n     "
			sh all_tests.sh
			read -n 1 -s -r -p "Press any key to continue to next test"
			sh runHUGE.sh
			read -n 1 -s -r -p "Press any key to continue to next test"
			sh runSTDIN+LEAKS.sh
			while true; do                                                                   ## DEMANDE DE Test GNL Bonus ?
				printf "\n\n${blanc}Do you want launch the bonus parts tests ? "
    			read -p " " yn
    			case $yn in
        		[Yy]* )
					sh all_tests_with_bonus.sh
					break;;
        		[Nn]* ) printf "\n${rougefonce} 😕 Bonus parts tester ignored"
					sleep 1;
					header
					break;;
        		* ) header
					printf "\n${rougefonce}                                            ❌ Please enter yes or no (y/n)"
    			esac
			done
			read -n 1 -s -r -p "Press any key to quit"
			rm -rf 42TESTERS-GNL
			break;;
        [Nn]* )
			header
			break;;
        * ) header
			printf "\n${rougefonce}                                            ❌ Please enter yes or no (y/n)"
    esac
done

############################################################################################# TESTER PUSH_SWAP

elif [[ ${PWD##*/} == 'pushswap' || ${PWD##*/} == 'push_swap' || ${PWD##*/} == 'ft_push_swap' || ${PWD##*/} == 'PUSH_SWAP' ]]
then
while true; do
	printf "\n${blanc} 📚 ${vertclair}Push_swap ${blanc}repo detected, do you want launch ${vertclair}besellem ♥ GitHub ${blanc}tester ? (y/n)\n\n        "
    read -p " " yn
    case $yn in
        [Yy]* )
			header
			git clone https://github.com/besellem/push_swap.git tester_besellem
			cp -r tester_besellem/py tester
			make
			rm -rf tester_besellem
			header
			printf "\n\n${blanc}Enter the number of arguments you want to test for push_swap : "
			read -p " " args
			printf "\n\n${blanc}Running 50 tests for Push_swap with $args arguments... ${neutre}\n\n     "
			python3 tester/check_range.py 0 $args
			while true; do                                                                   ## DEMANDE DE refaire un test ?
				printf "\n\n${blanc}Want to continue with another arguments ? ${neutre}(y/n)\n\n     "
    			read -p " " yn
    			case $yn in
        		[Yy]* )
					header
					printf "\n\n${blanc}Enter the number of arguments you want to test for push_swap : "
					read -p " " args
					printf "\n\n${blanc}Running Push_swap tester with $args arguments... ${neutre}\n\n     "
					python3 tester/check_range.py 0 $args
					continue;;
				[Nn]* ) printf "\n${rougefonce} Exit tester..."
					header
					break;;
				* ) header
					printf "\n${rougefonce}                                            ❌ Please enter yes or no (y/n)"
				esac
			done
			rm -rf tester
			break;;
        [Nn]* )
			header
			break;;
        * ) header
			printf "\n${rougefonce}                                            ❌ Please enter yes or no (y/n)"
    esac
done

else
	printf "\n${blanc}Can't find a tester for : ${vertclair}${PWD##*/}${blanc} 42 project :(\nTips: the folder need to have the name of the project.\n\nUse : ${vertclair}mv ${PWD##*/} [name_of_project]${blanc}\n\n"
fi

clear
printf "\n${vertclair}       _  _  ____   ____ _               _               ____   ___ ____  ____
     | || ||___ \ / ___| |__   ___  ___| | _____ _ __  |___ \ / _ \___ \/\___ \\
     | || |_ __) | |   | '_ \ / _ \/ __| |/ / _ \ '__|   __) | | | |__) | |__) |
     |__   _/ __/| |___| | | |  __/ (__|   <  __/ |     / __/| |_| / __/|/ __/ |
        |_||_____|\____|_| |_|\___|\___|_|\_\___|_|    |_____|\___/_____/_____/ \n\n                            Made with ${rougefonce}♥ ${vertclair}by ${orange}jcluzet${neutre}\n\n Use this command to launch tester : ${blanc}bash -c \"\$(curl -L grademe.fr)\"\n\n${neutre}"

printf "\n👋 ${blanc}This script is not an official correction, do not grade ${vertclair}${version}${blanc} on our ${rougefonce}criteria${blanc}.\n"
printf "Check by ${vertclair}yourself ${blanc}and don't be too ${rougefonce}rigorous${blanc}.\n\n"
fi