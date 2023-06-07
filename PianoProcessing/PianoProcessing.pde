// Referências:
// (1) https://processing.org/tutorials/sound#example-1-2-synthesizer, escrito por R. Luke DuBois and Wilm Thoben, consultado em 17/04/2023

import processing.sound.*;
import processing.serial.*;

/* -------------------------------------------------------- Variáveis ---------------------------------------------------------*/

// Notas MIDI
// Retirado do exemplo referenciado em (1)
// Para aumentar ou diminuir uma oitava, somar ou subtrair 8 a cada valor
int dom = 60;
int re = 62;
int mi = 64;
int fa = 65;
int sol = 67;
int la = 69;
int si = 71;
int doM = 72;

// Adaptado do exemplo referenciado em (1)
// Tempos e níveis the ASR envelope (attack, sustain, release)
float attackTime = 0.001;
float sustainTime = 0.004;
float sustainLevel = 0.3;
float releaseTime = 0.6;

TriOsc triOsc;
Env env;

Serial myPort;
String value = null;
String note = null;
String currentNote = null;
String nextNote = null;

String buttonStateDOm = "DOm";
String buttonStateRE = "RE";
String buttonStateMI = "MI";
String buttonStateFA = "FA";
String buttonStateSOL = "SOL";
String buttonStateLA = "LA";
String buttonStateSI = "SI";
String buttonStateDOM = "DOM";

String[] notas = {"Dó menor", "Ré", "Mi", "Fá", "Sol", "Lá", "Si", "Dó Maior"};

boolean home = true;
boolean jogo = false;
boolean help=false;

boolean right=true;

int notaAtual;

int d=200;
PFont titulos, botoes;
PImage pianoMeu;

/* -------------------------------------------------------- Setup ---------------------------------------------------------*/

void setup() {
  size(1200, 800);
  textAlign(CENTER, CENTER);
  pianoMeu = loadImage("pianoMeu.png");
  titulos = createFont("Coiny-Regular", 120);
  botoes = createFont("Poppins-Medium", 24);

  // Definir e fazer a ligação com a porta
  printArray(Serial.list());
  String portName = Serial.list()[3];
  myPort = new Serial(this, portName, 9600);
  myPort.bufferUntil('\n');
  myPort.clear();

  // Cria uma oscilação
  triOsc = new TriOsc(this);
  // Cria um envelope
  env = new Env(this);
}

/* -------------------------------------------------------- Draw --------------------------------------------------------*/

