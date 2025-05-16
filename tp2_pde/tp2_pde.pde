//alumno:luz clarita moral cardozo
//comision 2

//declaracion de variables para las imagenes 
PImage imagen1,imagen2,imagen3;
//declaracion de textos que se mostraran en cada pantalla 
String texto1,texto2,texto3,texto4,estado;
//variables para controlar el tiempo y animaciones
int segundos,movimiento1,movimiento2,py;
float tono;
PFont tipografia;


void setup(){
  size(640,480);
  textAlign(CENTER,CENTER);
  noStroke();
  
  //carga de imagenes para cada pantalla
  imagen1 = loadImage("imagen1.png");
  imagen2 = loadImage("imagen2.png");
  imagen3 = loadImage("imagen3.png");

 //tipografia de los textos
  tipografia = loadFont("AlmendraSC-Regular-30.vlw");
  textFont(tipografia);


  //textos 
  texto1 = "Fuego y agua\n\n ¿Qué es Fuego y Agua?\n\n Fuego y Agua es un juego de aventuras y\n puzles donde dos personajes, uno de fuego\n y otro de agua,deben colaborar para superar\n distintos niveles llenos de desafíos.\n El trabajo en equipo es esencial para ganar.";
  texto2 = "¿Quiénes son los personajes?\n\n Fuego es un niño que puede caminar sobre\nla lava, pero se apaga si toca el agua.\nAgua es una niña que puede moverse sobre el agua,\npero se evapora si toca la lava.Cada uno tiene\nhabilidades únicas que deben usar inteligentemente.\n\n Regla principal\n¡No pueden tocar los elementos contrarios\nFuego debe evitar el agua.\nAgua debe evitar la lava.\n\n Si uno cae en su debilidad, ambos deben reiniciar\n el nivel.¡La cooperación y la comunicación\n son fundamentales";
  texto3 = "¿Cómo se juega?\n\n Cada jugador controla a uno de los personajes \n(o una persona puede manejar ambos). El objetivo \nes moverlos a través de laberintos, activar \n botones, mover plataformas y evitar \ntrampas para llegar a la salida.";
  texto4 = "reiniciar";
 
 
 //variables 
  estado = "primera"; //comienza en la primera pantalla 
  segundos = 0;
  movimiento1 = 395;
  movimiento2 = 0; 
  py = height; 
  
   frameRate(60);// 60 cuadros por segundo 
}

void draw (){
  
//pantalla 1: imagen y texto con animacion hacia arriba 
 if (estado.equals("primera")){
    image(imagen1,0,0,width,height);
     float tono = map(py, height, 100, 0, 255);
      fill(0, 0, 255, tono); //opacidad segun posicion
        if (py>100) {
    py --;// el texto sube
        }
    textSize(30);
    text(texto1,300,320);
    
    
//pantalla 2: imagen y texto con movimiento hacia arriba 
  } else if (estado.equals("segunda")){
           image(imagen2,0,0,width,height);
           fill(0,0,255);
           textSize(26);
           text(texto2,300,movimiento1);
           movimiento1--; //el texto sube gradualmente 

           
 //pantalla 3: imagen y texto con moviento horizontal
  }else if (estado.equals("tercera")){
            image(imagen3,0,0,width,height);
 fill(0,0,255);
            textSize(25);
            text(texto3,movimiento2,300);
             
            if(movimiento2<290){
              movimiento2++;// el texto se mueve  a la derecha
            }else {
               //mostrar boton de reiniciar 
              fill(0,0,255);
              rect(500,2,180,40);
              
              //texto del boton
              textSize(30);
              fill(255);
              text(texto4,560,13);
            }
  }
  
  //transiciones
  if(frameCount%60 ==0){
    segundos = segundos +1;
  }
  if (segundos < 6){
    estado = "primera";
  }else if (segundos>=6 && segundos< 20){
    estado = "segunda";
  } else if (segundos >=20){
    estado="tercera"; 
 }

}
//botón para reiniciar las pantallas   
void mousePressed(){
  
  fill(255,0,0);//color para indicar clic pero no visible 
  if(estado.equals("tercera")){
    if(mouseX>500 && mouseX<500+150
      && mouseY >8 && mouseY <8+80){ 
        //reinicia todas las variables para volver a la pantall 1 
        estado="primera";
        segundos=0;
        movimiento1=395;
        movimiento2=0;
        py=height;
    }
  } 
}
