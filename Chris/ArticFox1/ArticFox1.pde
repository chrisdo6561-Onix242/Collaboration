PImage img;
ArrayList<Face> fur;
ArrayList<Whiskers> furss;
ArrayList<Ears> furs; //Connects to class

ArrayList<Snowflake> snow;
PVector gravity;
float zOff = 0;

PImage spritesheet;
ArrayList<PImage> textures;

void setup(){
  
  size(640,825);
  spritesheet = loadImage("flakes32.png");
  
  snow = new ArrayList<Snowflake>();
  textures = new ArrayList<PImage>(); //Copies file/images with multiple images/designs into separate images 
  
  fur = new ArrayList<Face>();
  furs = new ArrayList<Ears>(); 
  furss = new ArrayList<Whiskers>(); 
  img = loadImage("ArticFoxHead3.jpg");
  for (int i = 0; i < 5; i++) {
    float x = random(width);
    float y = random(height);
    furss.add(new Whiskers(x,y));
  }
  int numstrands = 1; //Controls thickness of lines
  for (int i=0;i<numstrands;i++){
    furs.add(new Ears());
  }
  for (int i=0;i<5;i++){
    fur.add(new Face());
  }
  
  gravity = new PVector(0, 0.3);
  for (int x = 0; x < spritesheet.width; x += 32) { //Each image is 32*32
    for (int y = 0; y < spritesheet.height; y += 32) {
      PImage img = spritesheet.get(x, y, 32, 32); //Gets a new image - pulls out slice from that position (slow process)
      image(img, x, y); //Draws images at location
      textures.add(img); 
    }
  }
  
  for (int i = 0; i < 400; i++) {
    float x = random(width);
    float y = random(height);
    int designIndex = floor(random(textures.size())); 
    //Gives each design random for each snowflake as an image
    PImage design = textures.get(designIndex); 
    snow.add(new Snowflake(x, y, design));
    }
}

void draw(){
  int numFrames = 200;
  background(0);
  //image(img, 0, 0);
  for (int i = 0; i < fur.size(); i++) {
    Face hairs = fur.get(i);
    hairs.calcWave();
    hairs.renderWave();
  }
  for (int i = 0; i < furs.size(); i++) {
    Ears hairs = furs.get(i);
    hairs.calcWave();
    hairs.renderWave();
  }
  for (int i = 0; i < furss.size(); i++) {
    Whiskers hairs = furss.get(i);
    hairs.calcWave();
    hairs.renderWave();
  }
  
  zOff += 0.1;

  for (int i = 0; i < snow.size(); i++) {
    Snowflake flake = snow.get(i);
    float xOff = flake.pos.x / width;
    float yOff = flake.pos.y / height;
    float wAngle = noise(xOff, yOff, zOff) * TWO_PI;
    PVector wind = PVector.fromAngle(wAngle);
    wind.mult(0.1);

    flake.applyForce(gravity);
    flake.applyForce(wind);
    flake.update();
    flake.render();
  }
  
  if(frameCount<=numFrames){
    saveFrame("tuto2###.gif");
  }
  
}
