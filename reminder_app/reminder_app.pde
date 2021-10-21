// make the schedule store what you have during what times

schedule s;
int day = 24*60;
float threshold = -4.8;
int spacing = 20;

void setup() {
  size(1200,400);
  s = new schedule();
  s.fillSchedule();
  // used for testing 
  //s.fixedSchedule();
  s.findStartandEnd();
  s.remind();
}

void draw() {
  background(51);
  s.showSchedule();
}
