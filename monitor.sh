#!/bin/bash

# Datos del TOKEN Y ID del chat para el bot de telegram
source ./.env

# Mesaje para el registro y para el chat de telegram

MENSAJE_PARA_TELEGRAM="No está funcionando la página clases.cariet.xyz"
REGISTRO="$(date) -- clases.cariet.xyz -- ACTIVO: "
URL="https://api.telegram.org/bot$TOKEN_TELEGRAM/sendMessage"

if curl -s --head --request GET "https://clases.cariet.xyz/" | grep "HTTP/2 200" >/dev/null; then
	echo "$REGISTRO true" >>./registros.log
	curl -s -X POST $URL -d chat_id=$ID_DEL_CHAT_DE_REGISTRO -d text="$REGISTRO true"
else
	echo "$REGISTRO false" >>./registros.log
	curl -s -X POST $URL -d chat_id=$ID_DEL_CHAT -d text="$MENSAJE_PARA_TELEGRAM"
	curl -s -X POST $URL -d chat_id=$ID_DEL_CHAT_DE_REGISTRO -d text="$REGISTRO false"
fi
