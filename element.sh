#! /bin/bash
# set variable to call psql method
PSQL="psql -X --username=freecodecamp --dbname=periodic_table --tuples-only -c"
#check for arguments
if [[ -z $1 ]]
# if no arguments
then
#ask for argument
echo -e "Please provide an element as an argument."
exit
fi
# if theres an argument, now lets see if its valid
ATOMIC_NUMBER=$($PSQL "SELECT atomic_number FROM elements WHERE CAST(atomic_number AS text)='$1' OR symbol='$1' OR name='$1'")
# if not found as any of the options
if [[ -z  "$ATOMIC_NUMBER" ]]
# Print not found
then
echo -e "I could not find that element in the database."
exit
fi
#now we know we have an argument that will reference a value in our db
#create env var for the data we want to display, we use primary unique key to find everything
ELEMENT_NAME=$($PSQL "SELECT name FROM elements WHERE atomic_number=$ATOMIC_NUMBER")
ELEMENT_SYMBOL=$($PSQL "SELECT symbol FROM elements WHERE atomic_number=$ATOMIC_NUMBER")
TYPE=$($PSQL "SELECT type FROM types right join properties using(type_id) WHERE atomic_number=$ATOMIC_NUMBER")
ATOMIC_MASS=$($PSQL "SELECT atomic_mass FROM properties WHERE atomic_number=$ATOMIC_NUMBER")
MP=$($PSQL "SELECT melting_point_celsius FROM properties WHERE atomic_number=$ATOMIC_NUMBER")
BP=$($PSQL "SELECT boiling_point_celsius FROM properties WHERE atomic_number=$ATOMIC_NUMBER")
#create new var with the sentence that will be returned with the env var embedded
OUTPUT="The element with atomic number $ATOMIC_NUMBER, is $ELEMENT_NAME ($(echo $ELEMENT_SYMBOL || sed 's/[[:blank:]]//g')). It's a $TYPE, with a mass of $ATOMIC_MASS amu. $ELEMENT_NAME has a melting point of $MP celsius and a boiling point of $BP celsius."
#make it pretty by removing double blank spaces piping it through 'tr' method
echo  $OUTPUT | tr -s '[:blank:]'
exit
\n
