# -*- coding: utf-8 -*-
"""
V.1.4.0
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
if not archivo_existe:
    with open(archivo_csv, mode="w", newline="") as archivo:
        escritor_csv = csv.writer(archivo)
        escritor_csv.writerow(["Humedad", "Temperatura", "Movimiento", "Distancia"])

try:
    hume, temp, mov, dis = None, None, None, None  
    while True:
        if arduino.in_waiting > 0:
            linea = arduino.readline().decode('utf-8').strip()

            if linea.startswith("Humedad: "):
                hume = float(linea.split(":")[1])  
                print(f"Humedad: {hume}")
                
            if linea.startswith("Temperatura: "):
                temp = float(linea.split(":")[1])  
                print(f"Temperatura: {temp} °C")
                    
            if linea.startswith("MOVIMIENTO: "):
                mov = float(linea.split(":")[1])  
                print(f"MOVIMIENTO: {mov}")
                    
            if linea.startswith("Distancia: "):
                dis = float(linea.split(":")[1])  
                print(f"Distancia: {dis}")

            # Escribir en CSV solo si todos los valores han sido leídos
            if None not in [hume, temp, mov, dis]:
                with open(archivo_csv, mode="a", newline="") as archivo:
                    escritor_csv = csv.writer(archivo)
                    escritor_csv.writerow([hume, temp, mov, dis])
                    print("Datos guardados en CSV.")

                # Reiniciar variables
                hume, temp, mov, dis = None, None, None, None  

except KeyboardInterrupt:
    print("Interrupción por usuario. Cerrando conexión.")
    arduino.close()
