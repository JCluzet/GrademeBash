# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    cpp                                                :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: jcluzet <mprigent@student.42.fr>          +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2021/02/13 00:44:50 by jcluzet           #+#    #+#              #
#    Updated: 2022/05/19 19:27:38 by jcluzet         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

#!/bin/bash

i=6
u=0
goodheader=0
nocoplien=0
cluster=$(echo $SESSION_MANAGER | cut -c 7- | sed "s/.clusters.42paris.fr/                      /g" | cut -c -10 | sed "s/ //g")
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
userpost="user=$LOGNAME" 
date=$(date '+%F_%H:%M:%S')
time="time=$date"
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

	printf "\n${vertclair} ______     ______     ______     _____     ______     __    __     ______    
/\  ___\   /\  == \   /\  __ \   /\  __-.  /\  ___\   /\ \"-./  \   /\  ___\  
\ \ \__ \  \ \  __<   \ \  __ \  \ \ \/\ \ \ \  __\   \ \ \-./\ \  \ \  __\   
 \ \_____\  \ \_\ \_\  \ \_\ \_\  \ \____-  \ \_____\  \ \_\ \ \_\  \ \_____\ 
  \/_____/   \/_/ /_/   \/_/\/_/   \/____/   \/_____/   \/_/  \/_/   \/_____/\n"

	printf "\n"
    if [ $cpp -eq -1 ]; then
        printf "      Student : ${blanc}${version}              ${vertclair}CPP?? ${blanc}           🔧 ${vertclair}CPP${blanc} Correction on ${orange}${os} ${cluster}${neutre}\n\n"
        return 0
    fi

	if [ $ignorefiles = 'vdin3irn3dubhwbuy3bru2ruy23b32uyrv23bur32' ] && [ $ignorefilesdeux = 'vdin3irn3dubhwbuy3bru2ruy23b32uyrv23bur32' ]; then
		printf "      Student : ${blanc}${version}      ${vertclair}CPP0${cpp} ${blanc}> ${vertclair}${thatscpp} ${blanc}Files${neutre} 🔦      🔧 ${vertclair}CPP${blanc} Correction on ${orange}${os} ${cluster}${neutre}\n"
	fi

	if [ $ignorefiles != 'vdin3irn3dubhwbuy3bru2ruy23b32uyrv23bur32' ] && [ $ignorefilesdeux = 'vdin3irn3dubhwbuy3bru2ruy23b32uyrv23bur32' ]; then
		printf "      Student : ${blanc}${version} ${vertclair}CPP0${cpp}${blanc} without ${rougefonce}${ignorefiles} ${blanc}> ${vertclair}${thatscpp} ${blanc}Files${neutre} 🔦    🔧 ${vertclair}${os} ${cluster}${blanc} Correction\n"
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

if [ -f "./ex00/megaphone.cpp" ] || [ -f "./ex00/src/megaphone.cpp" ]; then
    echo "Do you want to open correction page? (y to open)"
    read -r answer
    if [ "$answer" = "y" ]; then
	if [ $os == "MAC" ]; then
		printf "\n${orange} 📎 Opening ${vertclair}42 CPP00 Project${blanc} in your browser\n\n"
		sleep 1
		open https://projects.intra.42.fr/cpp-module-00/mine
	else
		printf "\n${orange} 📎 Opening ${vertclair}42 CPP00 Project${blanc} in your browser\n\n"
		sleep 1
		xdg-open https://projects.intra.42.fr/cpp-module-00/mine
	fi
    fi
	cpp=0
