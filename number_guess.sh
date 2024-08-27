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

USER_ID=$($PSQL "SELECT user_id FROM users WHERE usernames = '$NAME'")

# Verificar si el usuario ya ha jugado anteriormente
PLAYS=$($PSQL "SELECT COUNT(*) FROM plays WHERE user_id = $USER_ID")

if [[ $PLAYS -eq 0 ]]
then 
  # Si no existen jugadas, crear un nuevo registro con la primera jugada
  F_PLAY=$($PSQL "INSERT INTO plays(user_id, play_count) VALUES($USER_ID, 1)")
else 
  # Si ya existen jugadas, simplemente insertar una nueva jugada con play_count = 1
  F_PLAY=$($PSQL "INSERT INTO plays(user_id, play_count) VALUES($USER_ID, 1)")
fi

# Generar número aleatorio entre 1 y 1000
NUMBER=$((RANDOM % 1000 + 1))

# Inicializar el contador de intentos
TRIES=0

# Función para adivinar
GUESS() {
  # Leer el número ingresado por el usuario
  read USER_NUMBER

  # Verificar si la entrada es un número entero
  if ! [[ $USER_NUMBER =~ ^[0-9]+$ ]]
  then
    echo "That is not an integer, guess again:"
    GUESS  # Llamar de nuevo a la función para pedir otro intento
    return
  fi
  # Incrementar el contador de intentos
  ((TRIES++))
  # Comprobar si el número ingresado es igual al número secreto
  if [[ $NUMBER -eq $USER_NUMBER ]]
  then
    echo "You guessed it in $TRIES tries. The secret number was $NUMBER. Nice job!"
    # Insertar una nueva jugada en la tabla plays
    INSERT_TRY=$($PSQL "INSERT INTO plays(user_id, play_count, tries) VALUES($USER_ID, 1, $TRIES)")
    return 0  # Terminar la función
  elif [[ $NUMBER -gt $USER_NUMBER ]]
  then
    echo "It's higher than that, guess again:"
  elif [[ $NUMBER -lt $USER_NUMBER ]]
  then
    echo "It's lower than that, guess again:"
  fi
  # Llamar a la función de nuevo para otro intento
  GUESS
}
# Mensaje inicial y primer intento
echo "Guess the secret number between 1 and 1000:"
GUESS
