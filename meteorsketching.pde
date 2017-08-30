
//Libraries


//Global Variables
PShape baseMap;
String csv[];
String myData[][];

//setup
void setup(){
  size(1800, 900);
  noLoop();
  baseMap = loadShape("WorldMap.svg");
  csv = loadStrings("meteors.csv");
  myData = new String[csv.length][6];
  for(int i = 0; i < csv.length; i++) {
    myData[i] = csv[i].split(",");
  }
  
}


//draw loop
void draw(){
  shape(baseMap,0,0,width, height);
  noStroke();
        
  for (int i = 0; i < myData.length; i++){
    fill(255,0,0,55);
    noStroke();
    float graphLong = map(float(myData[i][3]), -180, 180, 0, width);
    float graphLat = map(float(myData[i][4]), 90, -90, 0, height);
    float markerSize = 0.05*sqrt(float(myData[i][2])/PI);
    //println(graphLong + " / " + graphLat);
    ellipse(graphLong,graphLat,markerSize,markerSize);
    
    if(i<10){
     fill(0); 
     text(myData[i][0], graphLong + markerSize, graphLat);
     noFill();
     stroke(0);
     line(graphLong, graphLat,graphLong + markerSize, graphLat);
    }
    
  }
  
  
  
}