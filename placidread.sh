#!/bin/bash
wpm=100
[[ $2 -gt 0 ]] &&  wpm=$2

cyan=$'\e[1;36m'
end=$'\e[0m'



wtime=`echo "60/$wpm" | bc -l`

data=$(grep -o '[[:alpha:]]*' $1)

columns="$(tput cols)"

printf "\n\n"


function cleanup() {
    tput cnorm
}

trap cleanup EXIT



tput sc
tput civis
for word in $data
do
   random=`echo $RANDOM %30000|bc`
   tput rc
   tput ed
if [[ $random -lt 6000 ]]
then

word="${cyan}$word${end}"
printf "%*s" $(((${#word}+11 + columns) / 2)) "$word"

else
printf "%*s" $(((${#word} + columns) / 2)) "$word"

fi
#printf "%s\n" "Text in ${red}red${end}"
 #  printf "%*s" $(( (${#word} + columns) / 2)) "$word"

   sleep $wtime
done
printf "\n"
