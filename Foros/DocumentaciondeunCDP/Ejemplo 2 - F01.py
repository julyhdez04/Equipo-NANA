#Equipo: NANA
#Trabajaron: Navarro Hernández Hugo Jesús (Hiukilll)
# 2025/03/03 	V.1.0.1
#Lo que hace este código es que a partir de una lista (en este caso de frutas) se le añadirán más
# elementos (más frutas) para al final imprimir la lista con los añadidos y otra impresión de cada 
# elemento de la lista en individual


frutas = ["manzana", "plátano", "naranja"] # Esta línea declara una lista con el nombre de: frutas.
# Los corchetes [] contienen los elementos de la lista.
# Los textos siempre van dentro de comillas ""


frutas.append("pera")#Aquí . da el acceso para append que es un método que añade datos a la lista. 
# Los paréntesis () contienen los elementos a utilizar por append.
# Los textos siempre van dentro de comillas ""


print("Lista de frutas:", frutas) # Esta linea imprime un texto a travéz de: print.
# Los textos siempre van dentro de comillas ""
# la coma , separa el texto a imprimir del elemento a usar después y la lista de frutas se imprime
# ya con lo agregado de append.


for fruta in frutas: # for realiza un bucle, fruta es un nuevo elemento al azar de la lista frutas
    print("Tengo una", fruta) # Esta linea imprime un texto a travéz de: print.
    # Los textos siempre van dentro de comillas ""
    # la coma , separa el texto a imprimir del elemento a usar después y
    # por el bucle se imprime tantas veces como elementos de la lista modificada.
