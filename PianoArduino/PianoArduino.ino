//Botões
const int buttonPinDOm = 2;
const int buttonPinRE = 3;
const int buttonPinMI = 4;
const int buttonPinFA = 5;
const int buttonPinSOL = 6;
const int buttonPinLA = 7;
const int buttonPinSI = 8;
const int buttonPinDOM = 9;

//LEDS
char ledState;
const int ledPin12 = 12;
const int ledPin13 = 13;

// No início, todos os estados do botão estão a LOW
byte lastButtonStateDOm = LOW;
byte lastButtonStateRE = LOW;
byte lastButtonStateMI = LOW;
byte lastButtonStateFA = LOW;
byte lastButtonStateSOL = LOW;
byte lastButtonStateLA = LOW;
byte lastButtonStateSI = LOW;
byte lastButtonStateDOM = LOW;

void setup() {
  pinMode(buttonPinDOm, INPUT);
  pinMode(buttonPinRE, INPUT);
  pinMode(buttonPinMI, INPUT);
  pinMode(buttonPinFA, INPUT);
  pinMode(buttonPinSOL, INPUT);
  pinMode(buttonPinLA, INPUT);
  pinMode(buttonPinSI, INPUT);
  pinMode(buttonPinDOM, INPUT);

  pinMode(ledPin13, OUTPUT);
  pinMode(ledPin12, OUTPUT);

  Serial.begin(9600);
}

void loop() {
  //Sensor de luz
  int LDR_adc = analogRead(A0);

  if (LDR_adc <=20) {
    Serial.println("next");
    delay(500);
  } else{
  }

  if (Serial.available()) {
    ledState = Serial.read();
  }
  if (ledState == '0') {
    digitalWrite(ledPin12, HIGH);
    digitalWrite(ledPin13, LOW);

  } else if (ledState == '1') {
    digitalWrite(ledPin12, LOW);
    digitalWrite(ledPin13, HIGH);
  }

  // vê qual o estado de cada botão
  byte buttonStateDOm = digitalRead(buttonPinDOm);
  byte buttonStateRE = digitalRead(buttonPinRE);
  byte buttonStateMI = digitalRead(buttonPinMI);
  byte buttonStateFA = digitalRead(buttonPinFA);
  byte buttonStateSOL = digitalRead(buttonPinSOL);
  byte buttonStateLA = digitalRead(buttonPinLA);
  byte buttonStateSI = digitalRead(buttonPinSI);
  byte buttonStateDOM = digitalRead(buttonPinDOM);

  // verifica se o estado do botão se altera
  if (buttonStateDOm != lastButtonStateDOm) {
    // guarda o estado do botão
    lastButtonStateDOm = buttonStateDOm;
    // se o botão for pressionado, imprime o nome da nota deste botão
    if (buttonStateDOm == HIGH) {
      Serial.println("DOm");
    }
  }

  if (buttonStateRE != lastButtonStateRE) {
    lastButtonStateRE = buttonStateRE;
    if (buttonStateRE == HIGH) {
      Serial.println("RE");
    }
  }

  if (buttonStateMI != lastButtonStateMI) {
    lastButtonStateMI = buttonStateMI;
    if (buttonStateMI == HIGH) {
      Serial.println("MI");
    }
  }

  if (buttonStateFA != lastButtonStateFA) {
    lastButtonStateFA = buttonStateFA;
    if (buttonStateFA == HIGH) {
      Serial.println("FA");
    }
  }

  if (buttonStateSOL != lastButtonStateSOL) {
    lastButtonStateSOL = buttonStateSOL;
    if (buttonStateSOL == HIGH) {
      Serial.println("SOL");
    }
  }

  if (buttonStateLA != lastButtonStateLA) {
    lastButtonStateLA = buttonStateLA;
    if (buttonStateLA == HIGH) {
      Serial.println("LA");
    }
  }

  if (buttonStateSI != lastButtonStateSI) {
    lastButtonStateSI = buttonStateSI;
    if (buttonStateSI == HIGH) {
      Serial.println("SI");
    }
  }

  if (buttonStateDOM != lastButtonStateDOM) {
    lastButtonStateDOM = buttonStateDOM;
    if (buttonStateDOM == HIGH) {
      Serial.println("DOM");
    }
  }
}