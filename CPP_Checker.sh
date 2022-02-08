# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    CPP_Checker.sh                                     :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: jcluzet <jcluzet@student.42.fr>            +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2021/02/13 00:44:50 by jcluzet           #+#    #+#              #
#    Updated: 2022/02/09 00:32:14 by jcluzet          ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

#!/bin/bash

i=6
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

souligne="\033[4m"
rougefonce='\033[0;31m'
vertfonce='\033[0;32m'
vertclair='\033[1;32m'
orange='\033[0;33m'
blanc='\033[1;37m'
neutre='\033[0;m'
bleu='\033[0;34m'
version=$LOGNAME
cpp=-1

header() {
	clear

	printf "\n${vertclair}       _  _  ____   ____ _               _               ____   ___ ____  ____
     | || ||___ \ / ___| |__   ___  ___| | _____ _ __  |___ \ / _ \___ \/\___ \\
     | || |_ __) | |   | '_ \ / _ \/ __| |/ / _ \ '__|   __) | | | |__) | |__) |
     |__   _/ __/| |___| | | |  __/ (__|   <  __/ |     / __/| |_| / __/|/ __/ |
        |_||_____|\____|_| |_|\___|\___|_|\_\___|_|    |_____|\___/_____/_____/ \n"

	printf "\n"

	if [ $ignorefiles = 'vdin3irn3dubhwbuy3bru2ruy23b32uyrv23bur32' ] && [ $ignorefilesdeux = 'vdin3irn3dubhwbuy3bru2ruy23b32uyrv23bur32' ]; then
		printf "      Student : ${blanc}${version}      ${vertclair}CPP0${cpp} ${blanc}> ${vertclair}${thatscpp} ${blanc}Files${neutre} 🔦      🔧 ${vertclair}CPP${blanc} Correction on ${orange}${os}${neutre}\n"
	fi

	if [ $ignorefiles != 'vdin3irn3dubhwbuy3bru2ruy23b32uyrv23bur32' ] && [ $ignorefilesdeux = 'vdin3irn3dubhwbuy3bru2ruy23b32uyrv23bur32' ]; then
		printf "      Student : ${blanc}${version} ${vertclair}CPP0${cpp}${blanc} without ${rougefonce}${ignorefiles} ${blanc}> ${vertclair}${thatscpp} ${blanc}Files${neutre} 🔦    🔧 ${vertclair}$os${blanc} Correction\n"
	fi

	if [ $ignorefiles != 'vdin3irn3dubhwbuy3bru2ruy23b32uyrv23bur32' ] && [ $ignorefilesdeux != 'vdin3irn3dubhwbuy3bru2ruy23b32uyrv23bur32' ]; then
		printf "         Student : ${blanc}${version} ${vertclair}CPP0${cpp}${blanc} without ${rougefonce}${ignorefiles}${blanc}, ${rougefonce}${ignorefilesdeux} ${blanc}> ${vertclair}${thatscpp} ${blanc}Files${neutre} 🔦"
	fi
	printf "\n"

}

header
if [ "$(uname)" == "Darwin" ]; then
	os="MAC"
else
	os="LINUX"
fi

if [ -f "./ex00/megaphone.cpp" ]; then
	if [ $os == "MAC" ]; then
		printf "\n${orange} 📎 Opening ${vertclair}42 CPP00 Project${blanc} in your browser\n\n"
		sleep 1
		open https://projects.intra.42.fr/cpp-module-00/mine
	else
		printf "\n${orange} 📎 Opening ${vertclair}42 CPP00 Project${blanc} in your browser\n\n"
		sleep 1
		xdg-open https://projects.intra.42.fr/cpp-module-00/mine
	fi
	cpp=0
fi
# if there is a ex00/Zombie.hpp or ex00/zombie.hpp, it's CPP1
if [ -f "./ex00/Zombie.hpp" ] || [ -f "./ex00/zombie.hpp" ]; then
	if [ $os == "MAC" ]; then
		printf "\n${orange} 📎 Opening ${vertclair}42 CPP01 Project${blanc} in your browser\n\n"
		sleep 1
		open https://projects.intra.42.fr/cpp-module-01/mine
	else
		printf "\n${orange} 📎 Opening ${vertclair}42 CPP01 Project${blanc} in your browser\n\n"
		sleep 1
		xdg-open https://projects.intra.42.fr/cpp-module-01/mine
	fi
	cpp=1
