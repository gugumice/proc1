class digitalClock{
  private int x,y,w,h;
  private color colFr, colBk, colTxt;
  private PFont fnt;
  private String[] clck = new String[2];
  digitalClock(int tempX,int tempY,int tempW,int tempH,String tempFntName, color tempColTxt, color tempColFr, color tempColBk){
    x=tempX;
    y=tempY;
    w=tempW;
    h=tempH;
    fnt = createFont(tempFntName,h,true);
    textFont(fnt);
    //textSize(h);
    w=int(textWidth("88:88"));
    colFr=tempColFr;
    colBk=tempColBk;
    colTxt=tempColTxt;
  };
 
  void draw(){
    clck[0] = nf(hour(),2);
    clck[1] = nf(minute(),2);
    String strTime=join(clck,":");
    noStroke();
    fill(colBk);
    rect(x+5,y+5,w,h);
    
    fill(colFr);
    rect(x,y,w,h);
    
    fill(colTxt);
    textFont(fnt);
    text(strTime,x,y+(h-h*.1));
  
  };
  
};
