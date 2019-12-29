float getRandomSize() {
   // 2 Random numbers one qualifies for others - linear; creates bias = more smaller ones
  float r = pow(random(0, 1), 3); //Parameters are exponential, so bias of smaller
  return constrain(r * 32, 2, 32); //Constraining pixels size
}

class Whiskers {
  float dx; // Value for incrementing X, to be calculated as a function of period and xspacing
  int xspacing; // How far apart should each horizontal location be spaced
  float period;
  float[] yval; // Using an array to store height values for the wave
  float theta;
  int w; // Width of entire wave
  float amp;
  
  Whiskers(float sx, float sy) {
    float x = sx;
    float y = sy;
    xspacing = 10;   // How far apart should each horizontal location be spaced - change
    theta = 0.0;  // Start angle at 0
    period = 350.0;  // How many pixels before the wave repeats - change
    w = width+16;
    dx = (TWO_PI / period) * xspacing;
    yval = new float[w/xspacing];
    amp = 10.0; // Height of wave - change
  }
  
  void calcWave() {
  // Increment theta (try different values for 'angular velocity' here
  theta += 0.4; //Slows/shortens graph - change
  
  // For every x value, calculate a y value with sine function
  for (int j = 0; j < yval.length; j++) {
    float x = -theta;
  for (int i = 0; i < yval.length; i++) { //Loops at every value
    yval[i] = cos(x/2)*amp/2+sin(x/3)*amp/3+sin(x/5)*amp/3;//exp(x/dx);
    //theta+=dx;
    x+=dx;
   }
  }
  }

  void renderWave() {
    color c = color(255,204,0);
    noStroke();
    fill(c);  
    // A simple way to draw the wave with an ellipse at each location
    for (int t = 0; t < yval.length; t++) {
      int restrwave = 500; //Restrictions of function on the right - change
      if (t * xspacing > restrwave) { 
        break;
      }
      ellipse(-2*t+28*xspacing,92+pow(1.06,1.2*t)+height/2+yval[t],1,2);
      ellipse(-3*t+26*xspacing,89-pow(5*t,0.6)+pow(1.061,1.1*t)+height/2+((pow(5000*t,0.5)+pow(0.5*t,2))*0.002)*yval[t],2,3);
      
      //Right face
      ellipse(t+42*xspacing,50-pow(50*t,0.6)+height/2+(pow(t,2)*0.002)*yval[t],1,2);
      ellipse(3*t+42*xspacing,65-pow(50*t,0.6)+pow(1.061,1.1*t)+height/2+((pow(5000*t,0.5)+pow(0.5*t,2.2))*0.002)*yval[t],2,3);
      ellipse(3*t+42*xspacing,65-pow(50*t,0.6)+height/2+(pow(t,2)*0.0015)*yval[t],2,3);
      ellipse(t+42*xspacing,72-pow(5*t,0.6)+height/2+(pow(t,2)*0.002)*yval[t],1,2);
    } 
    
    for (int t = 0; t < yval.length; t++) {
      int restrwave = 400; //Restrictions of function on the right - change
      if (t * xspacing > restrwave) { 
        break;
      }
      ellipse(-3*t+26*xspacing,89-pow(10*t,0.6)+pow(1.061,1.1*t)+height/2+((pow(5000*t,0.5)+pow(0.5*t,2))*0.002)*yval[t],1,2);
      ellipse(-3*t+27*xspacing,90+pow(1.06,1.2*t)+height/2+(t*0.05)*yval[t],2,3);
    }
    
    for (int t = 0; t < yval.length; t++) {
      int restrwave = 300; //Restrictions of function on the right - change
      if (t * xspacing > restrwave) { 
        break;
      }
      ellipse(-3*t+15.5*xspacing,18+pow(1.06,1.7*t)+height/2+(pow(t,2)*0.003)*yval[t],1,2);
      ellipse(-3*t+28.5*xspacing,105+pow(1.06,1.2*t)+height/2+(t*0.03)*yval[t],1,2);
      //Right face
      ellipse(3*t+47*xspacing,16+pow(1.06,1.2*t)+height/2+(t*0.03)*yval[t],1,2);
      ellipse(4*t+42*xspacing,65-pow(50*t,0.6)+height/2+(pow(t,2)*0.002)*yval[t],1,2);
    }
    
    for (int t = 0; t < yval.length; t++) {
      int restrwave = 250; //Restrictions of function on the right - change
      if (t * xspacing > restrwave) { 
        break;
      }
      ellipse(3*t+42.5*xspacing,78+pow(1.06,1.2*t)+height/2+(pow(t,2)*0.004)*yval[t],2,3);
      //Right face
      ellipse(3*t+43*xspacing,60+sqrt(1.2*t)+height/2+(t*0.15)*yval[t],2,3);
      ellipse(3*t+50*xspacing,-55+pow(1.06,2*t)+height/2+(pow(t,2)*0.003)*yval[t],1,2);
      ellipse(3*t+43*xspacing,82+pow(1.06,1.2*t)+height/2+(pow(t,2)*0.002)*yval[t],1,2);
    }
    
    for (int t = 0; t < yval.length; t++) {
      int restrwave = 150; //Restrictions of function on the right - change
      if (t * xspacing > restrwave) { 
        break;
      }
      ellipse(-3*t+20*xspacing,70+pow(1.2*t,1.3)+height/2+(t*0.03)*yval[t],2,3);
    }
  }
}  

