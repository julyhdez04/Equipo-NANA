#Equipo: 
#Trabajaron: Juliana Hernández
# 2025/03/03 	V.1.0.1
numero = int(input("Ingrese un número: ")) #Guarda la variable "número" como un dato de entrada de valor entero, el cuál el usuario debe ingresar, "input" es la función que lee el dato ingresado.

if numero % 2 == 0: #Condicional para ejecutar las siguientes líneas, refiere a que si el residuo de un número dividido entre 2 es igual a 0, entonces...
    print("El número es par") #...imprimir "El número es par"
else:  #Sino...
    print("El número es impar") #Imprimir que el número es impar.