fi
# if there is a ex00/Zombie.hpp or ex00/zombie.hpp, it's CPP1
if [ -f "./ex00/Zombie.hpp" ] || [ -f "./ex00/zombie.hpp" ] || [ -f "./ex00/include/Zombie.hpp" ] || [ -f "./ex00/include/Zombie.hpp" ]; then
    echo "Do you want to open correction page? (y to open)"
    read -r answer
    if [ "$answer" = "y" ]; then
	if [ $os == "MAC" ]; then
		printf "\n${orange} 📎 Opening ${vertclair}42 CPP01 Project${blanc} in your browser\n\n"
		sleep 1
		open https://projects.intra.42.fr/cpp-module-01/mine
	else
		printf "\n${orange} 📎 Opening ${vertclair}42 CPP01 Project${blanc} in your browser\n\n"
		sleep 1
		xdg-open https://projects.intra.42.fr/cpp-module-01/mine
	fi
    fi
	cpp=1
fi
# if there is a ex00/Fixed.hpp or ex00/fixed.hpp, it's CPP2
if [ -f "./ex00/Fixed.hpp" ] || [ -f "./ex00/fixed.hpp" ]; then
    echo "Do you want to open correction page? (y to open)"
    read -r answer
    if [ "$answer" = "y" ]; then
	if [ $os == "MAC" ]; then
		printf "\n${orange} 📎 Opening ${vertclair}42 CPP02 Project${blanc} in your browser\n\n"
		sleep 1
		open https://projects.intra.42.fr/cpp-module-02/mine
	else
		printf "\n${orange} 📎 Opening ${vertclair}42 CPP02 Project${blanc} in your browser\n\n"
		sleep 1
		xdg-open https://projects.intra.42.fr/cpp-module-02/mine
	fi
    fi
	cpp=2
fi
# if there is a ex00/ClapTrap.hpp or ex00/clapTrap.hpp, it's CPP3
if [ -f "./ex00/ClapTrap.hpp" ] || [ -f "./ex00/clapTrap.hpp" ]; then
    echo "Do you want to open correction page? (y to open)"
    read -r answer
    if [ "$answer" = "y" ]; then
	if [ $os == "MAC" ]; then
		printf "\n${orange} 📎 Opening ${vertclair}42 CPP03 Project${blanc} in your browser\n\n"
		sleep 1
		open https://projects.intra.42.fr/cpp-module-03/mine
	else
		printf "\n${orange} 📎 Opening ${vertclair}42 CPP03 Project${blanc} in your browser\n\n"
		sleep 1
		xdg-open https://projects.intra.42.fr/cpp-module-03/mine
	fi
    fi
	cpp=3
fi
# i there is a ex00/Dog.hpp or ex00/dog.hpp, it's CPP4
if [ -f "./ex00/Dog.hpp" ] || [ -f "./ex00/dog.hpp" ]; then
    echo "Do you want to open correction page? (y to open)"
    read -r answer
    if [ "$answer" = "y" ]; then
	if [ $os == "MAC" ]; then
		printf "\n${orange} 📎 Opening ${vertclair}42 CPP04 Project${blanc} in your browser\n\n"
		sleep 1
		open https://projects.intra.42.fr/cpp-module-04/mine
	else
		printf "\n${orange} 📎 Opening ${vertclair}42 CPP04 Project${blanc} in your browser\n\n"
		sleep 1
		xdg-open https://projects.intra.42.fr/cpp-module-04/mine
	fi
    fi
	cpp=4
fi
# if there is a ex00/Bureaucrat.hpp or ex00/bureaucrat.hpp, it's CPP5
if [ -f "./ex00/Bureaucrat.hpp" ] || [ -f "./ex00/bureaucrat.hpp" ]; then
    echo "Do you want to open correction page? (y to open)"
    read -r answer
    if [ "$answer" = "y" ]; then
	if [ $os == "MAC" ]; then
		printf "\n${orange} 📎 Opening ${vertclair}42 CPP05 Project${blanc} in your browser\n\n"
		sleep 1
		open https://projects.intra.42.fr/cpp-module-05/mine
	else
		printf "\n${orange} 📎 Opening ${vertclair}42 CPP05 Project${blanc} in your browser\n\n"
		sleep 1
		xdg-open https://projects.intra.42.fr/cpp-module-05/mine
	fi
    fi
	cpp=5
