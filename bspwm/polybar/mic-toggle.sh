#!/bin/bash

# Obtiene el estado actual del micrófono
status=$(amixer get Capture | awk -F"[][]" '/Left:/ {print $4}')

# Establece el icono en base al estado del micrófono
if [[ $status == "on" ]]; then
    echo "%{F#00FF00}"   # Icono verde para micrófono activado
else
    echo "%{F#FF0000}"   # Icono rojo para micrófono desactivado
fi
