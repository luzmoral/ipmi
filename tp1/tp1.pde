PImage miCelular;

void setup(){
 size(800,400);
  background(255);
  
  miCelular = loadImage("celular.png");
  
}

void draw(){
  
  background(252,243,207);
  
  
  image(miCelular,0,0,400,400);
  

  strokeWeight(3);
  line(400+400,120,400,120);
  
  line(400+400,290,400,290);
   
  strokeWeight(1);
  
  fill(38,50,56);
  rect(100+400,45,195,330,20);
  
  fill(38,50,56);
  rect(110+400,55,100,150,20);
  
  fill(33,33,33);
  ellipse(140+400,85,35,35);
  
  fill(33,33,33);
  ellipse(140+400,125,35,35);
  
  fill(33,33,33);
  ellipse(140+400,165,35,35);
  
  fill(33,33,33);
  ellipse(180+400,110,20,18);
  
  fill(33,33,33);
  ellipse(180+400,140,20,18);
  
  fill(255,236,179);
  ellipse(180+400,140,9,9);
  
  strokeWeight(10);
  line(400,0,400,400);
  
 
  
}