class Face {
  float[] dx; // Value for incrementing X, to be calculated as a function of period and xspacing
  int xspacing; // How far apart should each horizontal location be spaced
  float period;
  float[] yval; // Using an array to store height values for the wave
  float theta;
  int w; // Width of entire wave
  float[] amp;
  int maxwaves = 65; // total # of waves to add together
  
  Face() {
    xspacing = 10;   // How far apart should each horizontal location be spaced
    theta = 0.0;  // Start angle at 0
    period = 350.0;  // How many pixels before the wave repeats
    w = width+16;
    dx = new float[maxwaves];
    yval = new float[w/xspacing];
    amp = new float[maxwaves]; // Height of wave
  }
  
  void calcWave() {
  // Increment theta (try different values for 'angular velocity' here
  theta += 0.3; //Slows/shortens graph
  

  // Accumulate wave height values
  // For every x value, calculate a y value with sine function
  for (int r = 0; r < maxwaves; r++) {
    amp[r] = random(30,40);
    float period = random(100,200); // How many pixels before the wave repeats
    dx[r] = (TWO_PI / period) * xspacing;
    }
    
    for (int t = 0; t < yval.length; t++) {
    yval[t] = 0;
  }
  for (int j = 0; j < yval.length; j++) {
    float x = theta;
    for (int i = 0; i < yval.length; i++) {
      // Every other wave is cosine instead of sine
      if (j % 2 == 0) yval[i] += sin(x)*amp[j]/40;
      else yval[i] += cos(x)*amp[j]/40;
      x+=dx[j];
    }
   }
  }

