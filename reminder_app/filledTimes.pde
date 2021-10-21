class filledTime {
  int start;
  int end;
  

  int startHours;
  int startMinutes;
  int endHours;
  int endMinutes;

  boolean startAM;
  boolean endAM;

  filledTime(int start, int end) {
    this.start = start;
    this.end = end;
    
    startAM = false;
    endAM = false;

    convertTimes();
  }

  public void convertTimes() {

    startMinutes = start%60;
    startHours = floor(start/60);

    endMinutes = end%60;
    endHours = floor(end/60);

    if (startHours >= 12) {
      if (startHours > 12) {
        startHours-=12;
      }
      startAM = false;
    } else {
      startAM = true;
    }
    if (endHours >= 12) {
      if (endHours > 12) {
        endHours-=12;
      }
      endAM = false;
    } else {
      endAM = true;
    }

    if (startHours == 0) {
      startHours = 12;
      startAM = true;
    } else if (startHours > 12) {
      startHours-=12;
      startAM = false;
    }

    if (endHours == 0) {
      endHours = 12;
      endAM = true;
    } else if (endHours > 12) {
      endHours-=12;
      endAM =false;
    }
  }

  public void remind() {
    println("REMINDER: You have an event from " + startHours + ":" + nf(startMinutes, 2, 0) + AMorPM(startAM) + "to " + endHours + ":" + nf(endMinutes, 2, 0) + AMorPM(endAM)) ;
  }

  public String AMorPM(boolean AM) {
    String result = "__";
    if (AM == true) {
      result = " AM ";
    } else {
      result = " PM ";
    }
    return result;
  }
}