fi
# if there is a ex00/Fixed.hpp or ex00/fixed.hpp, it's CPP2
if [ -f "./ex00/Fixed.hpp" ] || [ -f "./ex00/fixed.hpp" ]; then
	if [ $os == "MAC" ]; then
		printf "\n${orange} 📎 Opening ${vertclair}42 CPP02 Project${blanc} in your browser\n\n"
		sleep 1
		open https://projects.intra.42.fr/cpp-module-02/mine
	else
		printf "\n${orange} 📎 Opening ${vertclair}42 CPP02 Project${blanc} in your browser\n\n"
		sleep 1
		xdg-open https://projects.intra.42.fr/cpp-module-02/mine
	fi
	cpp=2
fi
# if there is a ex00/ClapTrap.hpp or ex00/clapTrap.hpp, it's CPP3
if [ -f "./ex00/ClapTrap.hpp" ] || [ -f "./ex00/clapTrap.hpp" ]; then
	if [ $os == "MAC" ]; then
		printf "\n${orange} 📎 Opening ${vertclair}42 CPP03 Project${blanc} in your browser\n\n"
		sleep 1
		open https://projects.intra.42.fr/cpp-module-03/mine
	else
		printf "\n${orange} 📎 Opening ${vertclair}42 CPP03 Project${blanc} in your browser\n\n"
		sleep 1
		xdg-open https://projects.intra.42.fr/cpp-module-03/mine
	fi
	cpp=3
fi
# i there is a ex00/Dog.hpp or ex00/dog.hpp, it's CPP4
if [ -f "./ex00/Dog.hpp" ] || [ -f "./ex00/dog.hpp" ]; then
	if [ $os == "MAC" ]; then
		printf "\n${orange} 📎 Opening ${vertclair}42 CPP04 Project${blanc} in your browser\n\n"
		sleep 1
		open https://projects.intra.42.fr/cpp-module-04/mine
	else
		printf "\n${orange} 📎 Opening ${vertclair}42 CPP04 Project${blanc} in your browser\n\n"
		sleep 1
		xdg-open https://projects.intra.42.fr/cpp-module-04/mine
	fi
	cpp=4
fi
# if there is a ex00/Bureaucrat.hpp or ex00/bureaucrat.hpp, it's CPP5
if [ -f "./ex00/Bureaucrat.hpp" ] || [ -f "./ex00/bureaucrat.hpp" ]; then
	if [ $os == "MAC" ]; then
		printf "\n${orange} 📎 Opening ${vertclair}42 CPP05 Project${blanc} in your browser\n\n"
		sleep 1
		open https://projects.intra.42.fr/cpp-module-05/mine
	else
		printf "\n${orange} 📎 Opening ${vertclair}42 CPP05 Project${blanc} in your browser\n\n"
		sleep 1
		xdg-open https://projects.intra.42.fr/cpp-module-05/mine
	fi
	cpp=5
fi
# if there is a ex00/whatever.hpp, it's CPP7
if [ -f "./ex00/whatever.hpp" ]; then
	if [ $os == "MAC" ]; then
		printf "\n${orange} 📎 Opening ${vertclair}42 CPP07 Project${blanc} in your browser\n\n"
		sleep 1
		open https://projects.intra.42.fr/cpp-module-07/mine
	else
		printf "\n${orange} 📎 Opening ${vertclair}42 CPP07 Project${blanc} in your browser\n\n"
		sleep 1
		xdg-open https://projects.intra.42.fr/cpp-module-07/mine
	fi
	cpp=7
fi
#if there is a easyfind.hpp, it's CPP8
if [ -f "./ex00/easyfind.hpp" ]; then
	if [ $os == "MAC" ]; then
		printf "\n${orange} 📎 Opening ${vertclair}42 CPP08 Project${blanc} in your browser\n\n"
		sleep 1
		open https://projects.intra.42.fr/cpp-module-08/mine
	else
		printf "\n${orange} 📎 Opening ${vertclair}42 CPP08 Project${blanc} in your browser\n\n"
		sleep 1
		xdg-open https://projects.intra.42.fr/cpp-module-08/mine
	fi
	cpp=8
