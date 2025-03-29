# -*- coding: utf-8 -*-
"""
V.1.2.1
Created on Tue Mar 25 22:20:09 2025

@author: Choclotherock
         Pinging78
         kay16mich
         julyhdez04
"""
import serial

# Configura el puerto serie (cambia 'COM4' por tu puerto Arduino)
arduino = serial.Serial ('COM4', 9600, timeout=1)

try:
    while True:
        if arduino.in_waiting > 0:
            linea = arduino.readline().decode('utf-8').strip()

            if linea.startswith("Humedad: "):
                hume = float(linea.split(":")[1])  # Extrae el valor numérico
                print(f"Humedad: {hume}")
                
            if linea.startswith("Temperatura: "):
                    temp = float(linea.split(":")[1])  # Extrae el valor numérico
                    print(f"Temperatura: {temp} °C")
                    
            if linea.startswith("MOVIMIENTO: "):
                    mov = float(linea.split(":")[1])  # Extrae el valor numérico
                    print(f"MOVIMIENTO: {mov}")
                    
            if linea.startswith("Distancia: "):
                    dis = float(linea.split(":")[1])  # Extrae el valor numérico
                    print(f"Distancia: {dis}")

                
except KeyboardInterrupt:
    print("Interrupción por usuario. Cerrando conexión.")
    arduino.close()
    
