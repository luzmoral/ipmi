PImage figuraDeGuia;
int cantidad;
float tamanoCelda;
float tamanoCirculo;
color colorActual = color(0); // color inicial: negro

void setup() {
  size(800, 400);
  figuraDeGuia = loadImage("figuraDeGuia.png");
  cantidad = 12;
  tamanoCelda = 400 / cantidad;
  tamanoCirculo = tamanoCelda;
}

void draw() {
  
  //cambia el fondo de color segun la posivion del mouse 
  if (mouseX < width/2){
  background(255); // blanco si esta del lado izquierdo
  }else {
     background(200); // gris si esta del lado derecho
  }
  
  image(figuraDeGuia, 0, 0, 400, 400);

  // el tamaño del círculo se adapta al mouse
  float tamanoCirculo = map(mouseX, 0, width, 5, tamanoCelda);
  
//dibujo de la grilla
  for (int i = 0; i < cantidad; i++) {
    for (int j = 0; j < cantidad; j++) {
      
      float x = 400 + i * tamanoCelda + tamanoCelda / 2;
      float y = j * tamanoCelda + tamanoCelda / 2;
      float distancia = dist(i, j, cantidad / 2, cantidad / 2);
      
      //uso de funcion que retorna valor 
      float tamanoFinal = calcularTamano(distancia, tamanoCirculo);
      //uso de funcion que no retona dibuja
      dibujarCirculo( x, y , tamanoFinal);
    }
  }
}

//funcion que devuelve un valor retorna el tamaño para el circulo
float calcularTamano(float distancia,float tamMouse){
  return map(distancia,0,cantidad /2, tamMouse,5);
  
}

//funcion que no duvuelve valor solo dibuja el circulo
  void dibujarCirculo( float x , float y ,float tam){
  fill(colorActual);
  noStroke();
  ellipse(x,y,tam,tam);
}

// Cuando hacés clic, se cambia el color de todos los círculos
void mousePressed() {
  colorActual = color(random(255), random(255), random(255));
}

// Teclas para aumentar/disminuir/resetear
void keyPressed() {
  if (key == 'l') cantidad++; //agrega filas//columnas
  if (key == 'u' && cantidad > 1) cantidad--; //saca filas/columnas
  if (key == 'z') resetear(); //  reinicia 
}

//funcion para reiniciar 
void resetear() {
  cantidad = 12;
  tamanoCelda = 400 / cantidad;
  tamanoCirculo = tamanoCelda;
  colorActual = color(0); // volver al color  negro
}
