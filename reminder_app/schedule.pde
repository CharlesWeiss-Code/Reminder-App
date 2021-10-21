class schedule {
  boolean[] sched;
  ArrayList<filledTime> ft;

  schedule() {
    sched = new boolean[day];
    ft = new ArrayList<filledTime>();
  }

  public void fillSchedule() {
    for (int i = 0; i < day; i++) {
      if (random(10) + threshold > 5) {
        sched[i] = true;
      } else {
        sched[i] = false;
      }
    }
  }

  public void findStartandEnd() {
    int start = -1;
    int end = -1;
    for (int i = 0; i < day; i++) {
      if (sched[i] == true) {
        start = i;
        for (int j = i; j <= day-1; j++) {
          if (j != day-1) {
            if (sched[j] == true && sched[j+1] == false) {
              end = j;
              i = j;
              if (end - start > 1) {
                ft.add(new filledTime(start, end));
                break;
              }
            }
          } else {
            end = day;
            i = j;
            if (end - start > 1) {
              ft.add(new filledTime(start, end));
              break;
            }
          }
        }
      }
    }
  }

  public void remind() {
    for (filledTime f : ft) {
      f.remind();
    }
  }

  public void showSchedule() {
    push();
    stroke(255);
    push();
    textAlign(LEFT);
    text("12AM", spacing, 47);
    pop();
    push();
    textAlign(CENTER);
    text("12PM", width/2, 47);
    pop();
    push();
    textAlign(RIGHT);
    text("12AM", width-spacing, 47);
    pop();
    pop();
    for (filledTime f : ft) {
      float start = map(f.start, 0, day, spacing, width-spacing);
      float end = map(f.end, 0, day, spacing, width-spacing);
      push();
      rectMode(CORNERS);
      noStroke();
      fill(chooseColorBasedOnTime(f.start, f.end));
      rect(start, 50, end, height-50);
      pop();
    }
  }

  public color chooseColorBasedOnTime(int start, int end) {
    color result = color(0, 0, 0);
    if (end - start > 0 && end - start < 15) {
      result = color(255, 0, 0);
    } else if (end - start >= 15 && end - start < 60) {
      result = color(200, 15, 50);
    } else if (end - start >=60 && end - start < 180) {
      result = color(0, 20, 120);
    } else if (end - start >=180 && end - start < 300) {
      result = color(0, 255, 0);
    }
    return result;
  }


  public void fixedSchedule() {
    for (int i = 0; i < day; i++) {
      if (i > 20 && i < 740) {
        sched[i] = true;
      } else {
        sched[i] = false;
      }
    }
  }
}
