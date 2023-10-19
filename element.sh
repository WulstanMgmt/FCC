#! /bin/bash

PSQL="psql -X --username=freecodecamp --dbname=periodic_table --tuples-only -c"

echo -e "\n ~~~~ Periodic Table Interactive Info ~~~~ \n"

echo -e "\nPlease provide an element as an argument."

read ELEMENT_INPUT

#get data if atomic_number

ATOMIC_NUMBER=$($PSQL "SELECT atomic_number FROM elements WHERE atomic_number='$ELEMENT_INPUT'")

if [[ -z $ATOMIC_NUMBER ]]

then

#get data if symbol

ATOMIC_NUMBER=$($PSQL "SELECT atomic_number FROM elements WHERE symbol='$ELEMENT_INPUT'")

if [[ -z $ATOMIC_NUMBER ]]

then

#get data if element name

ATOMIC_NUMBER=$($PSQL "SELECT atomic_number FROM elements WHERE name='$ELEMENT_INPUT'")

if [[ -z $ATOMIC_NUMBER ]]

then

#ask for valid input

echo -e "I could not find that element in the database."

fi

fi

fi

ELEMENT_NAME=$($PSQL "SELECT name FROM elements WHERE atomic_number=$ATOMIC_NUMBER")

ELEMENT_SYMBOL=$($PSQL "SELECT symbol FROM elements WHERE atomic_number=$ATOMIC_NUMBER")

TYPE=$($PSQL "SELECT type FROM types right join properties using(type_id) WHERE atomic_number=$ATOMIC_NUMBER")

ATOMIC_MASS=$($PSQL "SELECT atomic_mass FROM properties WHERE atomic_number=$ATOMIC_NUMBER")

MP=$($PSQL "SELECT melting_point_celsius FROM properties WHERE atomic_number=$ATOMIC_NUMBER")

BP=$($PSQL "SELECT boiling_point_celsius FROM properties WHERE atomic_number=$ATOMIC_NUMBER")

#final output sentence
echo -e "The element with atomic number $ATOMIC_NUMBER is '$ELEMENT_NAME' ($ELEMENT_SYMBOL). It's a $TYPE, with a mass of $ATOMIC_MASS amu. $ELEMENT_NAME has a melting point of $MP celsius and a boiling point of $BP celsius."