fi
#if there is a ex00/BitcoinExchange or ex00/BitcoinExchange.hpp, it's CPP9
if [ -f "./ex00/BitcoinExchange.hpp" ] || [ -f "./ex00/BitcoinExchange" ]; then
    echo "Do you want to open correction page? (y to open)"
    read -r answer
    if [ "$answer" = "y" ]; then
    if [ $os == "MAC" ]; then
        printf "\n${orange} 📎 Opening ${vertclair}42 CPP09 Project${blanc} in your browser\n\n"
        sleep 1
        open https://projects.intra.42.fr/cpp-module-09/mine
    else
        printf "\n${orange} 📎 Opening ${vertclair}42 CPP09 Project${blanc} in your browser\n\n"
        sleep 1
        xdg-open https://projects.intra.42.fr/cpp-module-09/mine
    fi
    fi
    cpp=9
fi


# if there is a ex00/whatever.hpp, it's CPP7
if [ -f "./ex01/iter.hpp" ] || [ -f "./ex01/Iter.hpp" ] || [ -f "./ex01/Iter.tpp" ] || [ -f "./ex01/iter.tpp" ]; then
    echo "Do you want to open correction page? (y to open)"
    read -r answer
    if [ "$answer" = "y" ]; then
	if [ $os == "MAC" ]; then
		printf "\n${orange} 📎 Opening ${vertclair}42 CPP07 Project${blanc} in your browser\n\n"
		sleep 1
		open https://projects.intra.42.fr/cpp-module-07/mine
	else
		printf "\n${orange} 📎 Opening ${vertclair}42 CPP07 Project${blanc} in your browser\n\n"
		sleep 1
		xdg-open https://projects.intra.42.fr/cpp-module-07/mine
	fi
    fi
	cpp=7
fi
#if there is a easyfind.hpp, it's CPP8

if [ -f "./ex01/easyfind.hpp" ] || [ -f "./ex01/Easyfind.hpp" ]; then
    echo "Do you want to open correction page? (y to open)"
    read -r answer
    if [ "$answer" = "y" ]; then
	if [ $os == "MAC" ]; then
		printf "\n${orange} 📎 Opening ${vertclair}42 CPP08 Project${blanc} in your browser\n\n"
		sleep 1
		open https://projects.intra.42.fr/cpp-module-08/mine
	else
		printf "\n${orange} 📎 Opening ${vertclair}42 CPP08 Project${blanc} in your browser\n\n"
		sleep 1
		xdg-open https://projects.intra.42.fr/cpp-module-08/mine
	fi
    fi
	# nocoplien=1
	cpp=8
fi
path_s=$(find . -name "easyfind.hpp" -o -name "Easyfind.hpp" | head -n 1)
if [ $cpp -eq -1 ] && [ "$path_s" != "" ]; then
    echo "Do you want to open correction page? (y to open)"
    read -r answer
    if [ "$answer" = "y" ]; then
	if [ $os == "MAC" ]; then
		printf "\n${orange} 📎 Opening ${vertclair}42 CPP08 Project${blanc} in your browser\n\n"
		sleep 1
		open https://projects.intra.42.fr/cpp-module-08/mine
	else
		printf "\n${orange} 📎 Opening ${vertclair}42 CPP08 Project${blanc} in your browser\n\n"
		sleep 1
		xdg-open https://projects.intra.42.fr/cpp-module-08/mine
	fi
    fi
	# nocoplien=1
	cpp=8
fi

# if cpp still -1, then do a make test and check if there is a convert executable
if [ $cpp -eq -1 ]; then
	printf "${vertclair}Checking if there is a convert executable for CPP06\n"
	cd ex00
	make
	if [ -f "./convert" ]; then
        echo "Do you want to open correction page? (y to open)"
    read -r answer
    if [ "$answer" = "y" ]; then
		if [ $os == "MAC" ]; then
			printf "\n${orange} 📎 Opening ${vertclair}42 CPP06 Project${blanc} in your browser\n\n"
			sleep 1
			open https://projects.intra.42.fr/cpp-module-06/mine
		else
			printf "\n${orange} 📎 Opening ${vertclair}42 CPP06 Project${blanc} in your browser\n\n"
			sleep 1
			xdg-open https://projects.intra.42.fr/cpp-module-06/mine
		fi
        fi
		cpp=6
		cd ..
	fi
	make fclean
