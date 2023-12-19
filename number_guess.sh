#!/bin/bash
#
PSQL="psql --username=home --dbname=number_guess -c"
#
#
#
#Get username input
OK=0
while [ $OK=0 ]
do
echo -e "Enter your username:"
read USER
if [ ! ${#USER} > 22 ]
then
echo -e "Username must be 22 characters, try again:"
else
OK=1
fi
done
#Get user id
USER_ID=$($PSQL "SELECT user_id FROM users WHERE username=$USER")
if [[ -z $USER_ID ]]
then
echo -e "Welcome, $USER! It looks like this is your first time here."
INSERT_USER_RESULT=$($PSQL "INSERT INTO users(username) VALUES($USERNAME)")
if [[ '$INSERT_USER_RESULT' = 'INSERT 0 1']]
then
echo -e "$USER added"
USER_ID=$($PSQL "SELECT user_id FROM users WHERE username=$USER")
fi
else
echo -e "Welcome back, $USER! You have played $GAMES_PLAYED games, and your best game took $BEST_GAME guesses."
fi
#Start the game
MIN=1
MAX=1000
ACTUAL_GAME=0
SECRET_NUMBER=(( $MIN + $RANDOM % $MAX ))
USERIN=0
while [[ ${USERIN} -ne ${SECRET_NUMBER} ]]
do
read -p "Guess the secret number between $MIN and $MAX:" USERIN
until [[ "$USERIN" =~ ^[0-9]+$ ]]
do
read -p "That is not an integer, guess again:" USERIN
done
#
let "$ACTUAL_GAME++"
if [[ $USERIN -gt $SECRET_NUMBER ]]
then
	echo -e "It's lower than that, guess again:"
	elif [[ $VALID_INPUT -lt $SECRET_NUMBER]]
	then
		echo -e "It's higher than that, guess again:"
	fi
	INPUT=$VALID_INPUT
done
echo -e "You guessed it in $ACTUAL_GAME tries. The secret number was $SECRET_NUMBER. Nice job!"
\n
GAMES_PLAYED=$($PSQL "SELECT COUNT(result) FROM results WHERE user_id=$USER_ID")
BEST_GAME=$($PSQL "SELECT MAX(result) FROM results WHERE user_id=$USER_ID")

