# Monitoreo de página web

La idea es tener un monitoreo de mi página [clases.cariet.xyz](clases.cariet.xyz).
Cada cierto tiempo que defino en el crontab revisa si la página esta activa, registra en el archivo `registros.log` y envía la información al chat `ID_DEL_CHAT_DE_REGISTRO`. Este chat debe estar silenciado para no atudirse con los mensajes constantes. En particular sirve para saber que el monitor está actívo.
Además, cuando no está activa manda un mensaje por telegram para alertar al chat `ID_DEL_CHAT`. 

## Configuración

En telegram ir al @BotFather y ejecutar el comando `/newbot`. Seguir las intrucciones para crearlo.
Ahí van a dar un *token* para usar el API. 
Luego debe crearse un grupo y agregarse el bot al grupo. Desde la página de [Telegram Web](web.telegram.org) entrar al grupo donde esta el bot. En la url aparece el *chat_id* que también hace falta.

Con los datos crear el archivo `.env` a partir del archivo `sample.env` y modificar los datos.
```bash
cp sample.env .env
edit .env
```

## Puesta en marcha

Para usar el script debe hacerlo ejecutable y ponerlo en el crontab mediante el comando
```bash
chmod +x ./monitor.sh
crontab -e
```
En el crontab poner algo como lo siguiente (que ejeguca el script cada 10 minutos)

```crontab
*/10 * * * * cd /directorio/del/script && ./monitor.sh
```

Cada vez que se ejecute el script, revisara si la página está activa, generará una nueva linea en el `registro.log` y en caso de no estar activa enviará una alerta a telegram mediante el bot.