void draw() {

  if (home) {
    desenhaHome();
  } else if (jogo) {
    desenhaJogo();

    /* --------------------------------------------------------
     Tocar as notas do botão que foi pressionado
    /* --------------------------------------------------------*/

    currentNote=null;

    if (value != null) {
      // Vê se a nota tocada foi diferente da anterior
      // e toca a nota correspondente ao botão ativado
      if (!note.equals(currentNote)) {
        // Toca a nota --> Dó Menor
        if (buttonStateDOm.equals(note)) {
          // Retirado do exemplo referenciado em (1)
          triOsc.play(midiToFreq(dom), 0.5);
          env.play(triOsc, attackTime, sustainTime, sustainLevel, releaseTime);
          currentNote = note;

          //não repetir a nota
          currentNote=null;
          value=null;

          // Toca a nota --> Ré
        } else if (buttonStateRE.equals(note)) {
          triOsc.play(midiToFreq(re), 0.5);
          env.play(triOsc, attackTime, sustainTime, sustainLevel, releaseTime);
          currentNote = note;

          //não repetir a nota
          currentNote=null;
          value=null;

          // Toca a nota --> Mi
        } else if (buttonStateMI.equals(note)) {
          triOsc.play(midiToFreq(mi), 0.5);
          env.play(triOsc, attackTime, sustainTime, sustainLevel, releaseTime);
          currentNote = note;

          //não repetir a nota
          currentNote=null;
          value=null;

          // Toca a nota --> Fá
        } else if (buttonStateFA.equals(note)) {
          triOsc.play(midiToFreq(fa), 0.5);
          env.play(triOsc, attackTime, sustainTime, sustainLevel, releaseTime);
          currentNote = note;

          //não repetir a nota
          currentNote=null;
          value=null;

          // Toca a nota --> Sol
        } else if (buttonStateSOL.equals(note)) {
          triOsc.play(midiToFreq(sol), 0.5);
          env.play(triOsc, attackTime, sustainTime, sustainLevel, releaseTime);
          currentNote = note;

          //não repetir a nota
          currentNote=null;
          value=null;

          // Toca a nota --> Lá
        } else if (buttonStateLA.equals(note)) {
          triOsc.play(midiToFreq(la), 0.5);
          env.play(triOsc, attackTime, sustainTime, sustainLevel, releaseTime);
          currentNote = note;

          //não repetir a nota
          currentNote=null;
          value=null;

          // Toca a nota --> Si
        } else if (buttonStateSI.equals(note)) {
          triOsc.play(midiToFreq(si), 0.5);
          env.play(triOsc, attackTime, sustainTime, sustainLevel, releaseTime);
          currentNote = note;

          //não repetir a nota
          currentNote=null;
          value=null;

          // Toca a nota --> Dó Maior
        } else if (buttonStateDOM.equals(note)) {
          triOsc.play(midiToFreq(doM), 0.5);
          env.play(triOsc, attackTime, sustainTime, sustainLevel, releaseTime);
          currentNote = note;

          //não repetir a nota
          currentNote=null;
          value=null;
        }
      }
    }

    /* --------------------------------------------------------
     Ver se a nota tocada é a indicada no ecrã
    /* --------------------------------------------------------*/

    //Dó Menor
    if (notas[notaAtual] == "Dó menor" && buttonStateDOm.equals(note)) {
      currentNote=null;
      value=null;
      notaAtual = round(random(notas.length-1));
      myPort.write('1');
      delay(d);

      //Ré
    } else if (notas[notaAtual] == "Ré" && buttonStateRE.equals(note)) {
      currentNote=null;
      value=null;
      notaAtual = round(random(notas.length-1));
      myPort.write('1');
      delay(d);

      //Mi
    } else if (notas[notaAtual] == "Mi" && buttonStateMI.equals(note)) {
      currentNote=null;
      value=null;
      notaAtual = round(random(notas.length-1));
      myPort.write('1');
      delay(d);

      //Fá
    } else if (notas[notaAtual] == "Fá" && buttonStateFA.equals(note)) {
      currentNote=null;
      value=null;
      notaAtual = round(random(notas.length-1));
      myPort.write('1');
      delay(d);

      //Sol
    } else if (notas[notaAtual] == "Sol" && buttonStateSOL.equals(note)) {
      currentNote=null;
      value=null;
      notaAtual = round(random(notas.length-1));
      myPort.write('1');
      delay(d);

      //Lá
    } else if (notas[notaAtual] == "Lá" && buttonStateLA.equals(note)) {
      currentNote=null;
      value=null;
      notaAtual = round(random(notas.length-1));
      myPort.write('1');
      delay(d);

      //Si
    } else if (notas[notaAtual] == "Si" && buttonStateSI.equals(note)) {
      currentNote=null;
      value=null;
      notaAtual = round(random(notas.length-1));
      myPort.write('1');
      delay(d);

      //Dó Maior
    } else if (notas[notaAtual] == "Dó Maior" && buttonStateDOM.equals(note)) {
      currentNote=null;
      value=null;
      notaAtual = round(random(notas.length-1));
      myPort.write('1');
      delay(d);
    } else {
      myPort.write('0');
      delay(d);
    }
  } else if (help) {
    desenhaAjuda();
  }
}