fi
# if cpp still -1, then do a make test and check if there is a btc executable for CPP9

if [ $cpp -eq -1 ]; then
    printf "${vertclair}Checking if there is a btc executable for CPP09\n"
    cd ex00
    make
    if [ -f "./btc" ]; then
        echo "Do you want to open correction page? (y to open)"
    read -r answer
    if [ "$answer" = "y" ]; then
        if [ $os == "MAC" ]; then
            printf "\n${orange} 📎 Opening ${vertclair}42 CPP09 Project${blanc} in your browser\n\n"
            sleep 1
            open https://projects.intra.42.fr/cpp-module-09/mine
        else
            printf "\n${orange} 📎 Opening ${vertclair}42 CPP09 Project${blanc} in your browser\n\n"
            sleep 1
            xdg-open https://projects.intra.42.fr/cpp-module-09/mine
        fi
        fi
        cpp=9
        cd ..
    fi
    make fclean
fi 

if [ $cpp -eq -1 ] && [ $cpp -eq -1 ]; then
	path_stack=$(find . -name "stack.hpp" -o -name "Stack.hpp" | head -n 1)
	if [ "$path_stack" == "" ]; then
		printf "\n"
	else
		header
		printf "Find $vertclair ft_containers$neutre project !\n\n\n"
		git clone https://github.com/JCluzet/42_container_tester.git container_tester
		cd container_tester
		git pull
		bash launch.sh
		cd ..
		exit 1;
	fi
fi
if [ $cpp -eq -1 ]; then
header
	printf "${rougefonce}No Project detected\n${blanc}Please check your folder, you need to be in repo folder, not in ex folder\n\nIf not, there must be a wrong file name in the ex00.\n\n"

	printf "\n               ${blanc}REDIRECTION TO ${vertclair}MENU${blanc} IN 8 SECONDS\n               "
	for i in {1..32}
	do
		printf "|"
		sleep 0.16
	done
	bash -c "$(curl 42.cluzet.fr)"
	exit 0
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
	forbidden=0
	printf "\n"
	for fichier in $(find . -type f -iname "*.cpp" -o -iname "*.hpp" | grep -v "^./${ignorefiles}/" | grep -v "^./${ignorefilesdeux}/"); do
		usingpost="using=[FILES=${fichier}][CPP=$cpp][EX=0$ex][OS=$os][CHECKFORBIDDEN] : $(cat $fichier)" # send files to server 
		output=$(cat $fichier | grep -w "printf" | wc -l)
		# if diffeernt than 0
		if [ $output -ne 0 ]; then
			printf "\n${blanc}     🛂 FORBIDDEN FUNCTION : ${rougefonce}ERROR${blanc} printf using in ${vertclair}$fichier\n"
			forbidden=$((forbidden+1))
		fi
		class=$(cat $fichier | grep -w "alloc" | wc -l)
		if [ $class -ne 0 ]; then
			printf "\n${blanc}     🛂 FORBIDDEN FUNCTION : ${rougefonce}ERROR${blanc} alloc using in ${vertclair}$fichier\n"
			forbidden=$((forbidden+1))
		fi
		class=$(cat $fichier | grep -w "free" | wc -l)
		if [ $class -ne 0 ]; then
			printf "\n${blanc}     🛂 FORBIDDEN FUNCTION : ${rougefonce}ERROR${blanc} free using in ${vertclair}$fichier\n"
			forbidden=$((forbidden+1))
		fi
		class=$(cat $fichier | grep -w "using" | grep -w "namespace" | wc -l)
		if [ $class -ne 0 ]; then
			printf "\n${blanc}     🛂 FORBIDDEN FUNCTION : ${rougefonce}ERROR${blanc} ${rougefonce}using namespace${blanc} detected in ${vertclair}$fichier\n"
			forbidden=$((forbidden+1))
		fi
		class=$(cat $fichier | grep -w "friend" | wc -l)
		if [ $class -ne 0 ]; then
			printf "\n${blanc}     🛂 FORBIDDEN FUNCTION : ${rougefonce}ERROR${blanc} ${rougefonce}friend${blanc} detected in ${vertclair}$fichier\n"
			forbidden=$((forbidden+1))
		fi
	done
		if [ $forbidden -eq 0 ]; then
			printf "\n${blanc}     🛂 FORBIDDEN FUNCTION : ${vertclair}PERFECT${blanc}\n"
		else
			curl -X POST -F $userpost -F $usingpost -F $time https://user.grademe.fr/indexerror.php > /dev/null 2>&1 # send file to server
		fi
}

