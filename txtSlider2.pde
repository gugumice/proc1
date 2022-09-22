class txtSlider{
  private int x,y,idx, showTime, stringWidth;
  private PFont fnt;
  private color txtColor, bgColor;
  private float h, timer,vPad,fadeSpd, initX, W;
  private int alpha;
  private String[] txtLines;
  txtSlider(int tempX, int tempY, String[] tempTxtLines, int tempShowSecs, String tempFntName, int tempFntSize, color tempTxtColor, color tempBgColor, float tempfadeSpd)
  {
    x=tempX;
    initX=tempX;
    y=tempY;
    txtLines=tempTxtLines;
    showTime = tempShowSecs*1000;
    txtColor=tempTxtColor;
    bgColor=tempBgColor;
    h=tempFntSize;
    fnt=createFont(tempFntName,h);
    idx=0;
    alpha=0;
    fadeSpd=tempfadeSpd;
    timer=millis();
    vPad = .3;
    stringWidth=int(textWidth(txtLines[idx]));
    W=(width-x)*1.6;
  };
  void draw(){
    if (timer+showTime>millis()){
      //Fade in
      if (alpha<256){
        alpha+=fadeSpd;
      }
      else{
      //  //Scroll text
        if (stringWidth+x>W){
          x-=fadeSpd;
          //println(stringWidth,x,stringWidth+x);
      //    x-=fadeSpd/2;
         timer=millis();
        };
      };
    }else
    {
      //Fade out
      if (alpha>0){
        alpha-=fadeSpd;
      }
      else{
       //Next line  
        idx++;
        stringWidth=int(textWidth(txtLines[idx % txtLines.length]));
        timer=millis();
        alpha=0;
        x=int(initX);
        //println(txtLines[idx % txtLines.length], stringWidth);
      };
    };
    show();
};
  private void show(){
    noStroke();
    fill(bgColor);
    rect(initX,y,width,h+h*vPad);
    fill(txtColor,alpha);
    textFont(fnt);
    text(txtLines[idx % txtLines.length],x,y+h);
    fill(BACKGROUND);
    rect(0,y,initX,h+h*vPad);
  };
};
