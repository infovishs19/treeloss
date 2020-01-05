class Region  implements Comparable<Region> {

  String region;
  int jahr;
  float km2;

  Region(String region, int jahr, float km2) {
    this.region = region;
    this.jahr = jahr;
    this.km2 = km2;
  }

  @Override     
    public int compareTo(Region other) {          
    if (this.jahr > other.jahr) {
      return -1;
    } else if (this.jahr < other.jahr) {
      return 1;
    } else return 0;
  }
}
