# -*- coding: utf-8 -*-
"""
Created on Tue Mar 25 22:20:09 2025
V 1.1.0
@author: Chocl
"""
import serial
import time

# Configura el puerto serie (cambia 'COM4' por tu puerto Arduino)
arduino = serial.Serial ('COM3', 9600, timeout=1)

try:
    while True:
        if arduino.in_waiting > 0:
            linea = arduino.readline().decode('utf-8').strip()
            
            if linea.startswith("Locura3:"):
                temperatura = linea  # Extrae el valor numérico
                print(f"primersensor: {temperatura} °C")
            if linea.startswith("Locura4:"):
                temperatura = float(linea.split(":")[1])  # Extrae el valor numérico
                print(f"segundosensor: {temperatura} °C")

                
except KeyboardInterrupt:
    print("Interrupción por usuario. Cerrando conexión.")
    arduino.close()
    
