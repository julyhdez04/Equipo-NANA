//V.1.2.0

#include <Ultrasonic.h>
const int TRIG = 8;
const int ECHO = 10;
int distance;
Ultrasonic ultrasonic(TRIG, ECHO);



#include <DHT.h>
#define DHTPIN 2     // Pin donde está conectado el DHT11
#define DHTTYPE DHT11   // Definimos el tipo de sensor DHT
DHT dht(DHTPIN, DHTTYPE);



int PIRpin = 3;   // Pin para el sensor PIR
int val = 0;      // Variable para almacenar el valor del sensor PIR



void setup() {
  Serial.begin(9600);        // Inicializa la comunicación serial
  dht.begin();        // Inicializa el sensor DHT

  pinMode(PIRpin, INPUT);    // Configura el pin del sensor PIR como entrada

}

void loop() {
  delay(2000);

// SENSOR DE HUMEDAD Y TEMPERATURA
  float h = dht.readHumidity();    // Lee la humedad y la temperatura
  float t = dht.readTemperature(); // En grados Celsius
  if (isnan(h) || isnan(t)) {   // Verifica si hay errores en la lectura
    Serial.println("Error al leer del sensor DHT");
    return;
  }
  Serial.print("Humedad: ");     // Envía los datos a través del puerto serial
  Serial.println(h);
  Serial.print("Temperatura: ");
  Serial.println(t);

//SENSOR DE MOVIMIENTO
  val = digitalRead(PIRpin);  // Lee el valor del sensor PIR
  Serial.print("MOVIMIENTO: "); 
  if (val==0){

  Serial.println(val);
  }
    else

      Serial.println(val);
  
//SENSOR DE PROXIMIDAD
  distance = ultrasonic.read();
  Serial.print("Distancia: ");
  Serial.println(distance);      // Imprimir la distancia en el monitor serial
}
