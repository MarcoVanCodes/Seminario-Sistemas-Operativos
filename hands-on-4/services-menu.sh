#!/bin/bash

while true; do
    echo "========== Menú de Servicios =========="
    echo "1. Listar contenido de una carpeta"
    echo "2. Crear un archivo de texto con una línea de texto"
    echo "3. Comparar dos archivos de texto"
    echo "4. Buscar con awk (mostrar líneas con más de 3 palabras)"
    echo "5. Buscar con grep (palabra clave en un archivo)"
    echo "6. Salir"
    echo "======================================="
    read -p "Seleccione una opción [1-6]: " opcion

    case $opcion in
        1)
            read -p "Ingrese la ruta absoluta del directorio: " ruta
            if [ -d "$ruta" ]; then
                echo "Contenido de $ruta:"
                ls -l "$ruta"
            else
                echo "Directorio no válido."
            fi
            ;;
        2)
            read -p "Ingrese el nombre del archivo a crear: " archivo
            read -p "Ingrese la línea de texto para almacenar: " texto
            echo "$texto" > "$archivo"
            echo "Archivo '$archivo' creado con éxito."
            ;;
        3)
            read -p "Ingrese el primer archivo a comparar: " archivo1
            read -p "Ingrese el segundo archivo a comparar: " archivo2
            if [[ -f "$archivo1" && -f "$archivo2" ]]; then
                echo "Diferencias entre los archivos:"
                diff "$archivo1" "$archivo2"
            else
                echo "Uno o ambos archivos no existen."
            fi
            ;;
        4)
            read -p "Ingrese el archivo para procesar con awk: " archivoawk
            if [ -f "$archivoawk" ]; then
                echo "Líneas con más de 3 palabras:"
                awk 'NF > 3' "$archivoawk"
            else
                echo "Archivo no encontrado."
            fi
            ;;
        5)
            read -p "Ingrese el archivo para buscar con grep: " archivogrep
            read -p "Ingrese la palabra clave a buscar: " palabra
            if [ -f "$archivogrep" ]; then
                echo "Resultados de búsqueda:"
                grep "$palabra" "$archivogrep"
            else
                echo "Archivo no encontrado."
            fi
            ;;
        6)
            echo "¡Hasta luego!"
            break
            ;;
        *)
            echo "Opción no válida. Intente de nuevo."
            ;;
    esac

    echo ""
done