fi
# if cpp still -1, then do a make test and check if there is a convert executable
if [ $cpp -eq -1 ]; then
	printf "${vertclair}Checking if there is a convert executable\n"
	cd ex00
	make
	if [ -f "./convert" ]; then
		if [ $os == "MAC" ]; then
			printf "\n${orange} 📎 Opening ${vertclair}42 CPP06 Project${blanc} in your browser\n\n"
			sleep 1
			open https://projects.intra.42.fr/cpp-module-06/mine
		else
			printf "\n${orange} 📎 Opening ${vertclair}42 CPP06 Project${blanc} in your browser\n\n"
			sleep 1
			xdg-open https://projects.intra.42.fr/cpp-module-06/mine
		fi
		cpp=6
		cd ..
	fi
	make fclean
fi
if [ $cpp -eq -1 ]; then
	printf "${rougefonce}No module detected\n"
fi

# detect if os is linux or mac
if [ "$(uname)" == "Darwin" ]; then
	os="MAC"
else
	os="LINUX"
fi

# if os is mac,

for fichier in $(find . -type f -iname "*.c" -o -iname "*.h" | grep -v "^./${ignorefiles}/" | grep -v "^./${ignorefilesdeux}/"); do
	((thatsc++))
done
for fichier in $(find . -type f -iname "*.cpp" -o -iname "*.hpp" | grep -v "^./${ignorefiles}/" | grep -v "^./${ignorefilesdeux}/"); do
	((thatscpp++))
done

checkforbidden() {
	coplienform
	forbidden=0
	for fichier in $(find . -type f -iname "*.cpp" -o -iname "*.hpp" | grep -v "^./${ignorefiles}/" | grep -v "^./${ignorefilesdeux}/"); do
		output=$(cat $fichier | grep -w "printf" | wc -l)
		# if diffeernt than 0
		if [ $output -ne 0 ]; then
			printf "\n${blanc}     🛂 FORBIDDEN FUNCTION : ${rougefonce}ERROR${blanc} printf using in ${vertclair}$fichier\n"
			((forbidden++))
		fi
		class=$(cat $fichier | grep -w "alloc" | wc -l)
		if [ $class -ne 0 ]; then
			printf "\n${blanc}     🛂 FORBIDDEN FUNCTION : ${rougefonce}ERROR${blanc} alloc using in ${vertclair}$fichier\n"
			((forbidden++))
		fi
		class=$(cat $fichier | grep -w "free" | wc -l)
		if [ $class -ne 0 ]; then
			printf "\n${blanc}     🛂 FORBIDDEN FUNCTION : ${rougefonce}ERROR${blanc} free using in ${vertclair}$fichier\n"
			((forbidden++))
		fi
		class=$(cat $fichier | grep -w "using" | grep -w "namespace" | wc -l)
		if [ $class -ne 0 ]; then
			printf "\n${blanc}     🛂 FORBIDDEN FUNCTION : ${rougefonce}ERROR${blanc} ${rougefonce}using namespace${blanc} detected in ${vertclair}$fichier\n"
			((forbidden++))
		fi
		class=$(cat $fichier | grep -w "friend" | wc -l)
		if [ $class -ne 0 ]; then
			printf "\n${blanc}     🛂 FORBIDDEN FUNCTION : ${rougefonce}ERROR${blanc} ${rougefonce}friend${blanc} detected in ${vertclair}$fichier\n"
			((forbidden++))
		fi
		if [ $forbidden -eq 0 ]; then
			printf "\n${blanc}     🛂 FORBIDDEN FUNCTION : ${vertclair}PERFECT${blanc}\n"
			((forbidden++))
		fi
	done
}