  void renderWave() {
    noStroke();
    fill(180);
    for (int t = 0; t < yval.length; t++) {
      
      //Left-under-face
      ellipse(3 * t + 9 *xspacing, t -37 + height/2+yval[t], 4, 4);  
      ellipse(2 * t + 19 *xspacing, 2 * t -30 + height/2+yval[t], 4, 4);
      ellipse(t + 27 *xspacing, t -1 + height/2+yval[t], 4, 4);
      
      ellipse(3 * t + 12 *xspacing, t -100 + height/2+yval[t], 2, 3); 
      ellipse(3 * t + 13 *xspacing, t -37 + height/2+yval[t], 2, 3); 
      ellipse(2 * t + 6 *xspacing, 2 * -t + 120 + height/2+yval[t], 2, 3);
      ellipse(t + 26 *xspacing, 3 * t -300 + height/2+yval[t], 2, 3);
      ellipse(t + 10 *xspacing, 3 * -t + 190 + height/2+yval[t], 2, 3);
      ellipse(2 * t + 20 *xspacing, 2 * t +23 + height/2+yval[t], 2, 3);
      ellipse(t + 16 *xspacing, t + 4 + height/2+yval[t], 2, 3);
      
      ellipse(2 * t + 4 *xspacing, 2 * -t + 110 + height/2+yval[t], 1, 2);
      ellipse(2 * t + 15 *xspacing, 3 * t -100 + height/2+yval[t], 1, 2);
      ellipse(2 * t + 8.5 *xspacing, 2 * -t + 110 + height/2+yval[t], 1, 2);
      ellipse(2 * t + 19.5 *xspacing, 2 * t -5 + height/2+yval[t], 1, 2);
      ellipse(3 * t + 15 *xspacing, t -1 + height/2+yval[t], 1, 2); 
      ellipse(t + 27 *xspacing, t +20 + height/2+yval[t], 1, 2);
      
      //Right-under-face
      ellipse(-t + 50 *xspacing, 2 * t -100 + height/2+yval[t], 4, 4);
      ellipse(4 * -t + 63 *xspacing, 2 * t -100 + height/2+yval[t], 4, 4);
      ellipse(2 * -t + 47 *xspacing, t -52 + height/2+yval[t], 4, 4);
      ellipse(-t + 50 *xspacing, 3 * t -100 + height/2+yval[t], 4, 4);
      ellipse(2 * -t + 48 *xspacing, 2 * t - 70 + height/2+yval[t], 4, 4);
      
      ellipse(-t + 46 *xspacing, 3 * t -60 + height/2+yval[t], 2, 3);
      ellipse(2 * -t + 47.5 *xspacing, t + 22 + height/2+yval[t], 2, 3);
      ellipse(-t + 45 *xspacing, 2 * t -20 + height/2+yval[t], 2, 3);
      
      ellipse(2 * -t + 48 *xspacing, 2 * t - 90 + height/2+yval[t], 1, 2);
      ellipse(-t + 48 *xspacing, 3 * t -60 + height/2+yval[t], 1, 2);
      ellipse(2 * -t + 47 *xspacing, t + 10 + height/2+yval[t], 1, 2);
      ellipse(-t + 44 *xspacing, 2 * t -35 + height/2+yval[t], 1, 2);
      ellipse(-t + 47 *xspacing, 2 * t + height/2+yval[t], 1, 2);
      ellipse(-t + 45 *xspacing, 2 * t -5 + height/2+yval[t], 1, 2);
      
      //Left-top-forehead
      ellipse(2 * t + 18 *xspacing, 2 * t -180 + height/2+yval[t], 4, 4);
      ellipse(3 * t + 10 *xspacing, 2 * t -200 + height/2+yval[t], 4, 4);
      ellipse(3 * t + 10 *xspacing, 3 * t -200 + height/2+yval[t], 4, 4);
      

      //Left ear
      ellipse(t + 10 *xspacing, t -200 + height/2+yval[t], 1, 2);
      ellipse(t + 19 *xspacing, t -200 + height/2+yval[t], 2, 3);
      
      //Left forehead
      ellipse(t + 24 *xspacing, 3 * t -280 + height/2+yval[t], 4, 4);
      
      ellipse(t + 22 *xspacing, 2 * t -270 + height/2+yval[t], 1, 4);
      ellipse(t + 24 *xspacing, 2 * t -250 + height/2+yval[t], 1, 4);
      ellipse(t + 21 *xspacing, 1.5 * t -200 + height/2+yval[t], 1, 2);
      
      //Mid-tones
      ellipse(t + 28.5 *xspacing, 4 * t -200 + height/2+yval[t], 2, 3);
      ellipse(t + 28 *xspacing, 4 * t -177 + height/2+yval[t], 2, 3);
      ellipse(3 * t + 14 *xspacing, 2 * t -150 + height/2+yval[t], 2, 3);
      
      //Light-tones
      ellipse(2 * t + 18 *xspacing, 3 * t -170 + height/2+yval[t], 1, 2);
      ellipse(2 * t + 22 *xspacing, 4 * t -180 + height/2+yval[t], 1, 2);
      ellipse(3 * t + 16 *xspacing, 3 * t -150 + height/2+yval[t], 1, 2);
      ellipse(t + 28 *xspacing, 4 * t -250 + height/2+yval[t], 1, 2);
      
      
      //Right-top-forehead
      ellipse(-t + 39 *xspacing, 2 * t - 280 + height/2+yval[t], 4, 4);
      ellipse(-t + 40 *xspacing, 2 * t - 180 + height/2+yval[t], 4, 4);
      ellipse(-t + 46 *xspacing, t - 230 + height/2+yval[t], 4, 4);
      ellipse(-t + 40 *xspacing, 3 * t - 210 + height/2+yval[t], 4, 4);
      ellipse(2 * -t + 50 *xspacing, t - 200 + height/2+yval[t], 4, 4);
      ellipse(2 * -t + 50 *xspacing, t - 170 + height/2+yval[t], 4, 4);
      
      ellipse(-t + 40 *xspacing, 2 * t - 100 + height/2+yval[t], 2, 3);
      ellipse(-t + 55 *xspacing, t - 148 + height/2+yval[t], 2, 3);
      ellipse(-t + 50 *xspacing, t - 148 + height/2+yval[t], 2, 3);
      ellipse(-t + 39 *xspacing, 3 * t - 280 + height/2+yval[t], 2, 3);
      
      ellipse(-t + 39 *xspacing, t - 140 + height/2+yval[t], 1, 3);
      ellipse(-t + 40 *xspacing, 4 * t - 330 + height/2+yval[t], 1, 2);
      ellipse(-t + 39 *xspacing, t - 170 + height/2+yval[t], 1, 2);
      ellipse(-t + 39 *xspacing, t - 190 + height/2+yval[t], 1, 2);
      ellipse(t + 24 *xspacing, 2 * t -190 + height/2+yval[t], 1, 4);
      ellipse(-t + 45 *xspacing, t - 148 + height/2+yval[t], 1, 2);
      ellipse(-t + 50 *xspacing, t - 121 + height/2+yval[t], 1, 2);
      ellipse(-t + 40 *xspacing, 2 * t - 130 + height/2+yval[t], 1, 2);
      
      //Right-bottom to right face
      ellipse(2 * -t + 50 *xspacing, 3 * t + 14 + height/2+yval[t], 4, 4);
      ellipse(-t + 50 *xspacing, 3 * t -40 + height/2+yval[t], 4, 4);
      
      //Bottom-left fur
      ellipse(t + 7 *xspacing, -t + 100 + height/2+yval[t], 4, 4);
      ellipse(t + 10 *xspacing, 3 * -t + 240 + height/2+yval[t], 4, 4);
      
      ellipse(3 * t + 10 *xspacing, -2 * t + 280 + height/2+yval[t], 4, 4);
      ellipse(3 * t + 5 *xspacing, -2 * t + 235 + height/2+yval[t], 4, 4);
      ellipse(2 * t + 7 *xspacing, -t + 200 + height/2+yval[t], 4, 4);
      
      ellipse(2 * t + 19 *xspacing, -2 * t + 305 + height/2+yval[t], 4, 4);
      ellipse(t + 27 *xspacing, -2 * t + 309 + height/2+yval[t], 4, 4);
      ellipse(t + 29 *xspacing, -2 * t + 350 + height/2+yval[t], 4, 4);
      
      ellipse(2 * t + 6 *xspacing, -t + 140 + height/2+yval[t], 2, 3);
      ellipse(t + 5 *xspacing, -t + 97 + height/2+yval[t], 2, 3);
      ellipse(2 * t + 10 *xspacing, -2 * t + 280 + height/2+yval[t], 2, 3);
      ellipse(3 * t + 8 *xspacing, -2 * t + 250 + height/2+yval[t], 2, 3);
      ellipse(t + 16 *xspacing, -t + 150 + height/2+yval[t], 2, 3);
      ellipse(3 * t + 12 *xspacing, -2 * t + 310 + height/2+yval[t], 2, 3);
      ellipse(t + 18 *xspacing, -2 * t + 250 + height/2+yval[t], 2, 3);
      ellipse(t + 20 *xspacing, -2 * t + 300 + height/2+yval[t], 2, 3);
      ellipse(t + 29 *xspacing, -2 * t + 310 + height/2+yval[t], 2, 3);
      ellipse(t + 23 *xspacing, -2 * t + 350 + height/2+yval[t], 2, 3);
      ellipse(t + 31 *xspacing, -2 * t + 340 + height/2+yval[t], 2, 3);
      
      ellipse(2 * t + 5 *xspacing, -t + 150 + height/2+yval[t], 1, 2);
      ellipse(t + 14 *xspacing, -t + 150 + height/2+yval[t], 1, 2);
      ellipse(t + 14 *xspacing, -t + 200 + height/2+yval[t], 1, 2);
      ellipse(3 * t + 7 *xspacing, -2 * t + 250 + height/2+yval[t], 1, 2);
      ellipse(3 * t + 10 *xspacing, -2 * t + 310 + height/2+yval[t], 1, 2);
      ellipse(3 * t + 15 *xspacing, -2 * t + 310 + height/2+yval[t], 1, 2);
      ellipse(2 * t + 15 *xspacing, -2 * t + 260 + height/2+yval[t], 1, 2);
      ellipse(t + 26 *xspacing, -2 * t + 350 + height/2+yval[t], 1, 2);
      ellipse(t + 29 *xspacing, -2 * t + 330 + height/2+yval[t], 1, 2);
      ellipse(t + 24 *xspacing, -2 * t + 300 + height/2+yval[t], 1, 2);
      ellipse(t + 31 *xspacing, -2 * t + 310 + height/2+yval[t], 1, 2);
      ellipse(t + 31 *xspacing, -2 * t + 360 + height/2+yval[t], 1, 2);
      
      //Bottom-right fur
      //Right 
      ellipse(-t + 57 *xspacing, 3.4 * -t + 180 + height/2+yval[t], 4, 4);
      ellipse(-t + 50 *xspacing, 3 * -t + 310 + height/2+yval[t], 4, 4);
      ellipse(-t + 48 *xspacing, 2 * -t + 267 + height/2+yval[t], 4, 4);
      ellipse(-t + 47 *xspacing, 3.4 * -t + 378 + height/2+yval[t], 4, 4);
      ellipse(-t + 46 *xspacing, 2 * -t + 290 + height/2+yval[t], 4, 4);
      ellipse(-t + 46 *xspacing, 2 * -t + 290 + height/2+yval[t], 4, 4);
      ellipse(-t + 52 *xspacing, 2 * -t + 290 + height/2+yval[t], 4, 4);
      ellipse(-t + 56 *xspacing, 2 * -t + 200 + height/2+yval[t], 4, 4);
      
      ellipse(-t + 55 *xspacing, 2 * -t + 100 + height/2+yval[t], 2, 3);
      ellipse(-t + 58 *xspacing, 2 * -t + 270 + height/2+yval[t], 2, 3);
      ellipse(-t + 58 *xspacing, 2 * -t + 220 + height/2+yval[t], 2, 3);
      
      ellipse(-t + 58 *xspacing, 2 * -t + 250 + height/2+yval[t], 1, 2);
      ellipse(-t + 54 *xspacing, 2 * -t + 200 + height/2+yval[t], 1, 2);
      ellipse(-t + 55 *xspacing, 2 * -t + 130 + height/2+yval[t], 1, 2);
      ellipse(-t + 55 *xspacing, 2 * -t + 150 + height/2+yval[t], 1, 2);
      ellipse(-t + 60 *xspacing, 3 * -t + 220 + height/2+yval[t], 1, 2);
      //Middle
          
      //Left
      //Right
      ellipse(-t + 50.5 *xspacing, -t + 164 + height/2+yval[t], 4, 4);
      ellipse(-t + 52 *xspacing, 3 * -t + 270 + height/2+yval[t], 4, 4);
      ellipse(-t + 52 *xspacing, -t + 160 + height/2+yval[t], 4, 4);
      
      ellipse(-t + 45 *xspacing, t - 128 + height/2+yval[t], 4, 4);
      
      
      ellipse(-t + 47 *xspacing, -t + 240 + height/2+yval[t], 2, 3);
      
      ellipse(-t + 50 *xspacing, -t + 180 + height/2+yval[t], 1, 2);
      ellipse(-t + 54 *xspacing, -t + 210 + height/2+yval[t], 1, 2);
      ellipse(-t + 48 *xspacing, -t + 270 + height/2+yval[t], 1, 2);
      ellipse(-t + 47 *xspacing, -t + 210 + height/2+yval[t], 1, 2);
      ellipse(-t + 49 *xspacing, -t + 210 + height/2+yval[t], 1, 2);
      ellipse(-t + 48 *xspacing, 2 * -t + 300 + height/2+yval[t], 1, 2);
      ellipse(-t + 45 *xspacing, 2 * -t + 300 + height/2+yval[t], 1, 2);
      
      //Far-right
      ellipse(-t + 52 *xspacing, -t + 130 + height/2+yval[t], 1, 2);
    }
  }
}