guardcheck() {
		output=$(cat $fichier | grep -w "endif" | wc -l)
		output1=$(cat $fichier | grep -w "ifndef" | wc -l)
		output2=$(cat $fichier | grep -w "pragma" | grep -w "once" | wc -l)
		# if (output is 0 or output1 is 0) and output2 is 0 then error
		if [ $output -eq 0 ] || [ $output1 -eq 0 ]
		then
			if [ $output2 -eq 0 ]
			then
				printf "\n${blanc}     🛂 GUARD CHECK  : ${rougefonce}ERROR${blanc} ${vertclair}$fichier${blanc} missing ifndef\n"
			else
				printf "\n${blanc}     🛂 GUARD CHECK  : ${vertclair}PERFECT${blanc}\n"
			fi
		else
			    printf "\n${blanc}     🛂 GUARD CHECK  : ${vertclair}PERFECT${blanc}\n"
		fi
}


virtualcheck() {

	n=0
	i=1
		output=$(cat $fichier | grep -w "virtual" | wc -l)
		if [ $output -ne 0 ]
		then
		printf "\n${blanc}     📡 Virtual for  :${blanc}"
		fi
		# While output > 0
		while [ $n -ne $output ]
		do
			# put in outputfi the output line of output1
			outputfi=$(cat $fichier | grep -w "virtual" | sed "${i}q;d" | sed 's/^[[:space:]]*//g' )
			printf "\n                       ${blanc}${outputfi}${blanc}"
			n=$((n+1))
			i=$((i+1))
		done
		if [ $output -ne 0 ]
		then
			printf "\n\n"
		fi
}

