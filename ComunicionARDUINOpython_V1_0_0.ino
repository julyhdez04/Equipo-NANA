#include <DHT.h>

#define DHTPIN 2    // Pin donde está conectado el DHT11
#define DHTTYPE DHT11   // Definir el tipo de DHT

DHT dht(DHTPIN, DHTTYPE);

void setup() {
  Serial.begin(9600);
  dht.begin();
}

void loop() {

  // Leer los valores del DHT11
  float temperatura = dht.readTemperature();
  float humedad = dht.readHumidity();

  // Enviar los datos al puerto serial
  Serial.print("Locura3:");
  Serial.println(temperatura);
  Serial.print("Locura4:");
  Serial.println(humedad); // Enviar humedad como un valor adicional

  delay(900); // Esperar 2 segundos antes de la siguiente lectura
}
