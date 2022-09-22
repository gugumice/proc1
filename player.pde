color BACKGROUND = color(0,80,90);
color TEXT_COLOR = color(255,255,255); 
String[] txt_lines;
txtSlider newsLine;
//txtSlider newsLine;
//analogClock clck;
digitalClock dclk;

String[] readText(String filename){
    String lines[] = null;
    try
    {
      lines=loadStrings(filename);
    }
    catch(Exception e)
    {
      println(e);
    }
    if (lines==null){
      lines=new String[3];
      for (int i=0;i<3;i++){
        lines[i] = "*  *  *";
      };
    };
  return(lines);
  };
  
void setup(){
size(1200,800);
background(BACKGROUND);
txt_lines = readText("/home/gunars/sketchbook/data/news.txt");
//newsLine=new txtSlider(170,height-60,txt_lines,5,"Ubuntu",TEXT_COLOR,color(183,214,13),40,2,3);
//clck=new analogClock(40,height-80,40);
newsLine = new txtSlider(50,height-105,txt_lines,5,"Ubuntu Mono",40,color(216,250,5),color(0,0,255), 3);
dclk=new digitalClock(0,height-110,200,60,"Ubuntu Mono",color(255,255,255),color(255,0,0),color(50));  
//printArray(txt_lines);
};
void draw()
{
//newsLine.draw();
fill(BACKGROUND);
newsLine.draw();
dclk.draw();
}
