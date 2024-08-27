#!/bin/bash
PSQL="psql --username=freecodecamp --dbname=number_guess -t --no-align -c"

echo "Enter your username:"
read NAME

# Buscar si el usuario ya existe
USER=$($PSQL "SELECT usernames FROM users WHERE usernames = '$NAME'")

# Si el usuario no existe
if [[ -z $USER ]]
then
  # Insertar nuevo usuario si no existe
  NUSER=$($PSQL "INSERT INTO users(usernames) VALUES('$NAME')")
  echo "Welcome, $NAME! It looks like this is your first time here."
else 
  # Obtener ID del usuario
  USER_ID=$($PSQL "SELECT user_id FROM users WHERE usernames = '$NAME'")

  # Contar el número de juegos jugados por el usuario
  GAMES_PLAYED=$($PSQL "SELECT COUNT(*) FROM plays WHERE user_id = $USER_ID")

  # Obtener el número mínimo de intentos del mejor juego
  BEST_GAME=$($PSQL "SELECT MIN(tries) FROM plays WHERE user_id = $USER_ID")

  # Imprimir mensaje de bienvenida
  echo "Welcome back, $NAME! You have played $GAMES_PLAYED games, and your best game took $BEST_GAME guesses."
fi

# Obtener el ID del usuario recién creado o existente
USER_ID=$($PSQL "SELECT user_id FROM users WHERE usernames = '$NAME'")

# Generar número aleatorio entre 1 y 1000
NUMBER=$((RANDOM % 1000 + 1))

# Inicializar el contador de intentos
TRIES=0

# Función para adivinar
echo "Guess the secret number between 1 and 1000:"

while true
do
  read USER_NUMBER
  # Verificar si la entrada es un número entero
  if ! [[ $USER_NUMBER =~ ^[0-9]+$ ]]
  then
    echo "That is not an integer, guess again:"
    continue
  fi

  # Incrementar el contador de intentos
  ((TRIES++))

  # Comprobar si el número ingresado es igual al número secreto
  if [[ $NUMBER -eq $USER_NUMBER ]]
  then
    echo "You guessed it in $TRIES tries. The secret number was $NUMBER. Nice job!"
    # Insertar una nueva jugada en la tabla plays
    INSERT_TRY=$($PSQL "INSERT INTO plays(user_id, tries) VALUES($USER_ID, $TRIES)")
    if [[ $INSERT_TRY != "INSERT 0 1" ]]
    then
      echo "Error al registrar la jugada."
      exit 1
    fi
    break  # Terminar el bucle
  elif [[ $NUMBER -gt $USER_NUMBER ]]
  then
    echo "It's higher than that, guess again:"
  elif [[ $NUMBER -lt $USER_NUMBER ]]
  then
    echo "It's lower than that, guess again:"
  fi
done