coplienform() {
	coplien=0
	output7=0
	over=0
	if [ $cpp -ge 2 ]; then
		for fichier in $(find . -type f -iname "*.hpp" | grep -v "^./${ignorefiles}/" | grep -v "^./${ignorefilesdeux}/"); do
		if [ $fichier != "./easyfind.hpp" ]; then
			coplien=0
			class=$(echo $fichier | rev | cut -c 5- | rev)
			class=$(echo $class | cut -c 3-)
			printf "\n\n${blanc}       ${souligne}Class ${vertclair}$class${neutre}${blanc} ($fichier) :\n"
			output=$(cat $fichier | grep "$class(void)" | grep -v "~" | wc -l)
			output7=$(cat $fichier | grep "$class()" | grep -v "~" | wc -l)
			output2=$(cat $fichier | grep "~$class(" | wc -l)
			output3=$(cat $fichier | grep "$class" | grep -w "operator=" | wc -l)
			output4=$(cat $fichier | grep "operator<<" | wc -l)
			#if $output eq 0 and #output7 eq 0
			if [ $output -eq 0 ] && [ $output7 -eq 0 ]; then
				printf "\n${blanc}     🛂 COPLIEN FORM : ${rougefonce}ERROR${blanc} $class() missing\n"
				((coplien++))
			fi
			if [ $output2 -eq 0 ]; then
				printf "\n${blanc}     🛂 COPLIEN FORM : ${rougefonce}ERROR${blanc} ~$class() missing\n"
				((coplien++))
			fi
			if [ $output3 -eq 0 ]; then
				printf "\n${blanc}     🛂 COPLIEN FORM : ${rougefonce}ERROR${blanc} $class& operator= missing\n"
				((coplien++))
			fi
			if [ $output4 -eq 0 ]; then
				printf "\n${blanc}     🛂 COPLIEN FORM : ${orange}WARNING${blanc} operator<< missing\n"
			fi
			if [ $coplien -eq 0 ]; then
				printf "\n${blanc}     🛂 COPLIEN FORM : ${vertclair}PERFECT${blanc}\n"
			fi
		else
			printf "\n${blanc}     🛂 COPLIEN FORM : ${vertclair}NO NEEDED\n\n"
		fi
		
		done
	else
		printf "\n${blanc}     🛂 COPLIEN FORM : ${vertclair}NO NEEDED\n\n"
	fi
}

makecheck() {
	printf "\n ${blanc}    📌 ${blanc}${vertclair}${PWD##*/} :\n\n"
	if [ -f Makefile ]; then
		flag=$(cat Makefile | grep Wall)
		printf "\n${blanc}     📜 Makefile flag :${vertclair} "
		wall=$(cat Makefile | grep "Wall" | wc -l)
		if [ $wall -eq 1 ]; then
			printf "${vertclair}Wall${vertclair}${blanc}"
		else
			printf "${blanc}${rougefonce} Wall ${vertclair}❌${blanc}"
		fi
		wextra=$(cat Makefile | grep "Wextra" | wc -l)
		if [ $wextra -eq 1 ]; then
			printf " ${blanc}|${vertclair} Wextra${blanc}"
		else
			printf " ${blanc}|${rougefonce} Wextra ❌${blanc}"
		fi
		werror=$(cat Makefile | grep "Werror" | wc -l)
		if [ $werror -eq 1 ]; then
			printf "${blanc} | ${vertclair}Werror${blanc}"
		else
			printf " ${blanc}|${rougefonce} Werror ❌${blanc}"
		fi
		std=$(cat Makefile | grep "std=c++98" | wc -l)
		if [ $std -eq 1 ]; then
			printf " ${blanc}| ${vertclair}std=c++98${blanc}"
		else
			printf " ${blanc}|${rougefonce} std=c++98 ❌"
		fi
		gplus=$(cat Makefile | grep "g++" | grep -v "clang" | wc -l)
		clang=$(cat Makefile | grep "clang++" | grep -v "std" | wc -l)
		cplus=$(cat Makefile | grep "c++" | grep -v "std" | wc -l)
		if [ $gplus -eq 1 ]; then
			printf "${rougefonce} g++ ${blanc}"
		fi
		if [ $clang -eq 1 ]; then
			printf "${blanc} |${vertclair} clang++ ${blanc}"
		fi
		if [ $cplus -eq 1 ]; then
			printf "${blanc} |${vertclair} c++ ${blanc}"
		fi
	fi
	printf "\n\n"
	# 	printf "\n ${blanc}   📝 Makefile clean : ${neutre} \n\n\n"
	# 	make fclean
	# 	printf "\n ${blanc}   📝 Makefile all : ${neutre} \n\n"
	# 	make
	# 	output=$(make)
	# 	#if output containing more then 1 line
	# 	outtest=$(echo "$output" | wc -l)
	# 	#check if outtest is different from 1
	# 	if [ $outtest != 1 ]
	# 	then
	# 		printf "\n ${blanc}   📝 Make all again : ${neutre} \n\n"
	# 		printf "\n     ${rougefonce} ✖ $output\n"
	# 		printf "\n\n ${rougefonce} ✖ ${blanc}Please check this make output bellow\nThe code must not be compiled again.\n\n"
	# 		printf "\n\n ${blanc}   🛂 Makefile ${orange}FAILED?${blanc} : More than 1 line detected when make again\n"

	# 	else
	# 		output3=$(find . -type f -iname "*.cpp" | tail -n 1)
	# 		header
	# 		printf "\n ${blanc}   📝 Testing relink by adding empty line in ${blanc}: ${vertclair}$output3${blanc}\n"
	# 		printf "\n//This is a Makefile Relink test\n" >> $output3
	# 		output1=$(make)
	# 		outtest=$(echo "$output1" | wc -l)
	# 	    #check if outtest is different
	# 		if [ $outtest -ne 1 ]
	# 		then
	# 			header
	# 			printf "\n ${blanc}    🛂 Makefile ${vertclair}PERFECT${blanc}\n"
	# 			goodmakefile=1
	# 		else
	# 		printf "\n     ${rougefonce} ✖ $output"
	# 		printf "\n\n\n\n ${blanc}    🛂 Makefile ${rougefonce}FAILED${blanc} : relink detected\n"
	# 		fi
	# 	fi
	# else
	# 	printf "\n ${rougefonce}  ❌ Makefile ${vertclair}NOT FOUND\n"
	# fi
}

