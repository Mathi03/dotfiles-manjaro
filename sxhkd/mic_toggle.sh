#!/bin/bash

# Obtiene el estado actual del micrófono
status=$(amixer get Capture | awk -F"[][]" '/Left:/ {print $4}')

# Alterna el estado del micrófono
amixer set Capture toggle > /dev/null

# Comprueba el nuevo estado del micrófono
new_status=$(amixer get Capture | awk -F"[][]" '/Left:/ {print $4}')

# Comprueba si el estado cambió y actualiza el icono en Polybar
if [[ $status != $new_status ]]; then
    if [[ $new_status == "on" ]]; then
        polybar-msg hook mic-toggle 1 > /dev/null
    else
        polybar-msg hook mic-toggle 2 > /dev/null
    fi
fi