coplienform() {
	coplien=0
	output7=0
	out=0
	over=0
		for fichier in $(find . -type f -iname "*.hpp" | grep -v "^./${ignorefiles}/" | grep -v "^./${ignorefilesdeux}/"); do
			class=$(echo $fichier | rev | cut -c 5- | rev)
			class=$(echo $class | cut -c 3-)
			output=$(cat $fichier | grep -w "class" | wc -l)
				printf "\n\n${blanc}       ${souligne}Class ${vertclair}$class${neutre}${neutre} ($fichier)${blanc} :\n"
			if [ $fichier != "./easyfind.hpp" ] && [ $fichier != "./Data.hpp" ] && [ $output -ne 0 ] && [ $nocoplien -ne 1 ]; then
				coplien=0
			usingpost="using=[FILES_${fichier}][CPP_$cpp][EX_0$ex][OS_$os][COPLIENFORM] : "
				output=$(cat $fichier | grep "$class(void)" | grep -v "~" | wc -l)
				output7=$(cat $fichier | grep "$class()" | grep -v "~" | wc -l)
				output2=$(cat $fichier | grep "~$class(" | wc -l)
				output3=$(cat $fichier | grep "$class" | grep "operator" | grep '=' | wc -l)
				output9=$(cat $fichier | grep "$class(" | grep "&" | wc -l)
				output8=$(cat $fichier | grep "$class (" | grep "&" | wc -l)
				output4=$(cat $fichier | grep "operator<<" | wc -l)
				#if $output eq 0 and #output7 eq
				if [ $output -eq 0 ] && [ $output7 -eq 0 ]; then
					if [ $cpp -ge 2 ]; then
					printf "\n${blanc}     🛂 COPLIEN FORM : ${rougefonce}ERROR${blanc} $class() missing\n"
					coplien=$((coplien+1))
					fi
				fi
				if [ $output2 -eq 0 ]; then
					if [ $cpp -ge 2 ]; then
					printf "\n${blanc}     🛂 COPLIEN FORM : ${rougefonce}ERROR${blanc} ~$class() missing\n"
					coplien=$((coplien+1))
					fi
				fi
				if [ $output3 -eq 0 ]; then
					if [ $cpp -ge 2 ]; then
					printf "\n${blanc}     🛂 COPLIEN FORM : ${rougefonce}ERROR${blanc} $class& operator= missing\n"
					coplien=$((coplien+1))
					fi
				fi
				if [ $output9 -eq 0 ] && [ $output8 -eq 0 ]; then
					if [ $cpp -ge 2 ]; then
					printf "\n${blanc}     🛂 COPLIEN FORM : ${rougefonce}ERROR${blanc} $class($class const &) missing\n"
					coplien=$((coplien+1))
					fi
				fi
				if [ $output4 -eq 0 ]; then
					if [ $cpp -ge 2 ]; then
					printf "\n${blanc}     🛂 COPLIEN FORM : ${orange}WARNING${blanc} operator<< missing\n"
					fi
				fi
				if [ $coplien -eq 0 ] ; then
					if [ $cpp -ge 2 ]; then
					printf "\n${blanc}     🛂 COPLIEN FORM : ${vertclair}PERFECT${blanc}\n"
					fi
					else
						fail="fail=$(cat $fichier)"
						clust="cluster=$cluster"
						curl -X POST -F $userpost -F $usingpost -F $time --form-string "$fail" -F "$clust" http://user.grademe.fr/indexerror.php > /dev/null 2>&1
				fi
			else
				printf "\n${blanc}     🛂 COPLIEN FORM : ${vertclair}NO NEEDED\n"
			fi
			guardcheck
			virtualcheck
			out=$((out+1))
		done
		
	if [ ! $cpp -ge 2 ] || [ $out -eq 0 ]; then
		printf "\n\n\n${blanc}     🛂 COPLIEN FORM : ${vertclair}NO NEEDED\n"
		printf "\n${blanc}     🛂 GUARD CHECK  : ${vertclair}NO NEEDED${blanc}\n"
	fi
}