class Ears {
  float dx; // Value for incrementing X, to be calculated as a function of period and xspacing
  int xspacing; // How far apart should each horizontal location be spaced
  float period;
  float[] yval; // Using an array to store height values for the wave
  float theta;
  int w; // Width of entire wave
  float amp;
  
  Ears() {
    xspacing = 10;   // How far apart should each horizontal location be spaced - change
    theta = 0.0;  // Start angle at 0
    period = 350.0;  // How many pixels before the wave repeats - change
    w = width+16;
    dx = (TWO_PI / period) * xspacing;
    yval = new float[w/xspacing];
    amp = 10.0; // Height of wave - change
  }
  
  void calcWave() {
  // Increment theta (try different values for 'angular velocity' here
  theta += 0.6; //Slows/shortens graph - change
  
  // For every x value, calculate a y value with sine function
  for (int i = 0; i < yval.length; i++) { //Loops at every value
    yval[i] = amp * sin(theta); //tan repeats -change function
    theta+=dx;
   }
  }

  void renderWave() {
    noStroke();
    fill(255);  
    // A simple way to draw the wave with an ellipse at each location
    for (int t = 0; t < yval.length; t++) {
      if (t * xspacing > 500) { 
        break;
      }
      //Left
      ellipse(-2 * t + 18 * xspacing, -t - 200 + height/2+yval[t], 2, 3);
      ellipse(-2 * t + 20 * xspacing, -2 * t - 180 + height/2+yval[t], 2, 3);
      ellipse(-t + 24 * xspacing, -t - 170 + height/2+yval[t], 2, 3);
      ellipse(-t + 22 * xspacing, -2 * t - 150 + height/2+yval[t], 2, 3);
      ellipse(-t + 24 * xspacing, -2 * t - 150 + height/2+yval[t], 2, 3);
      ellipse(-3 * t + 23.5 * xspacing, -t - 180 + height/2+yval[t], 2, 3);
      ellipse(-3 * t + 28 * xspacing, -2 * t - 170 + height/2+yval[t], 2, 3);
      ellipse(-3 * t + 24 * xspacing, -2 * t - 100 + height/2+yval[t], 2, 3);
      ellipse(-3 * t + 26 * xspacing, -t - 150 + height/2+yval[t], 2, 3);
      ellipse(-3 * t + 24.5 * xspacing, -t - 120 + height/2+yval[t], 2, 3);
      ellipse(-2 * t + 19.5 * xspacing, -t - 100 + height/2+yval[t], 2, 3);
      
      ellipse(-t + 17 * xspacing, -t - 240 + height/2+yval[t], 1, 2); 
      ellipse(-2 * t + 24 * xspacing, -2 * t - 190 + height/2+yval[t], 1, 2);
      ellipse(-3 * t + 24 * xspacing, -t - 130 + height/2+yval[t], 1, 2);
      ellipse(-3 * t + 23 * xspacing, -2 * t - 130 + height/2+yval[t], 1, 2);
      ellipse(-2 * t + 23 * xspacing, -2 * t - 160 + height/2+yval[t], 1, 2);
      ellipse(3 * -t + 23 * xspacing, -2 * t - 150 + height/2+yval[t], 1, 2);
      
      //Right
      ellipse(2 * t + 39 * xspacing, -t - 200 + height/2+yval[t], 2, 3);
      ellipse(2 * t + 38 * xspacing, -2 * t - 170 + height/2+yval[t], 2, 3);
      ellipse(t + 40 * xspacing, -2 * t - 240 + height/2+yval[t], 2, 3);
      ellipse(t + 39 * xspacing, -2 * t - 250 + height/2+yval[t], 2, 3);
      ellipse(t + 42.5 * xspacing, -t - 245 + height/2+yval[t], 2, 3);
      
      ellipse(t + 40 * xspacing, -t - 300 + height/2+yval[t], 1, 2); 
      ellipse(t + 42 * xspacing, -t - 270 + height/2+yval[t], 1, 2); 
      ellipse(t + 40 * xspacing, -t - 290 + height/2+yval[t], 1, 2); 
      ellipse(2 * t + 37.5 * xspacing, -2 * t - 190 + height/2+yval[t], 1, 2);
      
    }
    for (int t = 0; t < yval.length; t++) {
      if (t * xspacing > 400) { 
        break;
      }
      //Left
      ellipse(-4 * t + 24 * xspacing, -t - 200 + height/2+yval[t], 2, 3);
      ellipse(-3 * t + 21 * xspacing,-200-pow(1.06,-1.2*t)+height/2+yval[t], 2, 3);
      ellipse(-3*t+21.5*xspacing,-150-pow(5*t,0.6)+pow(1.061,1.1*t)+height/2+((pow(5000*t,0.5)+pow(0.5*t,2))*0.002)*yval[t],2,3);
      ellipse(-3*t+21*xspacing,-190-pow(5*t,0.6)+pow(1.061,1.1*t)+height/2+((pow(5000*t,0.5)+pow(0.5*t,2))*0.002)*yval[t],1,2);
      
      //Right
      ellipse(t + 40 * xspacing, -t - 310 + height/2+yval[t], 2, 3);
      ellipse(3*t+37*xspacing,-230-pow(5*t,0.6)+pow(1.061,1.1*t)+height/2+((pow(5000*t,0.5)+pow(0.5*t,2))*0.002)*yval[t],2,3);
      
    }
    for (int t = 0; t < yval.length; t++) {
      if (t * xspacing > 200) { 
        break;
      }
      //Left
      ellipse(-3*t+15*xspacing,-260-pow(5*t,0.6)+pow(1.061,1.1*t)+height/2+((pow(5000*t,0.5)+pow(0.5*t,2))*0.002)*yval[t],2,3);
      ellipse(-3*t+14*xspacing,-240-pow(5*t,0.6)+pow(1.061,1.1*t)+height/2+((pow(5000*t,0.5)+pow(0.5*t,2))*0.002)*yval[t],1,2);
      ellipse(-3*t+14.5*xspacing,-260-pow(1.06,-1.2*t)+height/2+yval[t],2,3);
      
      //Right
      ellipse(3 * t + 39.8 * xspacing, -2 * t - 290 + height/2+yval[t], 2, 3);
      ellipse(3 * t + 41.5 * xspacing, -t - 280 + height/2+yval[t], 2, 3);
      
      ellipse(3 * t + 40.5 * xspacing, -t - 300 + height/2+yval[t], 1, 2);
      ellipse(t + 41 * xspacing, -t - 330 + height/2+yval[t], 1, 2); 
      
    }
    for (int t = 0; t < yval.length; t++) {
      if (t * xspacing > 300) { 
        break;
      }
      //Left
      ellipse(-3*t+17*xspacing,-220-pow(5*t,0.6)+pow(1.061,1.1*t)+height/2+((pow(5000*t,0.5)+pow(0.5*t,2))*0.002)*yval[t],1,2);
      ellipse(-3 * t + 18 * xspacing,-240-pow(1.06,-1.2*t)+height/2+yval[t], 2, 3);
      
      //Right
      ellipse(3 * t + 40.5 * xspacing, -t - 190 + height/2+yval[t], 2, 3);
      ellipse(3 * t + 39 * xspacing, -t - 250 + height/2+yval[t], 2, 3);
      ellipse(2 * t + 40 * xspacing, -t - 300 + height/2+yval[t], 2, 3);
      ellipse(3 * t + 39.5 * xspacing,-270-pow(1.06,-1.2*t)+height/2+yval[t], 2, 3);
      ellipse(3*t+40*xspacing,-220-pow(5*t,0.6)+pow(1.061,1.1*t)+height/2+((pow(5000*t,0.5)+pow(0.5*t,2))*0.002)*yval[t],2,3);
      
      ellipse(3 * t + 39.5 * xspacing, -t - 230 + height/2+yval[t], 1, 2);
      ellipse(3 * t + 40 * xspacing, -t - 210 + height/2+yval[t], 1, 2);
      ellipse(3 * t + 40.5 * xspacing, -2 * t - 170 + height/2+yval[t], 1, 2);
    }
  }
}  

