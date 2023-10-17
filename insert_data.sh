#!/bin/bash
# Insert World Cup Data
if [[ $1 == "test" ]]
then
PSQL="psql --username=postgres --dbname=worldcuptest -t --no-align -c"
else
PSQL="psql --username=freecodecamp --dbname=worldcup -t --no-align -c"
fi

# Do not change code above this line. Use the PSQL variable above to query your database.
echo -e "\n~~ Insert World Cup Data ~~\n"
#
echo $($PSQL "TRUNCATE TABLE games, teams")
##
# Create teams table
cat games.csv | while IFS=',' read YR RD W L WGL LGL
do
if [[ $YR != 'year' ]]
then
#get team_id
WINNER_ID=$($PSQL "SELECT team_id from teams WHERE name='$W'")
#if not found
if [[ -z $WINNER_ID ]]
then
#insert team
INSERT_TEAM_RESULT=$($PSQL "INSERT INTO teams(name) VALUES('$W')")
if [[ $INSERT_TEAM_RESULT == 'INSERT 0 1' ]]
then
echo Inserted into teams, $W
fi
#get team_id
WINNER_ID=$($PSQL "SELECT team_id from teams WHERE name='$W'")
fi
#get loser_id
LOSER_ID=$($PSQL "SELECT team_id from teams WHERE name='$L'")
#if not found
if [[ -z $LOSER_ID ]]
then
#insert team
INSERT_TEAM_RESULT=$($PSQL "INSERT INTO teams(name) VALUES('$L')")
if [[ $INSERT_TEAM_RESULT == 'INSERT 0 1' ]]
then
echo Inserted into teams, $L
fi
#get team_id
LOSER_ID=$($PSQL "SELECT team_id from teams WHERE name='$L'")
fi
#insert data
INSERT_GAMES_RESULT=$($PSQL "INSERT INTO games(year, round, winner_id, opponent_id, winner_goals, opponent_goals) VALUES($YR, '$RD', $WINNER_ID, $LOSER_ID, $WGL, $LGL)")
if [[ $INSERT_GAMES_RESULT == 'INSERT 0 1' ]]
then
echo Ins game
fi
fi
done