# -*- coding: utf-8 -*-
"""
V.1.5.0
Created on Tue Mar 25 22:20:09 2025

@author: Choclotherock
         Pinging78
         kay16mich
         julyhdez04
"""
import serial #Llamar libreria serial que permite la comunicación con Arduino, se usa para leer y escribir datos desde los puertos COM
import csv #Llamar libreria csv que nos guarda los datos recopilados desde arduino, lee y escribe archivos CSV 
import os #Llamar libreria OS nos ayuda a interactuar con el sistema operativo, comprueba que el archivo csv exista 

# Configura el puerto serie (cambia 'COM4' por tu puerto Arduino)
arduino = serial.Serial('COM4', 9600, timeout=1) #Se abre la comunicación, en el nombre del puerto que conectamos el arduino, se da la vleocidad de comunicación y un tiempo de espera para leer los datos

# Nombre del archivo CSV
archivo_csv = "datos.csv" #Lugar donde guardamos los datos de lectura csv

# Verifica si el archivo ya existe para escribir encabezados solo una vez
archivo_existe = os.path.isfile(archivo_csv)

# Escribir encabezados solo si el archivo es nuevo
if not archivo_existe:         #Si el archivo no existe entonces
    with open(archivo_csv, mode="w", newline="") as archivo:         #Evita las lineas en blanco del archivo de lectura CSV
        escritor_csv = csv.writer(archivo)                           #Crear un nuevo archivo
        escritor_csv.writerow(["Humedad", "Temperatura", "Movimiento", "Distancia"]) #Colocar las variables en el archivo        

#Bucle para leer datos
try:
    hume, temp, mov, dis = None, None, None, None   #Declaracion de variables de datos    
    while True:
        if arduino.in_waiting > 0:                  #Mientras el valor siga siendo None el arduino espera un nuevo dato
            linea = arduino.readline().decode('utf-8').strip() #Se define que lea los valores que ingresan al arduino

            if linea.startswith("Humedad: "):#Condicional para leer los datos de humedad 
                hume = float(linea.split(":")[1])  #Se define el valor de la humedad
                print(f"Humedad: {hume}") #Imprime el texto junto con el valor de la humedad
                
            if linea.startswith("Temperatura: "): #Condicional para leer los datos de temperatura 
                temp = float(linea.split(":")[1])  #Se define el valor de la temperatura
                print(f"Temperatura: {temp} °C") #Imprime el texto junto con el valor de la temperatura
                    
            if linea.startswith("MOVIMIENTO: "): #Condicional para leer los datos de movimiento 
                mov = float(linea.split(":")[1])  #Se define si detecta movimiento el sensor
                print(f"MOVIMIENTO: {mov}") #Muestra el texto junto con el valor
                    
            if linea.startswith("Distancia: "): #Condicional para leer los datos de distancia
                dis = float(linea.split(":")[1])  #Define la distancia detectada
                print(f"Distancia: {dis}") #Muestra el texto y la distancia detectada

            # Escribir en CSV solo si todos los valores han sido leídos
            if None not in [hume, temp, mov, dis]:
                with open(archivo_csv, mode="a", newline="") as archivo:
                    escritor_csv = csv.writer(archivo)
                    escritor_csv.writerow([hume, temp, mov, dis])
                    print("Datos guardados en CSV.")

                # Reiniciar variables
                hume, temp, mov, dis = None, None, None, None  

except KeyboardInterrupt: #Cancelar si el usuario lo requiere
    print("Interrupción por usuario. Cerrando conexión.") #Imprimir el mensaje cuando el usuario cierre el programa
    arduino.close()