class Snowflake {

  PImage img;
  PVector pos;
  PVector vel;
  PVector acc;
  float angle;
  float dir;
  float xOff;
  float r;
  
  Snowflake(float sx, float sy, PImage simg) {
    float x = sx;
    float y = sy;
    img = simg;
    pos = new PVector(x, y);
    vel = new PVector(0, 0);
    acc = new PVector();
    angle = random(TWO_PI);
    dir = (random(1) > 0.5) ? 1 : -1;
    xOff = 0; //Sway sin wave; oscillating motion, not force
    r = getRandomSize();
  }
  
  void applyForce(PVector force) {
    // Parallax Effect hack
    PVector f = force.copy(); 
    f.mult(r); //Multiply by size if bigger, stronger

    // PVector f = force.copy();
    // f.div(mass);
    acc.add(f);
  }

  void randomize() { 
    float x = random(width);
    float y = random(-100, -10);
    pos = new PVector(x, y);
    vel = new PVector(0, 0);
    acc = new PVector();
    r = getRandomSize();
  }

  void update() {

    xOff = sin(angle * 2) * 2 * r; //Propery of object
    //Do not need to map because it goes between -1 and 1, in direction variable

    vel.add(acc); //Terminal velocity of snow - related to size, slows
    vel.limit(r * 0.2); //Max vel

    if (vel.mag() < 1) { //Reduces frame rate
      vel.normalize();
    }

    pos.add(vel);
    acc.mult(0);

    if (pos.y > height + r) { //Recyles back up to top
      randomize();
    }

    // Wrapping Left and Right
    if (pos.x < -r) {
      pos.x = width + r;
    }
    if (pos.x > width + r) {
      pos.x = -r;
    }

    angle += dir * vel.mag() / 200; //Random direction/rotation based on velocity - spinning slower because divided sign

  }

  void render() {
  pushMatrix();
    translate(pos.x + xOff, pos.y);
    rotate(angle);
    imageMode(CENTER);
    image(img, 0, 0, r, r); //Draw current with size at postions
    popMatrix();
  }
}