void serialEvent(Serial myPort) {
  value = myPort.readStringUntil('\n');

  if (value != null) {
    note = trim(value);
    println("received " + note);
  }

  nextNote = trim(value);
  if (nextNote.equals("next")) {
    notaAtual = round(random(notas.length-1));
  }
}

// Retirado do exemplo referenciado em (1)
// Função que calcula a respetiva frequência de uma nota MIDI
float midiToFreq(int note) {
  return (pow(2, ((note - 69) / 12.0))) * 440;
}


/* -------------------------------------------------------- Home ---------------------------------------------------------*/
void desenhaHome() {
  background(255);
  imageMode(CENTER);
  image(pianoMeu, width/2, height/2-50);

  textFont(botoes);
  fill(#4EA2B4);
  noStroke();
  rect(width/2-50, height/2+100, 100, 50, 100);
  fill(255);
  text("Jogar", width/2, height/2+120);

  textFont(botoes);
  fill(#4EA2B4);
  noStroke();
  rect(width-80, 30, 50, 50, 100);
  fill(255);
  text("?", width-55, 50);
}

/* -------------------------------------------------------- Jogo --------------------------------------------------------*/
void desenhaJogo() {
  background(#FFFFFF);
  textFont(titulos);
  fill(#FFBF5F);
  text(notas[notaAtual], width/2, height/2-50);

  textFont(botoes);
  noStroke();
  fill(#4EA2B4);
  rect(width/2-100, height/2+100, 200, 50, 100);
  fill(255);
  text("Próxima Nota", width/2, height/2+120);

  textFont(botoes);
  fill(#F5564A);
  noStroke();
  rect(30, height-80, 100, 50, 100);
  fill(255);
  text("Sair", 80, height-60);

  textFont(botoes);
  fill(#4EA2B4);
  noStroke();
  rect(width-80, 30, 50, 50, 100);
  fill(255);
  text("?", width-55, 50);
}

void desenhaAjuda() {
  background(#4EA2B4);
  textFont(titulos);
  textAlign(CENTER, CENTER);
  fill(255);
  textSize(64);
  text("Como jogar?", width/2, height/2-200);

  textFont(botoes);
  textSize(24);
  text("No ecrã vai aparecer uma nota musical.", width/2, height/2-100);
  text("Toca essa nota para passar à seguinte e,", width/2, height/2-50);
  text("se não conseguires acertar a nota,", width/2, height/2);
  text(" carrega no botão 'Próxima Nota'", width/2, height/2+50);
  text("para continuar a tocar.", width/2, height/2+100);

  textFont(botoes);
  fill(#F5564A);
  noStroke();
  rect(width-80, 30, 50, 50, 100);
  fill(255);
  text("X", width-55, 50);
}

/* ------------------------------------------------------- Cliques ------------------------------------------------------*/

void mousePressed() {
  if (home && mouseX > width/2 - 50 && mouseX < width/2 + 50 && mouseY > height/2+100  && mouseY < height/2 + 150) {
    home = false;
    jogo = true;
    notaAtual = round(random(notas.length-1));
  } else if (jogo && mouseX > width/2 - 100 && mouseX < width/2 + 100 && mouseY > height/2 + 100 && mouseY < height/2 + 200) {
    notaAtual = round(random(notas.length-1));
  } else if (jogo && mouseX > 30 && mouseX < 130 && mouseY > height-80 && mouseY < height-30) {
    jogo = false;
    home = true;
  } else if ((home && mouseX > width - 80 && mouseX < width - 30 && mouseY > 30  && mouseY < 80) || (jogo && mouseX > width - 80 && mouseX < width - 30 && mouseY > 30  && mouseY < 80)) {
    home=false;
    jogo=false;
    help=true;
  } else if (help &&  mouseX > width - 80 && mouseX < width - 30 && mouseY > 30  && mouseY < 80) {
    help=false;
    home= true;
  }
}
