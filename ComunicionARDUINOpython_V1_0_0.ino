//V.1.2.0

#include <Ultrasonic.h> //Incluir libreria para sensor ultrasónico 
const int TRIG = 8; //Definir pin de conexión TRIG del sensor
const int ECHO = 10; //Definir pin de conexion ECHO del sensor
int distance; //Variable para distancia 
Ultrasonic ultrasonic(TRIG, ECHO); //Definir conexiones a usar en el sensor



#include <DHT.h> //Incluir libreria para el sensor de temperatura
#define DHTPIN 2      //Pin donde está conectado el DHT11
#define DHTTYPE DHT11   // Definimos el tipo de sensor DHT
DHT dht(DHTPIN, DHTTYPE); //Definir conexiones del sensor



int PIRpin = 3;   // Pin para el sensor PIR
int val = 0;      // Variable para almacenar el valor del sensor PIR



void setup() {
  Serial.begin(9600);        // Inicializa la comunicación serial
  dht.begin();        // Inicializa el sensor DHT

  pinMode(PIRpin, INPUT);    // Configura el pin del sensor PIR como entrada

}

void loop() {
  delay(2000); //Retraso de 2000 ms para el loop

// SENSOR DE HUMEDAD Y TEMPERATURA
  float h = dht.readHumidity();    // Lee la humedad y la temperatura
  float t = dht.readTemperature(); // En grados Celsius
  if (isnan(h) || isnan(t)) {   // Verifica si hay errores en la lectura
    Serial.println("Error al leer del sensor DHT"); //Imprime mensaje de erros si no logra dar lectura al sensor
    return;
  }
  Serial.print("Humedad: ");     // Envía los datos a través del puerto serial
  Serial.println(h); //Imprime valor de Humedad
  Serial.print("Temperatura: "); //Envia una cadena de texto al monitor serial
  Serial.println(t); //Imprime el dato de temperatura al monitor serial

//SENSOR DE MOVIMIENTO
  val = digitalRead(PIRpin);  // Lee el valor del sensor PIR
  Serial.print("MOVIMIENTO: ");  //Imprime texto en el lonitor serial
  if (val==0){ //Condicional si el valor es igual a 0...

  Serial.println(val); //...imprimir la variable
  }
    else

      Serial.println(val); //Sino imprimir el valor obtenido 
  
//SENSOR DE PROXIMIDAD
  distance = ultrasonic.read(); //Definir dato de distancia a traves de la lectura del sensor
  Serial.print("Distancia: "); //Imprimir texto 
  Serial.println(distance);      // Imprimir la distancia en el monitor serial
}