# if there is a ex00 folder in the current folder, we go in it

ex=0
while [ -d "ex0$ex" ]; do
	header
	cd "ex0$ex"
	makecheck
	checkforbidden
	cd ..
	printf "\n\n\n ${blanc}    🧬 Touch a key to open in ${bleu}Visual Studio Code${blanc} or 'n' to skip\n"
	read -rsn1 -p " " value
	# if value is not n

	if [ "$value" != "n" ]; then
		printf "\n ${blanc}   Opening...\n"

		if [[ "$os" == "MAC" ]]; then
			open -a "Visual Studio Code.app" ex0$ex
		else
			code ex0$ex
		fi
		ex1=$(($ex + 1))
		if [ -d "ex0$ex1" ]; then
			printf "\n ${blanc}   🧬 Touch a key to continue to ${vertclair}ex0$ex1${blanc}\n"
			read -n 1 -s -r "" value
		fi
	fi
	ex=$((ex + 1))
done

if [ $ex -ne 0 ]; then
	ex=$((ex - 1))
fi

printf "\n\n        ${vertclair}ex0$ex${blanc} is the ${rougefonce}last ${blanc}exercice.\n        Tap to exit\n"
read -n 1 -s -r "" value

# detect what is the last exxx folder

clear
printf "\n${vertclair}       _  _  ____   ____ _               _               ____   ___ ____  ____
     | || ||___ \ / ___| |__   ___  ___| | _____ _ __  |___ \ / _ \___ \/\___ \\
     | || |_ __) | |   | '_ \ / _ \/ __| |/ / _ \ '__|   __) | | | |__) | |__) |
     |__   _/ __/| |___| | | |  __/ (__|   <  __/ |     / __/| |_| / __/|/ __/ |
        |_||_____|\____|_| |_|\___|\___|_|\_\___|_|    |_____|\___/_____/_____/ \n\n                            Made with ${rougefonce}♥ ${vertclair}by ${orange}jcluzet${neutre}\n\n Use this command to launch tester : ${blanc}bash -c \"\$(curl -L grademe.fr)\"\n\n${neutre}"

printf "\n ${blanc}Last exercice made : ${vertclair}ex0$ex${blanc}\n"
printf "\n👋 ${blanc}This script is not an official correction, do not grade ${vertclair}${version}${blanc} on our ${rougefonce}criteria${blanc}.\n"
printf "Check by ${vertclair}yourself ${blanc}and don't be too ${rougefonce}rigorous${blanc}.\n\n"
exit 0