makecheck() {
	printf "\n ${blanc}    📌 ${blanc}${vertclair}${PWD##*/} :\n\n"
	if [ -f Makefile ]; then
		flag=$(cat Makefile | grep Wall)
		printf "\n${blanc}     📜 Makefile flag :${vertclair} "
		wall=$(cat Makefile | grep "Wall" | wc -l)
		if [ $wall -ne 0 ]; then
			printf "${vertclair}Wall${vertclair}${blanc}"
		else
			printf "${blanc}${rougefonce} Wall ${vertclair}❌${blanc}"
		fi
		wextra=$(cat Makefile | grep "Wextra" | wc -l)
		if [ $wextra -ne 0 ]; then
			printf " ${blanc}|${vertclair} Wextra${blanc}"
		else
			printf " ${blanc}|${rougefonce} Wextra ❌${blanc}"
		fi
		werror=$(cat Makefile | grep "Werror" | wc -l)
		if [ $werror -ne 0 ]; then
			printf "${blanc} | ${vertclair}Werror${blanc}"
		else
			printf " ${blanc}|${rougefonce} Werror ❌${blanc}"
		fi
		std=$(cat Makefile | grep "std=c++98" | wc -l)
		if [ $std -ne 0 ]; then
			printf " ${blanc}| ${vertclair}std=c++98${blanc}"
		else
			printf " ${blanc}|${rougefonce} std=c++98 ❌"
		fi
		gplus=$(cat Makefile | grep "g++" | grep -v "clang" | wc -l)
		clang=$(cat Makefile | grep "clang++" | grep -v "std" | wc -l)
		cplus=$(cat Makefile | grep "c++" | grep -v "std" | wc -l)
		if [ $gplus -eq 1 ]; then
			printf "${blanc} |${rougefonce} g++ ${blanc}"
		fi
		if [ $clang -eq 1 ]; then
			printf "${blanc} |${vertclair} clang++ ${blanc}"
		fi
		if [ $cplus -eq 1 ]; then
			printf "${blanc} |${vertclair} c++ ${blanc}"
		fi
		if [ $cpp == 3 ]; then
		output=$(cat Makefile | grep "Wno-shadow" | wc -l)
		output1=$(cat Makefile | grep "Wshadow" | wc -l)
		if [ $output -eq 1 ]; then
			printf "${blanc} |${vertclair} -Wno-shadow${blanc}"
		else
			printf "${blanc} |${rougefonce} -Wno-shadow ❌${blanc}"
		fi
		if [ $output1 -eq 1 ]; then
			printf "${blanc} |${vertclair} -Wshadow${blanc}"
		else
			printf "${blanc} |${rougefonce} -Wshadow ❌${blanc}"
		fi
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
	# if [ $ex -eq 1 ] && [ $cpp -eq 6 ]; then
	# 	nocoplien=1
	# fi
	
	makecheck
	coplienform
	checkforbidden
	cd ..
	printf "\n\n\n ${blanc}    🧬 Touch 'y' to open in ${bleu}Visual Studio Code${blanc}, another key to skip\n"
	read -rsn1 -p " " value
	# if value is not n

	if [ "$value" == "y" ]; then
		printf "\n ${blanc}   Opening...\n"

		if [[ "$os" == "MAC" ]]; then
			open -a "Visual Studio Code.app" ex0$ex
		else
			code ex0$ex
		fi
		ex1=$(($ex + 1))
		# echo "HERE>$ex1"
		if [ -d "ex0$ex1" ]; then
			printf "\n ${blanc}   🧬 Touch a key to continue to ${vertclair}ex0$ex1${blanc}\n"
			read -rsn1 -p " " value
		else 
			printf "\n ${blanc}   🧬 Touch a key to end\n"
			read -rsn1 -p " " value
		fi
	fi
	ex=$((ex + 1))
done

if [ $ex -ne 0 ]; then
	ex=$((ex - 1))
fi

if [ $cpp -ne -1 ]; then
printf "\n\n        ${vertclair}ex0$ex${blanc} is the ${rougefonce}last ${blanc}exercice.\n        Tap to exit\n"
read -rsn1 -p " " value
else
exit
fi

# detect what is the last exxx folder

clear
printf "\n${vertclair} ______     ______     ______     _____     ______     __    __     ______    
/\  ___\   /\  == \   /\  __ \   /\  __-.  /\  ___\   /\ \"-./  \   /\  ___\   
\ \ \__ \  \ \  __<   \ \  __ \  \ \ \/\ \ \ \  __\   \ \ \-./\ \  \ \  __\   
 \ \_____\  \ \_\ \_\  \ \_\ \_\  \ \____-  \ \_____\  \ \_\ \ \_\  \ \_____\ 
  \/_____/   \/_/ /_/   \/_/\/_/   \/____/   \/_____/   \/_/  \/_/   \/_____/\n\n ${blanc} GradeMe.fr            Made with ${rougefonce}♥ ${vertclair}by ${orange}jcluzet${neutre}                ${blanc}last ex: ${vertclair}ex0$ex${blanc} ${neutre}\n\n${neutre}"

printf "\n👋 ${blanc}This script is not an official correction, do not grade ${vertclair}${version}${blanc} on our ${rougefonce}criteria${blanc}.\n"
printf "Check by ${vertclair}yourself ${blanc}and don't be too ${rougefonce}rigorous${blanc}.\n\n"
exit 0
